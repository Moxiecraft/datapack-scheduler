data remove storage scheduler:queue queue[0]
data modify storage scheduler:queue queue append from storage scheduler:queue tmp
scoreboard players add #rot dps_rot 1
data remove storage scheduler:queue tmp
