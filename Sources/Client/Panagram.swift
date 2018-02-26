//
//  Panagram.swift
//  ClientPackageDescription
//
//  Created by hai nguyen on 2/26/18.
//

class Panagram {
    private let paramNumber = 3
    static let singleton = Panagram()
    
    private init() {
        
    }
    
    func readParam() -> Bool {
        if CommandLine.argc < paramNumber {
            print("Need input 2 parameters")
            return false
        }
        return true
    }
    
    func getName() -> String! {
        return CommandLine.arguments[1]
    }
    
    func getServerAddr() -> String! {
        return CommandLine.arguments[2]
    }
}
