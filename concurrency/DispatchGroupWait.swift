import Foundation

// DispatchGroup.wait

// The main group is blocking the main thread until the async task is done.
// Otherwise the program will terminate before the async task can even run.

let mainGroup = DispatchGroup()
mainGroup.enter()

DispatchQueue.global().async {
    // Use DispatchGroup to group and execute a task asynchronously.
    let concurrentGroup = DispatchGroup()
    concurrentGroup.enter()

    print("Start: \(Date())")
    let delay = DispatchTime.now() + 2.0
    DispatchQueue.global().asyncAfter(deadline: delay, execute: {
        print("Delay: \(Date())")
        concurrentGroup.leave()
    })

    // Use wait() to wait for the dispatch group to finish in the queue.
    concurrentGroup.wait()
    mainGroup.leave()
}

mainGroup.wait()
print("Done:  \(Date())")
