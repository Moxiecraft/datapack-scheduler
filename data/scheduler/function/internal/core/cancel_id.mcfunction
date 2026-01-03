data modify storage scheduler:queue work set from storage scheduler:queue queue
data remove storage scheduler:queue queue
scoreboard players set #qsize dps_qsize 0
function scheduler:internal/core/cancel_id_loop
