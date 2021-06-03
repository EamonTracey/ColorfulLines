// swift-tools-version:5.3

import PackageDescription
import Foundation

let theosPath = "/Users/eamontracey/.theos"

let libFlags: [String] = [
    "-F\(theosPath)/vendor/lib",
    "-F\(theosPath)/lib",
    "-I\(theosPath)/vendor/include",
    "-I\(theosPath)/include"
]

let cFlags: [String] = libFlags + [
    "-Wno-unused-command-line-argument",
    "-Qunused-arguments",
]

let package = Package(
    name: "ColorfulLines",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "ColorfulLines",
            targets: ["ColorfulLines"]
        ),
    ],
    targets: [
        .target(
            name: "ColorfulLinesC",
            cSettings: [.unsafeFlags(cFlags)]
        ),
        .target(
            name: "ColorfulLines",
            dependencies: ["ColorfulLinesC"],
            swiftSettings: [.unsafeFlags(libFlags)]
        ),
    ]
)
