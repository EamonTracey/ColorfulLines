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

let package = Package(
    name: "ColorfulLinesPreferences",
    platforms: [.iOS(.v14)],
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
