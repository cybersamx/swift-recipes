import Foundation

// DispatchGroup.notify

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

    // DispatchGroup will wait until leave() is called. Notify() then notifies
    // a queue that the task is done.
    concurrentGroup.notify(queue: DispatchQueue.global(), execute: {
        print("Done:  \(Date())")
        mainGroup.leave()
    })
}

mainGroup.wait()
