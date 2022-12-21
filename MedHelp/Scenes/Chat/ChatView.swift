//
//  ChatView.swift
//  MedHelp
//
//  Created by simge on 16.12.2022.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        VStack {
            VStack{
                TitleRow()
                Divider().background(.white).font(.system(size: 20))
                
                //automatically scroll
                ScrollViewReader{proxy in
                    ScrollView{
                        ForEach(messagesManager.messages , id:\.id){ message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top , 10)
                    .background(mainColor)
                    .onChange(of: messagesManager.lastMessageId) {id in
                        withAnimation{
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
            }
            .background(mainColor)
            
            MessageField()
                .environmentObject(messagesManager)
                .background(.white)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

