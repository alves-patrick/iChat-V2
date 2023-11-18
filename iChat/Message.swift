//
//  Message.swift
//  iChat
//
//  Created by Patrick Alves on 12/11/23.
//

import Foundation

struct Message: Hashable {
    let uuid: String
    let text: String
    let isMe: Bool
    let timestamp: UInt
}
