execute unless data storage scheduler:queue work[0] run return 0
data modify storage scheduler:queue tmp_cancel set from storage scheduler:queue work[0]
data remove storage scheduler:queue work[0]
execute store result score #tmpid dps_tmp run data get storage scheduler:queue tmp_cancel.id 1
execute unless score #tmpid dps_tmp = #cancel_id dps_cancel run function scheduler:internal/core/cancel_keep
function scheduler:internal/core/cancel_id_loop
