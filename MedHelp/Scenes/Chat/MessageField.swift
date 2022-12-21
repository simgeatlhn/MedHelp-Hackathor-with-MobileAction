//
//  MessageField.swift
//  MedHelp
//
//  Created by simge on 16.12.2022.
//

import SwiftUI

import SwiftUI

struct MessageField: View {
    
    @EnvironmentObject var messagesManager : MessagesManager
    @State private var message = ""
    
    var body: some View {
        
        HStack{
            CustomTextField(placeholder: Text("Enter your message..").foregroundColor(.white), text:  $message)
            
            Button{
                messagesManager.sendMessage(text: message)
                message = ""
            }label:{
                Image(systemName: "arrow.up.circle.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .cornerRadius(50)
                    .font(.system(size:36))
                
            }
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background(mainColor)
        .cornerRadius(20)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            .environmentObject(MessagesManager())
    }
}

struct CustomTextField:View{
    var placeholder : Text
    @Binding var text : String
    var editingChanged : (Bool) -> () = { _ in}
    var commit : () -> () = { }
    
    var body : some View {
        ZStack(alignment:.leading){
            if text.isEmpty{
                placeholder
                    .opacity(0.5)
            }
            TextField("",text:$text,onEditingChanged: editingChanged , onCommit: commit)
        }
    }
}
