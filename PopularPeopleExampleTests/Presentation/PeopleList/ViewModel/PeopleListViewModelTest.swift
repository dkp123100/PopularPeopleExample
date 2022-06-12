//
//  PeopleListViewModelTest.swift
//  PopularPeopleExampleTests
//
//  Created by Patel Dhruvkumar Kiranbhai on 13/06/22.
//

import Foundation
import XCTest
import PromiseKit
@testable import PopularPeopleExample


class PeopleListViewModelTest: XCTestCase {
    
    func test_fetch_people_list_success_case() throws {
        
        let expectation = expectation(description: "test_fetch_people_list_success_case")
        
        let mockCalledPostAPIResponse = PeopleListRepositoryTest.mockPeopleListResponse()
        let resource = DefaultPeopleListRepository(serviceManager: MockServiceManager(mockCalledPostAPIResponse: mockCalledPostAPIResponse, error: nil))
        let todosPromise: Promise<PeopleResponseModel_Base> = resource.fetchPeopleList(paramters: nil)
        firstly {
            todosPromise
        }
        .done {peopleList in
            XCTAssertNotNil(peopleList)
            expectation.fulfill()
        }
        .catch { error in
            XCTFail(error.localizedDescription)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_fetch_people_list_failure_case() throws {
        
        let resource = DefaultPeopleListRepository(serviceManager: MockServiceManager(mockCalledPostAPIResponse: nil, error: RuntimeError.init(MessageConstants.someThingWentWrong)))
        let expectation = expectation(description: "test_fetch_people_list_failure_case")
        let todosPromise: Promise<PeopleResponseModel_Base> = resource.fetchPeopleList(paramters: nil)
        firstly {
            todosPromise
        }
        .done {peopleList in
            XCTFail("peopleList should be empty")
            expectation.fulfill()
        }
        .catch { error in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
