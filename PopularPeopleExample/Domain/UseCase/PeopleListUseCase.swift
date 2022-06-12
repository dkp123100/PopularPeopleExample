//
//  PeopleListUseCase.swift
//  PopularPeopleExample
//
//  Created by Patel Dhruvkumar Kiranbhai on 10/06/22.
//

import Foundation
import PromiseKit

protocol PeopleListUseCase {
    func execute<T: Decodable>(paramters: [String: Any]?) -> Promise<T>
}

final class DefaultPeopleListUseCase: PeopleListUseCase {
    
    private let peopleListRepository: PeopleListRepository
    
    
    init(peopleListRepository: PeopleListRepository) {
        
        self.peopleListRepository = peopleListRepository
    }
    
    func execute<T: Decodable>(paramters: [String: Any]?) -> Promise<T> {
        
        return peopleListRepository.fetchPeopleList(paramters: paramters)
    }
}
