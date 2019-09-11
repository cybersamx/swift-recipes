import Foundation
//import PlaygroundSupport

//PlaygroundPage.current.needsIndefiniteExecution = true

DispatchQueue.global(qos: .userInitiated).async {
    let httpGroup = DispatchGroup()
    httpGroup.enter()

    print("Start: \(Date())")
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
        print("Delay \(Date())")
        httpGroup.leave()
    })

    httpGroup.wait()
    print("End \(Date())")
}

