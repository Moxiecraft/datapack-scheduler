execute unless data storage scheduler:queue flags{enabled:1b} run return 0

#Update qsize to actually reflect jobs in the queue
execute store result score #qsize dps_qsize run data get storage scheduler:queue queue

# Tick-mode driver (minimal when idle)
scoreboard players add #tick_calls dps_tick 1
execute if score #qsize dps_qsize matches ..0 run return 0

execute store result score #now dps_now run time query gametime
scoreboard players set #proc dps_proc 0
scoreboard players set #rot dps_rot 0

# Max 32 steps; step_once enforces #budget.
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
function scheduler:internal/core/step_once
