//
//  MedHelpViewModel.swift
//  MedHelp
//
//  Created by simge on 17.12.2022.
//

import Foundation

class MedHelpViewModel: ObservableObject {
    @Published private (set) var pills: [MedHelpModel] = []
    
    init() {
        pills = MedHelpModel.allPill
    }
}

//Data
extension MedHelpModel {
    // array equal to array
    static let allPill: [MedHelpModel] = [
        MedHelpModel(
            name: "Accuretic",
            image:"https://i0.wp.com/www.nupel.tv/wp-content/uploads/2022/03/1600x1600.jpeg?fit=1409%2C757&ssl=1",
            detail: "Sabah 1 tane aç karnına",
            pillNumber: "2"
        ),
        MedHelpModel(
            name: "Beloc",
            image: "https://pbs.twimg.com/media/DLu5Ym8XkAAIc-Y?format=jpg&name=small",
            detail: "Akşam 1 tane tok karna",
            pillNumber: "6"
        ),
    ]
}
