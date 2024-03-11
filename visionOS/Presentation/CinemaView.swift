//
//  CinemaView.swift
//  visionOS
//
//  Created by vlad.kosyi on 28.02.2024.
//

import SwiftUI
import AVKit

struct CinemaView: View {

    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @State private var isActiveEmmersive = false

    @State var player = AVPlayer(url: Bundle.main.url(forResource: "BigBuckBunny", withExtension: "mp4")!)

    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .padding(20)

            Button(isActiveEmmersive ? "Exit emmersive" : "Open emmersive") {
                Task {
                    if !isActiveEmmersive {
                        let _ = await openImmersiveSpace(id: "ImmersivePhoto")
                        isActiveEmmersive = true
                    } else {
                        await dismissImmersiveSpace()
                        isActiveEmmersive = false
                    }
                }
            }
        }
        .glassBackgroundEffect()
        .onDisappear(perform: {
            Task {
                player.pause()
                if isActiveEmmersive {
                    await dismissImmersiveSpace()
                    isActiveEmmersive = false
                }
            }
        })
    }
}

#Preview {
    CinemaView()
}
