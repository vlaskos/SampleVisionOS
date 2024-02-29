//
//  CinemaView.swift
//  visionOS
//
//  Created by vlad.kosyi on 28.02.2024.
//

import SwiftUI
import AVKit

struct CinemaView: View {
    
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "BigBuckBunny", withExtension: "mp4")!)

    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @State private var immersiveSpaceActive: Bool = false

    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .padding(20)

            Button(immersiveSpaceActive ? "Exit Environment" : "View Environment") {
                Task {
                    if !immersiveSpaceActive {
                        _ = await openImmersiveSpace(id: "Environment")
                        immersiveSpaceActive = true
                    } else {
                        await dismissImmersiveSpace()
                        immersiveSpaceActive = false
                    }
                }
            }
        }
        .glassBackgroundEffect()
        .onDisappear(perform: {
            Task {
                player.pause()
                if immersiveSpaceActive {
                    await dismissImmersiveSpace()
                    immersiveSpaceActive = false
                }
            }
        })
    }
}

#Preview {
    CinemaView()
}
