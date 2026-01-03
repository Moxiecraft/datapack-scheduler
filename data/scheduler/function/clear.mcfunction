data remove storage scheduler:queue queue
data remove storage scheduler:queue tmp
data remove storage scheduler:queue new_job
data remove storage scheduler:queue work
data remove storage scheduler:queue tmp_cancel
data remove storage scheduler:queue cancel_ctx
scoreboard players set #qsize dps_qsize 0
tellraw @a[tag=scheduler_debug] [{"text":"[scheduler_debug] Queue cleared","color":"yellow"}]

