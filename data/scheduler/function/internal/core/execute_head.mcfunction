data remove storage scheduler:queue queue[0]
scoreboard players remove #qsize dps_qsize 1
scoreboard players add #proc dps_proc 1

data remove storage scheduler:queue handled
data remove storage scheduler:queue cancel_repeat
data remove storage scheduler:queue error_flag
data remove storage scheduler:queue error

function scheduler:internal/core/dispatch

execute unless data storage scheduler:queue {handled:1b} run data modify storage scheduler:queue cancel_repeat set value 1b
execute if data storage scheduler:queue {error_flag:1b} run data modify storage scheduler:queue cancel_repeat set value 1b

execute if data storage scheduler:queue {tmp:{repeat:1b}} unless data storage scheduler:queue {cancel_repeat:1b} run function scheduler:internal/core/reenqueue_repeat

data remove storage scheduler:queue tmp
