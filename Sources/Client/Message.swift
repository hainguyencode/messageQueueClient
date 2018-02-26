//
//  Message.swift
//  ClientPackageDescription
//
//  Created by hai nguyen on 2/26/18.
//
import Foundation

struct Message: Codable {
    let from: String!
    let content: String!
    
    func toJsonString() -> String? {
        var data: Data? = nil
//        print("toJsonString: \(self)")
        do {
             data = try JSONEncoder().encode(self)
        } catch let _ {
            print("toJsonString: encode error")
            return nil
        }
        if data == nil {
            print("toJsonString: data is nil")
            return nil
        }
        return String(data: data!, encoding: .utf8)
    }
}

extension String {
    func toMessage() -> Message? {
        guard let msgData = self.data(using: .utf8) else {
            return nil
        }
        return try? JSONDecoder().decode(Message.self, from: msgData)
    }
}
