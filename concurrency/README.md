# Executing Concurrent Tasks Using Grand Central Dispatch

The primary framework for implementing concurrent tasks in Swift is Grand Central Dispatch (or GCD).

Some examples include:

* Waiting a concurrent task to finish can be accomplished using:
  * [DispatchGroup.wait()](DispatchGroupWait.swift) - DispatchGroup will block the current task until leave() is called.
  * [DispatchGroup.notify()](DispatchGroupNotify.swift) - DispatchGroup will block the current task until leave() is called and notify() notifies a queue that the task is done.
  * [DispatchSemaphore.wait()](SemaphoreWait.swift) - Semaphore will block the current task until signal() is called.
* Waiting a batch of concurrent tasks can be accomplished using:
  * [DispatchQueue.concurrentPerform()](DispatchQueueConcurrentPerform.swift) - Wait for many concurrent tasks to finish.

## Setup

Run the following:

```bash
$ swift DispatchGroupWait.swift
$ swift DispatchGroupNotify.swift
$ swift SemaphoreWait.swift
$ swift DispatchQueueConcurrentPerform.swift
```

## References

* [Apple API Reference: DispatchGroup](https://developer.apple.com/documentation/dispatch/dispatchgroup)
* [Apple API Reference: DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue)
