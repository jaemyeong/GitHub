import ProjectDescription

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(url: "https://github.com/jaemyeong/ErrorKit.git", requirement: .upToNextMajor(from: "0.1.14")),
            .remote(url: "https://github.com/apple/swift-log.git", requirement: .upToNextMajor(from: "1.5.2")),
            .remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .upToNextMajor(from: "6.5.0")),
            .remote(url: "https://github.com/Quick/Quick.git", requirement: .upToNextMajor(from: "6.1.0")),
            .remote(url: "https://github.com/Quick/Nimble.git", requirement: .upToNextMajor(from: "11.2.1")),
            .remote(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", requirement: .upToNextMajor(from: "5.0.2")),
        ],
        productTypes: [:],
        baseSettings: .settings(),
        targetSettings: [:],
        projectOptions: [:]
    ),
    platforms: [.iOS]
)
