# Datapack Scheduler

Namespace: Scheduler<br />
Minecraft: 1.21+<br />
Cooperative Task Scheduler for Datapacks<br />

The scheduler datapack provides a shared, lightweight task scheduler that other datapacks can depend on to run to run delayed or repeating logic **without needing their own tick functions.**

This reduces ecosystem overhead, avoids duplicated tick logic, and centralizes timing behavior.

## Features

- Cooperative Multi-tasking (NOT Async)
- Sequential task execution on main server thread
- Per-Tick Execution budget to avoid lag spikes
- Scheduling Macro Functions and passing that data to the handler (Like Events In Plugins)

Supports:
- Delayed Tasks
- Repeating Tasks
- Repeating Delayed Tasks
- Keyed Tasks enabling external cancellation

Task Auto-Cancellation when:
- Handler doesn't mark handled
- Handler exits with error

## Installation

Place scheduler in your datapacks folder. 

Run:

`/minecraft:reload.`

Verify Loading:

`/function scheduler:status`

## Registering Job Handlers (Callbacks)

Your datapack should add the following:

```json
pack-name/
    - pack.mcmeta
    - data/
        - pack-name/
            - function/
                handler.mcfunction
        - scheduler/
            - tags/
                -function/
                    job_handlers.json
```

In your job_handlers.json:

```json
{
    "values": [
        "pack-name:handler"
    ]
}
```

Job handlers will match the job type, execute the logic, and mark the job as handled.

### Job Contract

Job Data is found in `storage scheduler:queue tmp`

Fields:

```json
    tmp.type    - Job String Identifier
    tmp.payload - Arbitrary Data passed by the Handler
    tmp.key     - Optional Identifier used for external task cancellation
    tmp.repeat  - Used for repeating jobs
```

### Marking Job as Handled

`data modify storage scheduler:queue handled set value 1b`

If not done:
    - One shot jobs are discarded
    - Repeating Jobs are Auto Cancelled
    
## Scheduler API

API calls use macro($) so arguments are explicit and safe.

### Schedule Once After Delay

```json
$function scheduler:task_schedule_after {
    delay_ticks: 40,
    type: "my_pack:job_name",
    payload: {}
}
```

### Schedule Repeating Interval

```json
$function scheduler:task_repeat_interval {
    interval_ticks: 20,
    type: "my_pack:tick_job"
    payload: {}
}
```

### Schedule Repeating Delay with Interval

```json
$function scheduler:task_repeat_interval_after {
    delay_ticks: 40,
    interval_ticks: 20,
    type: "my_pack:tick_job",
    payload: {}
}
```

### Keyed Scheduling

```json
$function scheduler:task_schedule_after_keyed {
    key: "do_cancellable_task",
    delay_ticks: 100,
    type: "my_pack:my_function",
    payload: {}
}
```

### Cancel Tasks

By Key:

`$function scheduler:task_cancel_key { key:"my_key" }`

By ID:

`function scheduler:task_cancel_id { id: 12 }`

A repeating task will be automatically cancelled if:

1. Handler didn't set `handled`

2. The Handler Sets:

`data modify storage scheduler:queue error_flag set value 1b`

3. The Handler Sets:

`data modify storage scheduler:queue cancel_repeat set value 1b`

### Budget Control

For safety, the scheduler enforces a per-tick job limit with a default of 8.

`/scoreboard players set #budget scheduler_budget 8`

Lower Values, Safe and Slower
Higher Values, Riskier and Faster

Adjust as needed for server load and datapack implementation.


## Debugging / Status

### Status

`/function scheduler:Status`

Will display:

- Queue Size
- Budget
- Tick Activity

### Storage

`/data get storage scheduler:queue`

Will display job information.


## Best Practices

- Avoid adding your own minecraft:tick function when you can schedule tasks instead.
- Use keys for long living or cancellable Tasks
- Keep handlers small and deterministic
- Always set handled when processing a Job
- Let the scheduler control timing, not your own Datapack

## How It Works

The scheduler maintains an internal queue with:

`storage scheduler:queue`

Each Tick:

- If the queue is empty -> return (Near Zero Overhead)

- Else -> execute up to #budget jobs, when their run_at time is due.

Jobs are dispatched by calling a job handler function supplied by other datapacks.


