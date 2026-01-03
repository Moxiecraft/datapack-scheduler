execute if score #qsize dps_qsize matches ..0 run return 0
execute if score #proc dps_proc >= #budget dps_budget run return 0
execute if score #rot dps_rot >= #qsize dps_qsize run return 0

data modify storage scheduler:queue tmp set from storage scheduler:queue queue[0]
execute store result score #job dps_runat run data get storage scheduler:queue tmp.run_at 1

execute if score #job dps_runat <= #now dps_now run function scheduler:internal/core/execute_head
execute unless score #job dps_runat <= #now dps_now run function scheduler:internal/core/rotate_head
