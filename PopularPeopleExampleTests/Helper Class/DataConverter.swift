//
//  DataConverter.swift
//  PopularPeopleExampleTests
//
//  Created by Patel Dhruvkumar Kiranbhai on 13/06/22.
//

import Foundation

class DataConverter {
    
    func getData(name: String, withExtension: String = "json") -> Data {
        let bundle = Bundle(for: type(of: self))
        let fileUrl = bundle.url(forResource: name, withExtension: withExtension)
        let data = try! Data(contentsOf: fileUrl!)
        return data
    }
}
