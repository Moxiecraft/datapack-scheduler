data modify storage scheduler:queue queue append from storage scheduler:queue new_job
scoreboard players add #qsize dps_qsize 1
data remove storage scheduler:queue new_job
