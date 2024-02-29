//
//  MainView.swift
//  visionOS
//
//  Created by vlad.kosyi on 28.02.2024.
//

import SwiftUI

struct MainView: View {
    @Environment(ViewModel.self) private var model

    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @State private var immersiveSpaceActive: Bool = false

    var body: some View {
        ZStack {
            NavigationStack {

                Text("Sample app")
                    .monospaced()
                    .font(.system(size: 40, weight: .bold))
                    .padding(.top, 250)

                HStack(spacing: 25) {

                    NavigationLink {
                        ItemListView()
                    } label: {
                        Label("Models", systemImage: "chevron.right")
                            .monospaced()
                            .font(.title)
                    }
                    .controlSize(.extraLarge)

                    NavigationLink {
                        CinemaView()
                    } label: {
                        Label("Cimena", systemImage: "chevron.right")
                            .monospaced()
                            .font(.title)
                    }
                    .controlSize(.extraLarge)
                }
                .padding(50)

                Button(!immersiveSpaceActive ? "Show 360 Video" : "Hide 360 Video") {
                    Task {
                        if !immersiveSpaceActive {
                            let _ = await openImmersiveSpace(id: "VideoPlayer360")
                            immersiveSpaceActive = true
                        } else {
                            await dismissImmersiveSpace()
                            immersiveSpaceActive = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}

