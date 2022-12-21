//
//  LoginView.swift
//  MedHelp
//
//  Created by simge on 17.12.2022.
//

//
//  ContentView.swift
//  Login-Page-Firebase
//
//  Created by simge on 14.12.2022.
//

import SwiftUI
import LocalAuthentication

struct LoginView: View {
    
    @State private var unlocked = false
    @State private var text = "LOCKED"
    @State private var email = ""
    
    var body: some View {
        
        ZStack (alignment: .topTrailing) {
            GeometryReader {_ in
                VStack {
                    Image("Logo 1")
                        .resizable()
                        .cornerRadius(180)
                        .frame(width:300, height: 300)
                        .padding(.bottom, 54)
                        .padding(.leading,50)
                    
                    Text("Giriş Yapınız")
                        .font(.title)
                        .padding(.leading, 32)
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.7))
                    
                    Button("FaceID ile Giriş Yap") {
                        authenticate()
                    }
                    .frame(width: 260, height: 60)
                    .background(DarkBlue)
                    .cornerRadius(20)
                    .padding(.top, 12)
                    .padding(.leading,32)
                    .foregroundColor(.white)
                    
                    TextField("Email", text: $email)
                        .frame(width: 260)
                    
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(DarkBlue, lineWidth: 2))
                        .padding(.leading, 48)
                        .padding(.top, 25)
                    
                    TextField("Şifre", text: $email)
                        .frame(width: 260)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(DarkBlue, lineWidth: 2))
                        .padding(.leading, 48)
                        .padding(.top, 25)
                    
                    Button("Giriş Yap") {
                        authenticate()
                    }
                    
                    .frame(width: 160, height: 60)
                    .background(DarkBlue)
                    .cornerRadius(20)
                    .padding(.top, 12)
                    .padding(.leading, 36)
                    .foregroundColor(.white)
                    
                }
                .navigationBarTitle("Log In")
                .navigationBarHidden(true)
                if unlocked {
                    NavigationLink(destination: TabBar()) {
                        Text("")
                    }
                    .hidden()
                }
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "This is a security check reason.") { success, authenticationError in
                
                if success {
                    text = "Unlocked"
                } else {
                    text = "There was a problem!"
                }
            }
        } else {
            text = "Phone does not have biometrics"
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

