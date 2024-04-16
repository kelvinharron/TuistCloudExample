import ProjectDescription

let project = Project(
    name: "TuistCloudExample",
    organizationName: "Kelvin Harron Solutions",
    options: .options(
        automaticSchemesOptions: .enabled(targetSchemesGrouping: .notGrouped, codeCoverageEnabled: false, testingOptions: .randomExecutionOrdering)
    ),
    settings: .settings(
        configurations: [
            .debugConfiguration,
            .unitTestConfiguration,
            .releaseConfiguration
        ]
    ),
    targets: [
        .target(
            name: "TuistCloudExample",
            destinations: [.iPhone, .iPad, .macWithiPadDesign],
            product: .app,
            bundleId: "io.tuist.TuistCloudExample",
            deploymentTargets: .iOS("17.4"),
            infoPlist: .file(path: "TuistCloudExample/Sources/Config/info.plist"),
            sources: ["TuistCloudExample/Sources/**"],
            resources: ["TuistCloudExample/Resources/**"],
            dependencies: [
                .external(name: "Factory"),
                .external(name: "Gzip"),
                .external(name: "KeychainSwift"),
                .external(name: "SwiftUIIntrospect"),
                .external(name: "Algorithms"),
                .external(name: "Pendo"),
                .external(name: "RealmSwift"),
                .project(
                    target: "MyKit",
                    path: "./Features/MyKit"
                )
            ],
            settings: .settings(configurations: [
                .releaseConfiguration,
                .debugConfiguration
            ])
        ),
        .target(
            name: "TuistCloudExampleTests",
            destinations: [.iPhone, .iPad, .macWithiPadDesign],
            product: .unitTests,
            bundleId: "io.tuist.TuistCloudExampleTests",
            infoPlist: .default,
            sources: ["TuistCloudExample/Tests/**"],
            resources: [],
            dependencies: [
                .external(name: "Nimble"),
                .external(name: "Quick"),
                .target(name: "TuistCloudExample"),
            ],
            settings: .settings(configurations: [.unitTestConfiguration])
        ),
    ]
)

public extension Configuration {
    static let releaseConfiguration: Configuration = .release(
        name: "Release",
        settings: [
            "PRODUCT_BUNDLE_IDENTIFIER": .string("io.tuist.TuistCloudExample"),
            "ENABLE_USER_SCRIPT_SANDBOXING": true
        ],
        xcconfig: "TuistCloudExample/Sources/Config/production.xcconfig"
    )
    static let debugConfiguration: Configuration = .debug(
        name: "Debug",
        settings: [
            "PRODUCT_BUNDLE_IDENTIFIER": .string("io.tuist.TuistCloudExample.debug"),
            "ENABLE_USER_SCRIPT_SANDBOXING": true
        ],
        xcconfig: "TuistCloudExample/Sources/Config/debug.xcconfig"
    )
    static let unitTestConfiguration: Configuration = .debug(
        name: "UnitTest",
        xcconfig: "TuistCloudExample/Tests/Config/test.xcconfig"
    )
}
