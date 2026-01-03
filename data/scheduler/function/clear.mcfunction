data remove storage scheduler:queue queue
data remove storage scheduler:queue tmp
data remove storage scheduler:queue new_job
data remove storage scheduler:queue work
data remove storage scheduler:queue tmp_cancel
data remove storage scheduler:queue cancel_ctx
scoreboard players set #qsize dps_qsize 0
tellraw @a[tag=dpsched_debug] [{"text":"[dpsched] queue cleared","color":"yellow"}]
