import Foundation

// Semaphore

// The main group is blocking the main thread until the async task is done.
// Otherwise the program will terminate before the async task can even run.

let semaphore = DispatchSemaphore(value: 0)

print("Start: \(Date())")
let delay = DispatchTime.now() + 2.0

// The signal() must be called from a different thread since the
// main thread is blocked.
DispatchQueue.global().asyncAfter(deadline: delay, execute: {
    print("Delay: \(Date())")
    semaphore.signal()
})

// Use wait() to wait for the semaphore signal.
semaphore.wait()
print("Done:  \(Date())")
