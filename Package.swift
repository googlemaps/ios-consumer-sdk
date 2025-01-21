// swift-tools-version: 5.5
//
// Copyright 2024 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "GoogleRidesharingConsumer", platforms: [.iOS(.v15)],
  products: [
    .library(name: "GoogleRidesharingConsumer", targets: ["GoogleRidesharingConsumerTarget"])
  ], dependencies: [.package(url: "https://github.com/googlemaps/ios-maps-sdk", from: "9.0.0")],
  targets: [
    .binaryTarget(
      name: "GoogleRidesharingConsumer",
      url:
        "https://dl.google.com/geosdk/swiftpm/9.2.0/GoogleRidesharingConsumer_3p.xcframework.zip",
      checksum: "e51d555b99605dbda6b8932bbe185d164cddfc5877a326dd27b70b78b3943c24"
    ),
    .target(
      name: "GoogleRidesharingConsumerTarget",
      dependencies: [
        "GoogleRidesharingConsumer",
        .product(name: "GoogleMaps", package: "ios-maps-sdk"),
      ],
      path: "Consumer",
      sources: ["GMTCEmpty.m"],
      resources: [.copy("Resources/GoogleRidesharingConsumer/GoogleRidesharingConsumer.bundle")],
      publicHeadersPath: "Sources",
      linkerSettings: [
        .linkedLibrary("c++"),
        .linkedLibrary("z"),
        .linkedFramework("Accelerate"),
        .linkedFramework("CoreData"),
        .linkedFramework("CoreGraphics"),
        .linkedFramework("CoreImage"),
        .linkedFramework("CoreLocation"),
        .linkedFramework("CoreTelephony"),
        .linkedFramework("CoreText"),
        .linkedFramework("GLKit"),
        .linkedFramework("ImageIO"),
        .linkedFramework("OpenGLES"),
        .linkedFramework("QuartzCore"),
        .linkedFramework("SystemConfiguration"),
        .linkedFramework("UIKit"),
      ]
    ),
  ]
)
