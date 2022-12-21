//
//  ToDoView.swift
//  MedHelp
//
//  Created by simge on 16.12.2022.
//

import SwiftUI
import Kingfisher

struct ToDoView: View {
    var pill: MedHelpModel
    
    var body: some View {
        HStack {
            KFImage(URL(string: pill.image))
                .resizable()
                .frame(width: 100, height:80)
                .cornerRadius(10)
                .padding(.trailing, 10)
            
            VStack (alignment: .leading) {
                HStack {
                    Image(systemName: "pills.fill")
                        .frame(width: 28, height: 28)
                        .foregroundColor(DarkBlue)
                    
                    Text(pill.pillNumber)
                        .foregroundStyle(DarkBlue)
                        .fontWeight(.bold)
                }
                
                Text(pill.name)
                    .foregroundColor(DarkBlue)
                    .fontWeight(.bold)
                    .padding(.bottom, 1)
                
                Text(pill.detail)
                    .foregroundColor(.gray)
            }
        }
        .frame(width: 360, height: 130)
        .background(LightBlue.opacity(0.9))
        .cornerRadius(30)
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView(pill: MedHelpModel.allPill[0])
    }
}
