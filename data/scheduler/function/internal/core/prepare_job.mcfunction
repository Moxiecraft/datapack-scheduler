execute store result score #now dps_now run time query gametime

scoreboard players add #id dps_id 1
execute store result storage scheduler:queue new_job.id int 1 run scoreboard players get #id dps_id

execute store result score #delay dps_runat run data get storage scheduler:queue new_job.delay_ticks 1
scoreboard players operation #job dps_runat = #now dps_now
scoreboard players operation #job dps_runat += #delay dps_runat
execute store result storage scheduler:queue new_job.run_at int 1 run scoreboard players get #job dps_runat

data remove storage scheduler:queue new_job.delay_ticks
