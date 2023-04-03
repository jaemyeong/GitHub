import ProjectDescription

let project = Project(
    name: "Profile",
    organizationName: nil,
    options: .options(defaultKnownRegions: ["Base", "ko"], developmentRegion: "ko"),
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
            "IPHONEOS_DEPLOYMENT_TARGET": .string("13.0"),
            "MTL_FAST_MATH": .string("YES"),
            "SDKROOT": .string("iphoneos"),
            "VERSIONING_SYSTEM": .string("apple-generic"),
            "VERSION_INFO_PREFIX": .string(""),
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
        defaultSettings: .none),
    targets: [
        Target(
            name: "Profile",
            platform: .iOS,
            product: .framework,
            productName: nil,
            bundleId: "com.jaemyeong.Profile",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: nil,
            sources: [
                "Targets/Profile/Sources/**"
            ],
            resources: [
                "Targets/Profile/Resources/**",
            ],
            copyFiles: nil,
            headers: .headers(
                public: "Targets/Profile/Sources/**",
                private: nil,
                project: nil,
                exclusionRule: .projectExcludesPrivateAndPublic
            ),
            entitlements: nil,
            scripts: [],
            dependencies: [
                .project(target: "Core", path: "../Core"),
                .external(name: "RxSwift"),
                .external(name: "RxCocoa"),
                .external(name: "RxDataSources"),
                .external(name: "ErrorKit"),
                .external(name: "Logging"),
            ],
            settings: .settings(
                base: [
                    "CODE_SIGN_STYLE": .string("Automatic"),
                    "DEFINES_MODULE": .string("YES"),
                    "DEVELOPMENT_TEAM": .string("67YPF88Z6T"),
                    "DYLIB_COMPATIBILITY_VERSION": .string("1"),
                    "DYLIB_CURRENT_VERSION": .string("1"),
                    "DYLIB_INSTALL_NAME_BASE": .string("@rpath"),
                    "GENERATE_INFOPLIST_FILE": .string("YES"),
                    "INFOPLIST_KEY_NSHumanReadableCopyright": .string(""),
                    "INSTALL_PATH": .string("$(LOCAL_LIBRARY_DIR)/Frameworks"),
                    "PRODUCT_BUNDLE_IDENTIFIER": .string("com.jaemyeong.Profile"),
                    "PRODUCT_NAME": .string("$(TARGET_NAME:c99extidentifier)"),
                    "SKIP_INSTALL": .string("YES"),
                    "SWIFT_EMIT_LOC_STRINGS": .string("YES"),
                    "SWIFT_VERSION": .string("5.0"),
                ],
                debug: [
                    "LD_RUNPATH_SEARCH_PATHS": .array([
                        "$(inherited)",
                        "@executable_path/Frameworks",
                        "@loader_path/Frameworks",
                    ]),
                ],
                release: [
                    "LD_RUNPATH_SEARCH_PATHS": .array([
                        "$(inherited)",
                        "@executable_path/Frameworks",
                        "@loader_path/Frameworks",
                    ])
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
            name: "ProfileTests",
            platform: .iOS,
            product: .unitTests,
            productName: nil,
            bundleId: "com.jaemyeong.ProfileTests",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: nil,
            sources: [
                "Targets/Profile/Tests/**"
            ],
            resources: nil,
            copyFiles: nil,
            headers: nil,
            entitlements: nil,
            scripts: [],
            dependencies: [
                .target(name: "Profile"),
                .external(name: "RxSwift"),
                .external(name: "RxBlocking"),
                .external(name: "Quick"),
                .external(name: "Nimble"),
            ],
            settings: .settings(
                base: [
                    "CODE_SIGN_STYLE": .string("Automatic"),
                    "DEVELOPMENT_TEAM": .string("67YPF88Z6T"),
                    "GENERATE_INFOPLIST_FILE": .string("YES"),
                    "PRODUCT_BUNDLE_IDENTIFIER": .string("com.jaemyeong.ProfileTests"),
                    "PRODUCT_NAME": .string("$(TARGET_NAME)"),
                    "SWIFT_EMIT_LOC_STRINGS": .string("NO"),
                    "SWIFT_VERSION": .string("5.0"),
                ],
                debug: [:],
                release: [:],
                defaultSettings: .none
            ),
            coreDataModels: [],
            environment: [:],
            launchArguments: [],
            additionalFiles: [],
            buildRules: []
        ),
    ],
    schemes: [],
    fileHeaderTemplate: nil,
    additionalFiles: [
        .folderReference(path: "Profile.docc"),
    ],
    resourceSynthesizers: .default
)
