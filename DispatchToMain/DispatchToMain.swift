import Foundation


@objc public class DispatchToMain: NSObject {

    @objc public func dispatchToMainAsync(_ block: @escaping () -> Void) {
        print("Hello from Swift")
        if Thread.isMainThread {
            print("Already on main thread")
            block()
        } else {
            print("Dispatching to main thread in an async way!")
            DispatchQueue.main.async {
                block()
            }
        }
    }

    @objc public func dispatchToMainSync(_ block: @escaping () -> Void) {
        print("Hello from Swift")
        if Thread.isMainThread {
            print("Already on main thread")
            block()
        } else {
            print("Dispatching to main thread in a sync way!")
            DispatchQueue.main.sync {
                block()
            }
        }
    }
}