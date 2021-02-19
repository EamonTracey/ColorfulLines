// swift-tools-version:5.2

import PackageDescription
import Foundation

let theosPath = ProcessInfo.processInfo.environment["THEOS"]!

let libFlags: [String] = [
    "-F\(theosPath)/vendor/lib",
    "-F\(theosPath)/lib",
    "-I\(theosPath)/vendor/include",
    "-I\(theosPath)/include"
]

let package = Package(
    name: "ColorfulLinesPreferences",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ColorfulLinesPreferences",
            targets: ["ColorfulLinesPreferences"]
        ),
    ],
    targets: [
        .target(
            name: "ColorfulLinesPreferences",
            swiftSettings: [.unsafeFlags(libFlags)]
        ),
    ]
)
