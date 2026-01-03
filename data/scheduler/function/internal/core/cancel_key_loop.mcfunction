execute unless data storage scheduler:queue work[0] run return 0
data modify storage scheduler:queue tmp_cancel set from storage scheduler:queue work[0]
data remove storage scheduler:queue work[0]
$execute unless data storage scheduler:queue {tmp_cancel:{key:"$(key)"}} run function scheduler:internal/core/cancel_keep
function scheduler:internal/core/cancel_key_loop with storage scheduler:queue cancel_ctx
