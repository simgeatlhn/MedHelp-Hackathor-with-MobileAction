//
//  TitleRow.swift
//  MedHelp
//
//  Created by simge on 16.12.2022.
//

import SwiftUI

struct TitleRow: View {
    
    var name = "Dr. Suna"
    var imageURL = URL(string:"https://static.vecteezy.com/system/resources/previews/003/809/833/non_2x/woman-doctor-character-free-vector.jpg")
    
    
    var body: some View {
        HStack(spacing:20){
            AsyncImage(url:imageURL){ image in
                image
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            }placeholder: {
                ProgressView()
            }
            
            VStack(alignment:.leading){
                Text(name)
                    .font(.title)
                    .fontWeight(.bold).foregroundColor(.white)
                
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading) //*
            
            Image(systemName: "video.fill")
                .foregroundColor(.black)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
            Image(systemName: "phone.fill")
                .foregroundColor(.black)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
    }
}
