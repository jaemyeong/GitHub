import ProjectDescription

let project = Project(
    name: "GitHub",
    organizationName: nil,
    options: .options(defaultKnownRegions: ["ko"], developmentRegion: "ko"),
    packages: [],
    settings: .settings(
        base: [
            "ALWAYS_SEARCH_USER_PATHS": .string("NO"),
            "CLANG_ANALYZER_NONNULL": .string("YES"),
            "CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION": .string("YES_AGGRESSIVE"),
            "CLANG_CXX_LANGUAGE_STANDARD": .string("gnu++20"),
            "CLANG_ENABLE_MODULES": .string("YES"),
            "CLANG_ENABLE_OBJC_ARC": .string("YES"),
            "CLANG_ENABLE_OBJC_WEAK": .string("YES"),
            "CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING": .string("YES"),
            "CLANG_WARN_BOOL_CONVERSION": .string("YES"),
            "CLANG_WARN_COMMA": .string("YES"),
            "CLANG_WARN_CONSTANT_CONVERSION": .string("YES"),
            "CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS": .string("YES"),
            "CLANG_WARN_DIRECT_OBJC_ISA_USAGE": .string("YES_ERROR"),
            "CLANG_WARN_DOCUMENTATION_COMMENTS": .string("YES"),
            "CLANG_WARN_EMPTY_BODY": .string("YES"),
            "CLANG_WARN_ENUM_CONVERSION": .string("YES"),
            "CLANG_WARN_INFINITE_RECURSION": .string("YES"),
            "CLANG_WARN_INT_CONVERSION": .string("YES"),
            "CLANG_WARN_NON_LITERAL_NULL_CONVERSION": .string("YES"),
            "CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF": .string("YES"),
            "CLANG_WARN_OBJC_LITERAL_CONVERSION": .string("YES"),
            "CLANG_WARN_OBJC_ROOT_CLASS": .string("YES_ERROR"),
            "CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER": .string("YES"),
            "CLANG_WARN_RANGE_LOOP_ANALYSIS": .string("YES"),
            "CLANG_WARN_STRICT_PROTOTYPES": .string("YES"),
            "CLANG_WARN_SUSPICIOUS_MOVE": .string("YES"),
            "CLANG_WARN_UNGUARDED_AVAILABILITY": .string("YES_AGGRESSIVE"),
            "CLANG_WARN_UNREACHABLE_CODE": .string("YES"),
            "CLANG_WARN__DUPLICATE_METHOD_MATCH": .string("YES"),
            "COPY_PHASE_STRIP": .string("NO"),
            "ENABLE_STRICT_OBJC_MSGSEND": .string("YES"),
            "GCC_C_LANGUAGE_STANDARD": .string("gnu11"),
            "GCC_NO_COMMON_BLOCKS": .string("YES"),
            "GCC_WARN_64_TO_32_BIT_CONVERSION": .string("YES"),
            "GCC_WARN_ABOUT_RETURN_TYPE": .string("YES_ERROR"),
            "GCC_WARN_UNDECLARED_SELECTOR": .string("YES"),
            "GCC_WARN_UNINITIALIZED_AUTOS": .string("YES_AGGRESSIVE"),
            "GCC_WARN_UNUSED_FUNCTION": .string("YES"),
            "GCC_WARN_UNUSED_VARIABLE": .string("YES"),
            "MTL_FAST_MATH": .string("YES"),
            "SDKROOT": .string("iphoneos"),
            "CURRENT_PROJECT_VERSION": .string("1"),
            "MARKETING_VERSION": .string("0.1.0"),
        ],
        debug: [
            "DEBUG_INFORMATION_FORMAT": .string("dwarf"),
            "ENABLE_TESTABILITY": .string("YES"),
            "GCC_DYNAMIC_NO_PIC": .string("NO"),
            "GCC_OPTIMIZATION_LEVEL": .string("0"),
            "GCC_PREPROCESSOR_DEFINITIONS": .array([
                "DEBUG=1",
                "$(inherited)",
            ]),
            "MTL_ENABLE_DEBUG_INFO": .string("INCLUDE_SOURCE"),
            "ONLY_ACTIVE_ARCH": .string("YES"),
            "SWIFT_ACTIVE_COMPILATION_CONDITIONS": .string("DEBUG"),
            "SWIFT_OPTIMIZATION_LEVEL": .string("-Onone"),
        ],
        release: [
            "DEBUG_INFORMATION_FORMAT": .string("dwarf-with-dsym"),
            "ENABLE_NS_ASSERTIONS": .string("NO"),
            "MTL_ENABLE_DEBUG_INFO": .string("NO"),
            "SWIFT_COMPILATION_MODE": .string("wholemodule"),
            "SWIFT_OPTIMIZATION_LEVEL": .string("-O"),
            "VALIDATE_PRODUCT": .string("YES"),
        ],
        defaultSettings: .none
    ),
    targets: [
        Target(
            name: "GitHub",
            platform: .iOS,
            product: .app,
            productName: nil,
            bundleId: "com.jaemyeong.GitHub",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .dictionary([
                "UIApplicationSceneManifest": .dictionary([
                    "UIApplicationSupportsMultipleScenes": .boolean(false),
                    "UISceneConfigurations": .dictionary([
                        "UIWindowSceneSessionRoleApplication": .array([
                            .dictionary([
                                "UISceneConfigurationName": .string("Default Configuration"),
                                "UISceneDelegateClassName": .string("$(PRODUCT_MODULE_NAME).SceneDelegate"),
                            ]),
                        ]),
                    ]),
                ]),
            ]),
            sources: [
                "Targets/GitHub/Sources/**"
            ],
            resources: [
                "Targets/GitHub/Resources/**"
            ],
            copyFiles: nil,
            headers: nil,
            entitlements: nil,
            scripts: [],
            dependencies: [
                .project(target: "GitHubCore", path: "../Modules/GitHubCore"),
                .project(target: "Core", path: "../Modules/Core"),
                .external(name: "RxSwift"),
                .external(name: "RxCocoa"),
                .external(name: "RxDataSources"),
                .external(name: "ErrorKit"),
                .external(name: "Logging"),
            ],
            settings: .settings(
                base: [
                    "ASSETCATALOG_COMPILER_APPICON_NAME": .string("AppIcon"),
                    "ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME": .string("AccentColor"),
                    "CODE_SIGN_STYLE": .string("Automatic"),
                    "DEVELOPMENT_TEAM": .string("67YPF88Z6T"),
                    "GENERATE_INFOPLIST_FILE": .string("YES"),
                    "INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents": .string("YES"),
                    "INFOPLIST_KEY_UILaunchStoryboardName": .string("LaunchScreen"),
                    "INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad": .array([
                        "UIInterfaceOrientationPortrait",
                        "UIInterfaceOrientationPortraitUpsideDown",
                        "UIInterfaceOrientationLandscapeLeft",
                        "UIInterfaceOrientationLandscapeRight",
                    ]),
                    "INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone": .array([
                        "UIInterfaceOrientationPortrait",
                        "UIInterfaceOrientationLandscapeLeft",
                        "UIInterfaceOrientationLandscapeRight",
                    ]),
                    "PRODUCT_BUNDLE_IDENTIFIER": .string("com.jaemyeong.GitHub"),
                    "PRODUCT_NAME": .string("$(TARGET_NAME)"),
                    "SWIFT_EMIT_LOC_STRINGS": .string("YES"),
                    "SWIFT_VERSION": .string("5.0"),
                ],
                debug: [
                    "LD_RUNPATH_SEARCH_PATHS": .array([
                        "$(inherited)",
                        "@executable_path/Frameworks",
                    ]),
                ],
                release: [
                    "LD_RUNPATH_SEARCH_PATHS": .array([
                        "$(inherited)",
                        "@executable_path/Frameworks",
                    ]),
                ],
                defaultSettings: .none
            ),
            coreDataModels: [],
            environment: [:],
            launchArguments: [],
            additionalFiles: [],
            buildRules: []
        ),
        Target(
            name: "GitHubTests",
            platform: .iOS,
            product: .unitTests,
            productName: nil,
            bundleId: "com.jaemyeong.GitHubTests",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: nil,
            sources: [
                "Targets/GitHub/Tests/**"
            ],
            resources: nil,
            copyFiles: nil,
            headers: nil,
            entitlements: nil,
            scripts: [],
            dependencies: [
                .target(name: "GitHub"),
                .external(name: "RxSwift"),
                .external(name: "RxBlocking"),
                .external(name: "Quick"),
                .external(name: "Nimble"),
            ],
            settings: .settings(
                base: [
                    "ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES": .string("YES"),
                    "BUNDLE_LOADER": .string("$(TEST_HOST)"),
                    "CODE_SIGN_STYLE": .string("Automatic"),
                    "DEVELOPMENT_TEAM": .string("67YPF88Z6T"),
                    "GENERATE_INFOPLIST_FILE": .string("YES"),
                    "PRODUCT_BUNDLE_IDENTIFIER": .string("com.jaemyeong.GitHubTests"),
                    "PRODUCT_NAME": .string("$(TARGET_NAME)"),
                    "SWIFT_EMIT_LOC_STRINGS": .string("NO"),
                    "SWIFT_VERSION": .string("5.0"),
                    "TEST_HOST": .string("$(BUILT_PRODUCTS_DIR)/GitHub.app/$(BUNDLE_EXECUTABLE_FOLDER_PATH)/GitHub"),
                ],
                debug: [:],
                release: [:],
                defaultSettings: .none),
            coreDataModels: [],
            environment: [:],
            launchArguments: [],
            additionalFiles: [],
            buildRules: []
        ),
        Target(
            name: "GitHubUITests",
            platform: .iOS,
            product: .uiTests,
            productName: nil,
            bundleId: "com.jaemyeong.GitHubUITests",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: nil,
            sources: [
                "Targets/GitHub/UITests/**"
            ],
            resources: nil,
            copyFiles: nil,
            headers: nil,
            entitlements: nil,
            scripts: [],
            dependencies: [
                .external(name: "RxSwift"),
                .external(name: "RxBlocking"),
                .external(name: "Quick"),
                .external(name: "Nimble"),
            ],
            settings: .settings(
                base: [
                    "ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES": .string("YES"),
                    "CODE_SIGN_STYLE": .string("Automatic"),
                    "DEVELOPMENT_TEAM": .string("67YPF88Z6T"),
                    "GENERATE_INFOPLIST_FILE": .string("YES"),
                    "PRODUCT_BUNDLE_IDENTIFIER": .string("com.jaemyeong.GitHubUITests"),
                    "PRODUCT_NAME": .string("$(TARGET_NAME)"),
                    "SWIFT_EMIT_LOC_STRINGS": .string("NO"),
                    "SWIFT_VERSION": .string("5.0"),
                    "TEST_TARGET_NAME": .string("GitHub"),
                ],
                debug: [:],
                release: [:],
                defaultSettings: .none),
            coreDataModels: [],
            environment: [:],
            launchArguments: [],
            additionalFiles: [],
            buildRules: []
        ),
    ],
    schemes: [],
    fileHeaderTemplate: nil,
    additionalFiles: [],
    resourceSynthesizers: .default
)
