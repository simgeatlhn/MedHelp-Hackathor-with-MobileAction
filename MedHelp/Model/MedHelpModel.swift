//
//  MedHelpModel.swift
//  MedHelp
//
//  Created by simge on 17.12.2022.
//

import Foundation

struct MedHelpModel: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let detail: String
    let pillNumber: String
}
