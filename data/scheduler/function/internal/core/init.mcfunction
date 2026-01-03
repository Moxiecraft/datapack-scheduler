scoreboard objectives add dps_qsize dummy
scoreboard objectives add dps_id dummy
scoreboard objectives add dps_proc dummy
scoreboard objectives add dps_rot dummy
scoreboard objectives add dps_runat dummy
scoreboard objectives add dps_now dummy
scoreboard objectives add dps_budget dummy
scoreboard objectives add dps_cancel dummy
scoreboard objectives add dps_tmp dummy
scoreboard objectives add dps_tick dummy

scoreboard players set #qsize dps_qsize 0
scoreboard players set #id dps_id 0
scoreboard players set #now dps_now 0
scoreboard players set #budget dps_budget 8
scoreboard players set #cancel_id dps_cancel 0
scoreboard players set #tmpid dps_tmp 0
scoreboard players set #tick_calls dps_tick 0

data remove storage scheduler:queue queue
data remove storage scheduler:queue work
data remove storage scheduler:queue tmp
data remove storage scheduler:queue new_job
data remove storage scheduler:queue tmp_cancel
data remove storage scheduler:queue cancel_ctx
data remove storage scheduler:queue handled
data remove storage scheduler:queue cancel_repeat
data remove storage scheduler:queue error_flag
data remove storage scheduler:queue error
