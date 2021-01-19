// swift-tools-version:5.2

import PackageDescription
import Foundation

guard let theosPath = ProcessInfo.processInfo.environment["THEOS"],
      let projectDir = ProcessInfo.processInfo.environment["PWD"]
else {
    fatalError("""
    THEOS env var not set. If you're using Xcode, open this package with `make dev`
    """)
}

let libFlags: [String] = [
    "-F\(theosPath)/vendor/lib", "-F\(theosPath)/lib",
    "-I\(theosPath)/vendor/include", "-I\(theosPath)/include"
]

let cFlags: [String] = libFlags + [
    "-Wno-unused-command-line-argument", "-Qunused-arguments",
]

let cxxFlags: [String] = [
]

let swiftFlags: [String] = libFlags + [
]

let package = Package(
    name: "ColorfulLines",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ColorfulLines",
            targets: ["ColorfulLines"]
        ),
    ],
    targets: [
        .target(
            name: "ColorfulLinesC",
            cSettings: [.unsafeFlags(cFlags)],
            cxxSettings: [.unsafeFlags(cxxFlags)]
        ),
        .target(
            name: "ColorfulLines",
            dependencies: ["ColorfulLinesC"],
            swiftSettings: [.unsafeFlags(swiftFlags)]
        ),
    ]
)
