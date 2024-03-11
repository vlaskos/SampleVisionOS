//
//  ImmersivePhoto.swift
//  visionOS
//
//  Created by vlad.kosyi on 11.03.2024.
//

import SwiftUI
import RealityKit

struct ImmersivePhoto: View {
    var body: some View {

        RealityView() { content in

            guard let texture = try? TextureResource.load(named: "beach_scene") else {
                return
            }
            var rootEntity = Entity()
            var matererial = UnlitMaterial()
            matererial.color = .init(texture: .init(texture))
            rootEntity.components.set(ModelComponent.init(mesh: .generateSphere(radius: 1E3), materials: [matererial]))
            rootEntity.scale = .init(x: 1, y: 1, z: -1)
            rootEntity.transform.translation += SIMD3<Float>(0.0, 10.0, 0.0)
            let angle = Angle.degrees(90)
            let rotation = simd_quatf(angle: Float(angle.radians), axis: SIMD3<Float>(0, 1, 0))
            rootEntity.transform.rotation = rotation
            content.add(rootEntity)

        }
    }
}

#Preview {
    ImmersivePhoto()
}
