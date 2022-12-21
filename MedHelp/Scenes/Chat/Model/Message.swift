//
//  Message.swift
//  MedHelp
//
//  Created by simge on 16.12.2022.
//

import Foundation

//Idetifiable Protocol - each message can be unique
//Codable - encodable , decodable
struct Message : Identifiable , Codable{
    var id : String
    var text : String
    var received : Bool
    var timestamp : Date
}
