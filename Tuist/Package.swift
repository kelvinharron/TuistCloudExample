// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        baseSettings: .settings(
            configurations: [
                .release(name: "Release"),
                .debug(name: "Debug"),
                .debug(name: "UnitTest")
            ]
        )
    )
#endif

let package = Package(
    name: "TuistCloudExample",
    platforms: [.iOS(.v17)],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift", exact: "10.47.0"),
        .package(url: "https://github.com/hmlongco/Factory", exact: "2.3.1"),
        .package(url: "https://github.com/1024jp/GzipSwift", exact: "6.0.1"),
        .package(url: "https://github.com/evgenyneu/keychain-swift", exact: "20.0.0"),
        .package(url: "https://github.com/siteline/swiftui-introspect", exact: "1.1.2"),
        .package(url: "https://github.com/apple/swift-algorithms", exact: "1.2.0"),
        .package(url: "https://github.com/Quick/Quick", exact: "7.3.0"),
        .package(url: "https://github.com/Quick/Nimble", exact: "13.0.0"),
        .package(url: "https://github.com/pendo-io/pendo-mobile-sdk", exact: "3.1.2"),
        .package(url: "https://github.com/IDScanNet/IDScanIDDetectorIOS", exact: "1.231002.2"),
        .package(url: "https://github.com/IDScanNet/IDScanIDParserIOS", exact: "1.220127.1"),
    ]
)
