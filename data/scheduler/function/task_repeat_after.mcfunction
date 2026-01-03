$data modify storage scheduler:queue new_job set value {delay_ticks:$(delay_ticks),type:"$(type)",payload:$(payload),repeat:1b,interval_ticks:$(delay_ticks)}
function scheduler:internal/core/prepare_job
function scheduler:internal/core/enqueue_job
