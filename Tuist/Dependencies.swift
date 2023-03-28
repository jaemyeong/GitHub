import ProjectDescription

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(url: "https://github.com/jaemyeong/ErrorKit.git", requirement: .upToNextMajor(from: "0.1.14")),
            .remote(url: "https://github.com/apple/swift-log.git", requirement: .upToNextMajor(from: "1.5.2")),
            .remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .upToNextMajor(from: "6.5.0")),
        ],
        productTypes: [:],
        baseSettings: .settings(),
        targetSettings: [:],
        projectOptions: [:]
    ),
    platforms: [.iOS]
)
