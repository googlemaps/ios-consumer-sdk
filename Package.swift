// swift-tools-version: 5.5
/*
 * Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import PackageDescription

let package = Package(
  name: "GoogleRidesharingConsumer", platforms: [.iOS(.v14)],
  products: [
    .library(name: "GoogleRidesharingConsumer", targets: ["GoogleRidesharingConsumerTarget"])
  ], dependencies: [],
  targets: [
    .binaryTarget(
      name: "GoogleRidesharingConsumer",
      url:
        "https://dl.google.com/geosdk/swiftpm/0.0.0/GoogleRidesharingConsumer_3p.xcframework.zip",
      checksum: "62ff7770c89511a66e0def866e27c71db2e2c5acb26a6724fba7aab9159ed91c"
    ),
    .target(
      name: "GoogleRidesharingConsumerTarget",
      dependencies: ["GoogleRidesharingConsumer"],
      path: "Consumer",
      sources: ["GMTCEmpty.m"],
      resources: [.copy("Resources/GoogleRidesharingConsumer/GoogleRidesharingConsumer.bundle")],
      publicHeadersPath: "Sources"
    ),
  ]
)
