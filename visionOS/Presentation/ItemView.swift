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

    var body: some View {
        RealityView { content in
            if let modelName = model.currentModel.name,
                let scene = try? await Entity(named: modelName) {
                content.add(scene)
            }
        }
    }
}

#Preview {
    ItemView()
        .environment(ViewModel())
}
