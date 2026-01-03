data modify storage scheduler:queue new_job set from storage scheduler:queue tmp
data modify storage scheduler:queue new_job.delay_ticks set from storage scheduler:queue tmp.interval_ticks
function scheduler:internal/core/prepare_job
function scheduler:internal/core/enqueue_job
