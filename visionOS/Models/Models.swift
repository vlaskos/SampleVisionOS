//
//  Models.swift
//  visionOS
//
//  Created by vlad.kosyi on 28.02.2024.
//

import Foundation

enum ItemModel : String, Identifiable, CaseIterable, Equatable
{
    case earth, sog, sprut, none
    var id: Self { self }
    var name: String? { rawValue.capitalized }
}
