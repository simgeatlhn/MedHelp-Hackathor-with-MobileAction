//
//  ProfileView.swift
//  MedHelp
//
//  Created by simge on 16.12.2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("profile")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(20)
                    
                    Text("Simge Atlıhan")
                        .fontWeight(.bold)
                        .foregroundColor(.white).padding(.bottom, 1)
                    
                    Text("simgeatlihangmail.com")
                        .fontWeight(.light)
                        .foregroundColor(.white)
                }
                
                List {
                    Section {
                        Text("Şifre Değiştir")
                    }header: {
                        Text("Güvenlik")
                    }
                    Section {
                        Text("English")
                        Text("Türkçe")
                    } header: {
                        Text("Dil Seçiniz")
                    }
                    Section {
                        Text("Gizlilik")
                        Text("Profil fotoğrafı")
                        Text("Arkadaşına Öner")
                    } header: {
                        Text("Ayarlar")
                    }
                    Section {
                        Text("📲 Kızı - Bahar Atasoy")
                    } header: {
                        Text("Yakınlık Derecesi")
                    }
                }
                .padding(.top, 16)
            }.background(DarkBlue)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}





