//
//  PopularPeopleDIContainer.swift
//  PopularPeopleExample
//
//  Created by Patel Dhruvkumar Kiranbhai on 10/06/22.
//

import Foundation

// MARK: - View Model
func makePeopleListViewModel() -> PeopleListViewModel {
    return DefaultPeopleListViewModel(peopleListUseCase: makePeopleListUseCase())
}

// MARK: - Use Cases
func makePeopleListUseCase() -> PeopleListUseCase {
    return DefaultPeopleListUseCase(peopleListRepository: makePeopleListRepository())
}

// MARK: - Repositories
func makePeopleListRepository() -> PeopleListRepository {
    return DefaultPeopleListRepository(serviceManager: DefaultServiceManager.shared)
}
