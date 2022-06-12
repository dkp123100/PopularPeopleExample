//
//  MockServiceManager.swift
//  PopularPeopleExampleTests
//
//  Created by Patel Dhruvkumar Kiranbhai on 12/06/22.
//

import PromiseKit
@testable import PopularPeopleExample


class MockServiceManager: ServiceManager {
    
    let mockCalledPostAPIResponse: Any?
    let error: Error?
    
    init(mockCalledPostAPIResponse: Any?, error: Error?) {
        self.mockCalledPostAPIResponse = mockCalledPostAPIResponse
        self.error = error
    }
    
    func callPostApi<T: Decodable>(_ url: String, methodType: MethodType, paramters: [String : Any]?) -> Promise<T> {
        if(mockCalledPostAPIResponse == nil) {
            return Promise.init(error: error ?? RuntimeError(MessageConstants.someThingWentWrong))
        } else {
            return firstly { () -> Promise<T> in
                return .value(mockCalledPostAPIResponse as! T)
            }
        }
    }
}
