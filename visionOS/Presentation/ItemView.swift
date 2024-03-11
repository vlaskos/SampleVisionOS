//
//  Item.swift
//  visionOS
//
//  Created by vlad.kosyi on 28.02.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ItemView: View {

    @Environment(ViewModel.self) private var model
    @State private var scale = false
    @State private var entity = Entity()

    var body: some View {
        RealityView { content in
            if let modelName = model.currentModel.name,
                let scene = try? await Entity(named: modelName) {
                self.entity = scene
                scene.components.set(InputTargetComponent())
                scene.components.set(CollisionComponent(shapes: [.generateSphere(radius: 0.1)]))
                content.add(scene)
            }
        } update: { content in
            entity.transform.scale = scale ? [1.5, 1.5, 1.5] : [1.0, 1.0, 1.0]
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded { _ in
            scale.toggle()
        })
    }
}

#Preview {
    ItemView()
        .environment(ViewModel())
}
