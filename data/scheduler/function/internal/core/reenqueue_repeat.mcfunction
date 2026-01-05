scoreboard players set #now dps_tmp 0
execute store result score #now dps_tmp run time query gametime

scoreboard players set #int dps_tmp 0
execute store result score #int dps_tmp run data get storage scheduler:queue tmp.interval_ticks 1

scoreboard players operation #now dps_tmp += #int dps_tmp

execute store result storage scheduler:queue tmp.run_at int 1 run scoreboard players get #now dps_tmp

data modify storage scheduler:queue queue append from storage scheduler:queue tmp
scoreboard players add #qsize dps_qsize 1

data remove storage scheduler:queue tmp