//
//  Video360EntityTestRV.swift
//  visionOS
//
//  Created by vlad.kosyi on 28.02.2024.
//

import SwiftUI
import AVFoundation
import AVKit
import RealityKit

struct Video360EntityTestRV: View {

    var body: some View {
        RealityView() { content in

            //Create Entity for the video
            let videoEntity = Entity()

            //Search for video in paths
            guard let url = Bundle.main.url(forResource: "Minions", withExtension: "mp4") else {fatalError("Video was not found!")}

            //create a simple AVPlayer
            let asset = AVURLAsset(url: url)
            let playerItem = AVPlayerItem(asset: asset)
            let player = AVPlayer()

            //create a videoMaterial
            let material = VideoMaterial(avPlayer: player)

            //Made a Sphere with the videoEntity and asign the videoMaterial to it
            videoEntity.components.set(ModelComponent(mesh: .generateSphere(radius: 1E3), materials: [material]))

            //adjust the properties of the videoEntity(Sphere) if needed
            videoEntity.scale = .init(x: 1, y: 1, z: -1)
            videoEntity.transform.translation += SIMD3<Float>(0.0, 10.0, 0.0)

            let angle = Angle.degrees(90)
            let rotation = simd_quatf(angle: Float(angle.radians), axis: .init(x: 0, y: 0, z: 0))

            videoEntity.transform.rotation = rotation

            //add VideoEntity to realityView
            content.add(videoEntity)

            //start the VideoPlayer
            player.replaceCurrentItem(with: playerItem)
            player.play()
        }
    }
}
#Preview {
    Video360EntityTestRV()
}
