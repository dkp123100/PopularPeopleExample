//
//  PeopleListViewModel.swift
//  PopularPeopleExample
//
//  Created by Patel Dhruvkumar Kiranbhai on 09/06/22.
//

import Foundation
import PromiseKit

protocol PeopleListViewModel {
    var arrPeopleList: [PeopleResults] { get }
    func peopleAt(index: Int) -> PeopleResults?
    var peopleCount: Int { get }
    func fetchPeopleList() ->  Promise<[PeopleResults]>
}

class DefaultPeopleListViewModel: PeopleListViewModel {
    
    let peopleListUseCase: PeopleListUseCase
    var arrPeopleList: [PeopleResults] = []
    var peopleCount: Int {
        arrPeopleList.count
    }    
    
    init(peopleListUseCase: PeopleListUseCase)
    {
        self.peopleListUseCase = peopleListUseCase
    }
    
    func fetchPeopleList() -> Promise<[PeopleResults]> {
        
        return Promise<[PeopleResults]> { results in
            
            let todosPromise: Promise<PeopleResponseModel_Base> = peopleListUseCase.execute(paramters: nil)
            
            firstly {
                todosPromise
            }
            .done {[weak self] peopleList in
                guard let self = self, let arrResults = peopleList.results else { throw RuntimeError.init(MessageConstants.someThingWentWrong) }
                self.arrPeopleList = arrResults
                return results.fulfill(arrResults)
            }
            
            .catch { error in
                return results.reject(error)
            }
        }
    }
    
    func peopleAt(index: Int) -> PeopleResults? {
        guard peopleCount > index else { return nil }
        return arrPeopleList[index]
    }
    
}
