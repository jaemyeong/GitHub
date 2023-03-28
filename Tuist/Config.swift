import ProjectDescription

let config = Config(
    compatibleXcodeVersions: [
        .upToNextMajor("14.2"),
    ],
    cloud: nil,
    cache: nil,
    swiftVersion: nil,
    plugins: [],
    generationOptions: .options(
        resolveDependenciesWithSystemScm: false,
        disablePackageVersionLocking: false
    )
)
