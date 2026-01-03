$data modify storage scheduler:queue new_job set value {delay_ticks:$(delay_ticks),type:"$(type)",payload:$(payload)}
function scheduler:internal/core/prepare_job
function scheduler:internal/core/enqueue_job
