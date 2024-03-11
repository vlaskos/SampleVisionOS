//
//  Items.swift
//  visionOS
//
//  Created by vlad.kosyi on 28.02.2024.
//

import SwiftUI

struct ItemListView: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        @Bindable var model = model

        HStack {
            ItemDetail(title: "Earth",
                       imageName: "earth") {
                model.currentModel = .earth
                openWindow(id: "Item")
            }.onDisappear {
                model.currentModel = .none
            }

            ItemDetail(title: "Custom",
                       imageName: "sog") {
                model.currentModel = .sog
                openWindow(id: "Item")
            }.onDisappear {
                model.currentModel = .none
            }

            ItemDetail(title: "Sprut",
                       imageName: "") {
                model.currentModel = .sprut
                openWindow(id: "Item")
            }.onDisappear {
                model.currentModel = .none
            }
        }
    }
}

#Preview {
    ItemListView()
        .environment(ViewModel())
}

