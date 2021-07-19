// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "RxKakaoSDK",
  platforms: [.iOS(.v11)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library( name: "RxKakaoSDKAuth", targets: ["RxKakaoSDKAuth"]),
    .library( name: "RxKakaoSDKCommon", targets: ["RxKakaoSDKCommon"]),
    .library( name: "RxKakaoSDKLink", targets: ["RxKakaoSDKLink"]),
    .library( name: "RxKakaoSDKStory", targets: ["RxKakaoSDKStory"]),
    .library( name: "RxKakaoSDKTalk", targets: ["RxKakaoSDKTalk"]),
    .library( name: "RxKakaoSDKUser", targets: ["RxKakaoSDKUser"]),
  ],
  dependencies: [
    .package(name: "RxAlamofire", url: "https://github.com/RxSwiftCommunity/RxAlamofire", from: "6.0.0"),
    .package(name: "RxSwift", url: "https://github.com/ReactiveX/RxSwift", from: "6.0.0"),
    .package(name: "KakaoSDK", url: "https://github.com/elppaaa/KakaoSDK", .upToNextMajor(from: "2.6.0"))
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target( name: "RxKakaoSDKCommon",
             dependencies: [
              .product(name: "RxSwift", package: "RxSwift"),
              .product(name: "RxCocoa", package: "RxSwift"),
              "RxAlamofire",
              .product(name: "KakaoSDKCommon", package: "KakaoSDK"),
             ]),
    .target(name: "RxKakaoSDKAuth",
            dependencies: [
              "RxKakaoSDKCommon",
              .product(name: "KakaoSDKAuth", package: "KakaoSDK"),
            ]),
    .target(name: "RxKakaoSDKLink",
            dependencies: [
              "RxKakaoSDKCommon",
              .product(name: "KakaoSDKLink", package: "KakaoSDK"),
            ]),
    .target(name: "RxKakaoSDKStory",
            dependencies: [
              "RxKakaoSDKUser",
              .product(name: "KakaoSDKStory", package: "KakaoSDK"),
            ]),
    .target(name: "RxKakaoSDKTalk",
            dependencies: [
              "RxKakaoSDKUser",
              .product(name: "KakaoSDKTalk", package: "KakaoSDK"),
              .product(name: "KakaoSDKTemplate", package: "KakaoSDK"),
            ]),
    .target(name: "RxKakaoSDKUser",
            dependencies: [
              "RxKakaoSDKAuth",
              .product(name: "KakaoSDKUser", package: "KakaoSDK"),
            ])
  ]
)
