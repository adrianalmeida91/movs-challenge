import UIKit

private var delegate: String? {
    NSClassFromString("XCTestCase") == nil ? NSStringFromClass(AppDelegate.self) : nil
}

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, delegate)
