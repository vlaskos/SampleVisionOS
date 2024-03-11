//
//  visionOSApp.swift
//  visionOS
//
//  Created by vlad.kosyi on 27.02.2024.
//

import SwiftUI

@main
struct visionOSApp: App {

    @State private var immersionStyle: ImmersionStyle = .mixed
    @State private var model = ViewModel()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(model)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1, height: 0.5, depth: 1, in: .meters)

        WindowGroup(id: "Item") {
            ItemView()
                .environment(model)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 2, height: 1, depth: 1, in: .meters)

        ImmersiveSpace(id: "VideoPlayer360") {
            Video360EntityTestRV()
        }.immersionStyle(selection: $immersionStyle, in: .full)

        ImmersiveSpace(id: "ImmersivePhoto") {
            ImmersivePhoto()
        }.immersionStyle(selection: $immersionStyle, in: .full)
    }
}
