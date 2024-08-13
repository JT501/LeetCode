// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PlaygroundDependencies",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PlaygroundDependencies",
            targets: ["PlaygroundDependencies"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PlaygroundDependencies"),
        .testTarget(
            name: "PlaygroundDependenciesTests",
            dependencies: ["PlaygroundDependencies"]),
    ]
)

package.dependencies = [
    .package(url: "https://github.com/apple/swift-collections", from: "1.1.2")
]
package.targets = [
    .target(name: "PlaygroundDependencies",
        dependencies: [
            .product(name: "BitCollections", package: "swift-collections"),
.product(name: "DequeModule", package: "swift-collections"),
.product(name: "HashTreeCollections", package: "swift-collections"),
.product(name: "HeapModule", package: "swift-collections"),
.product(name: "OrderedCollections", package: "swift-collections"),
.product(name: "_RopeModule", package: "swift-collections"),
.product(name: "Collections", package: "swift-collections")
        ]
    )
]
