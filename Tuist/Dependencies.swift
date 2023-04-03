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
            .remote(url: "https://github.com/yaslab/ULID.swift.git", requirement: .upToNextMajor(from: "1.2.0")),
            .remote(url: "https://github.com/apple/swift-collections.git", requirement: .upToNextMajor(from: "1.0.4")),
            .remote(url: "https://github.com/Moya/Moya.git", requirement: .upToNextMajor(from: "15.0.3")),
            .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .upToNextMajor(from: "5.6.4")),
            .remote(url: "https://github.com/OAuthSwift/OAuthSwift.git", requirement: .upToNextMajor(from: "2.2.0")),
        ],
        productTypes: [:],
        baseSettings: .settings(),
        targetSettings: [:],
        projectOptions: [:]
    ),
    platforms: [.iOS]
)
