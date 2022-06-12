//
//  PopularPeopleDIContainerTest.swift
//  PopularPeopleExampleTests
//
//  Created by Patel Dhruvkumar Kiranbhai on 12/06/22.
//

import Foundation
import PromiseKit
@testable import PopularPeopleExample

// MARK: - Use Cases
func makeMockPeopleListUseCase(mockCalledPostAPIResponse: Any?, error: Error?) -> PeopleListUseCase {
    return DefaultPeopleListUseCase(peopleListRepository: makeMockPeopleListRepository(mockCalledPostAPIResponse: mockCalledPostAPIResponse, error: error))
}

// MARK: - Repositories
func makeMockPeopleListRepository(mockCalledPostAPIResponse: Any?, error: Error?) -> PeopleListRepository {
    return DefaultPeopleListRepository(serviceManager: MockServiceManager(mockCalledPostAPIResponse: mockCalledPostAPIResponse, error:error))
}
