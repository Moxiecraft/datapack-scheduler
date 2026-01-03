$data modify storage scheduler:queue new_job set value {key:"$(key)",delay_ticks:$(delay_ticks),type:"$(type)",payload:$(payload),repeat:1b,interval_ticks:$(interval_ticks)}
function scheduler:internal/core/prepare_job
function scheduler:internal/core/enqueue_job
