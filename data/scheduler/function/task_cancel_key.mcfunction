$data modify storage scheduler:queue cancel_ctx set value {key:"$(key)"}
function scheduler:internal/core/cancel_key with storage scheduler:queue cancel_ctx
