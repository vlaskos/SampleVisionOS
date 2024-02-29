//
//  ItemDetail.swift
//  visionOS
//
//  Created by vlad.kosyi on 28.02.2024.
//

import SwiftUI

struct ItemDetail: View {
    let title: String
    let imageName: String
    let openCard: () async -> Void

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 300, height: 300)
                .padding(20)

            Button(title) {
                Task {
                    await openCard()
                }
            }
        }.glassBackgroundEffect()
    }
}


#Preview {
    ItemDetail(title: "Title",
               imageName: "",
               openCard: { })
}
