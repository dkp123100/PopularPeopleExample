//
//  PeopleListRepository.swift
//  PopularPeopleExample
//
//  Created by Patel Dhruvkumar Kiranbhai on 10/06/22.
//

import Foundation
import PromiseKit

protocol PeopleListRepository {
    func fetchPeopleList<T: Decodable>(paramters: [String: Any]?) -> Promise<T>
}

final class DefaultPeopleListRepository: PeopleListRepository{
    
    private let serviceManager: ServiceManager
    
    init(serviceManager: ServiceManager) {
        
        self.serviceManager = serviceManager
    }
    
    func fetchPeopleList<T: Decodable>(paramters: [String: Any]?) -> Promise<T> {
        
        return serviceManager.callPostApi(APIList.baseURL, methodType: .GET, paramters: paramters)
    }
}
