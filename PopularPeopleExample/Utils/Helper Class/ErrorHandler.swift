//
//  ErrorHandler.swift
//  PopularPeopleExample
//
//  Created by Patel Dhruvkumar Kiranbhai on 09/06/22.
//

struct RuntimeError: Error {
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
    
    public var localizedDescription: String {
        return message
    }
}


