# Execute the current head job (already copied into storage scheduler:queue tmp)

# Drop the head element from the queue (we will re-enqueue explicitly if needed)
data remove storage scheduler:queue queue[0]
scoreboard players remove #qsize dps_qsize 1
scoreboard players add #proc dps_proc 1

# Clear per-dispatch flags (must not be sticky)
data remove storage scheduler:queue handled
data remove storage scheduler:queue cancel_repeat
data remove storage scheduler:queue error_flag
data remove storage scheduler:queue error

# Call all registered handlers with the current tmp job as macro context
function scheduler:internal/core/dispatch

# Policy: if job was not handled or errored, cancel repeating
#execute unless data storage scheduler:queue {handled:1b} run data modify storage scheduler:queue cancel_repeat set value 1b
#execute if data storage scheduler:queue {error_flag:1b} run data modify storage scheduler:queue cancel_repeat set value 1b

execute if data storage scheduler:queue {error_flag:1b} if data storage scheduler:queue {tmp:{repeat:1b}} run data modify storage scheduler:queue cancel_repeat set value 1b
execute unless data storage scheduler:queue {handled:1b} if data storage scheduler:queue {tmp:{repeat:1b}} run data modify storage scheduler:queue cancel_repeat set value 1b

# Determine whether this job is repeating.
# IMPORTANT: NBT pattern matching like {interval_ticks:1} checks for a literal value of 1,
# not field existence. We detect existence using store success.
scoreboard players set #tmpid dps_tmp 0
execute store success score #tmpid dps_tmp run data get storage scheduler:queue tmp.interval_ticks 1

# Re-enqueue repeat jobs only when:
# - interval_ticks exists (or repeat:1b is explicitly present)
# - it was handled
# - it was not canceled / errored
execute if data storage scheduler:queue {handled:1b} unless data storage scheduler:queue {cancel_repeat:1b} unless data storage scheduler:queue {error_flag:1b} if score #tmpid dps_tmp matches 1 run function scheduler:internal/core/reenqueue_repeat
execute if data storage scheduler:queue {handled:1b} unless data storage scheduler:queue {cancel_repeat:1b} unless data storage scheduler:queue {error_flag:1b} if data storage scheduler:queue {tmp:{repeat:1b}} run function scheduler:internal/core/reenqueue_repeat

# Cleanup tmp for the next dispatch
data remove storage scheduler:queue tmp
