import Foundation

// DispatchQueue.concurrentPerform

// The main group is blocking the main thread until the async task is done.
// Otherwise the program will terminate before the async task can even run.

let mainGroup = DispatchGroup()
mainGroup.enter()

let delay = DispatchTime.now() + 2.0

let concurrentGroup = DispatchGroup()
let _ = DispatchQueue.global()

// Use concurrentPerform to perform a batch of 4 similar tasks concurrently
print("Start:   \(Date())")
DispatchQueue.concurrentPerform(iterations: 4) { index in
    concurrentGroup.enter()

    DispatchQueue.global().asyncAfter(deadline: delay, execute: {
        print("Delay: \(index) \(Date())")
        concurrentGroup.leave()
    })
}

concurrentGroup.notify(queue: DispatchQueue.global(), execute: {
    print("Done:    \(Date())")
    mainGroup.leave()
})

mainGroup.wait()
