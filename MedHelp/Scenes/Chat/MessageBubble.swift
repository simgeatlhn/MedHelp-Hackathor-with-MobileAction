//
//  MessageBubble.swift
//  MedHelp
//
//  Created by simge on 16.12.2022.
//

import SwiftUI

import SwiftUI

struct MessageBubble: View {
    
    var message: Message //from models
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.received ? Color("Gray") : LightBlue) //depend on received
                    .cornerRadius(20)
            }
            .frame(maxWidth:300 , alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            //Click show !
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing , 25)
            }
            
        }
        .frame(maxWidth:.infinity , alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal , 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "1", text: "Hello!", received: false, timestamp: Date()))
    }
}
