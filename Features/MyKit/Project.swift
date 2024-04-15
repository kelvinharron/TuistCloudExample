import ProjectDescription

let project = Project(
    name: "MyKit",
    organizationName: "Kelvin Harron Solutions",
    options: .options(
        automaticSchemesOptions: .enabled(
            targetSchemesGrouping: .notGrouped,
            codeCoverageEnabled: false,
            testingOptions: .randomExecutionOrdering
        )
    ),
    settings: .settings(
        configurations: [
            .debug(name: "Debug"),
            .debug(name: "UnitTest"),
            .release(name: "Release")
        ]
    ),
    targets: [
        .target(
            name: "MyKit",
            destinations: [.iPhone, .iPad, .macWithiPadDesign],
            product: .framework,
            bundleId: "io.tuist.TuistCloudExample.MyKit",
            deploymentTargets: .iOS("17.4"),
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .external(name: "IDScanPDFParser", condition: .when([.ios])),
                .external(name: "IDScanPDFDetector", condition: .when([.ios]))
            ],
            settings: .settings(
                configurations: [
                    .debug(name: "Debug",
                           settings: [
                               "ENABLE_MODULE_VERIFIER": true,
                               "ENABLE_USER_SCRIPT_SANDBOXING": true
                           ]),
                    .debug(name: "UnitTest",
                           settings: [
                               "ENABLE_MODULE_VERIFIER": true,
                               "ENABLE_USER_SCRIPT_SANDBOXING": true
                           ]),
                    .release(name: "Release",
                             settings: [
                                 "ENABLE_MODULE_VERIFIER": true,
                                 "ENABLE_USER_SCRIPT_SANDBOXING": true
                             ])
                ]
            )
        )
    ]
)
