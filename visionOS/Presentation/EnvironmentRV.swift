//
//  EnvironmentRV.swift
//  visionOS
//
//  Created by vlad.kosyi on 28.02.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct EnvironmentRV: View {
    var body: some View {

        RealityView() { content in
             //load texture from xcassets
            guard let texture = try? TextureResource.load(named: "beach_scene") else {
                fatalError("Texture not loaded!")
            }
             //create a entity
             let rootEntity = Entity()

             //create material for the texture
             var material = UnlitMaterial() //Material without influence of lightning

             // add the texture (image) to the material
             material.color = .init(texture: .init(texture))

             //generate a sphere make it big so it fills out your whole vision in this example it has the size 1E3 (1* 10^3)
             //add the material to the entity
             rootEntity.components.set(ModelComponent(mesh: .generateSphere(radius: 1E3), materials: [material]))

             //adjust the properties of the entity size,angle, ...
             rootEntity.scale = .init(x: 1, y: 1, z: -1)
             rootEntity.transform.translation += SIMD3<Float>(0.0, 10.0, 0.0)
             let angle = Angle.degrees(90)
             let rotation = simd_quatf(angle: Float(angle.radians), axis: SIMD3<Float>(0, 1, 0))
             rootEntity.transform.rotation = rotation

             //Add entity to RealityView
             content.add(rootEntity)
         } update: { content in
             //Here you can update the RealityKit content
         }
    }
}

#Preview {
    EnvironmentRV()
}
