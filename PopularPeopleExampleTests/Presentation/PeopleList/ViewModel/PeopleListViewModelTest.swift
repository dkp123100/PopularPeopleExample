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
    
    var mockCalledPostAPIResponse: PeopleResponseModel_Base!
    var mockPeopleListUseCase: PeopleListUseCase!
    var peopleListViewModel: PeopleListViewModel!
    
    override func setUp() {
        mockCalledPostAPIResponse = PeopleListRepositoryTest.mockPeopleListResponse()
    }
    
    func test_fetch_people_list_success_case() throws {
        
        let expectation = expectation(description: "test_fetch_people_list_success_case")
        
        mockPeopleListUseCase = makeMockPeopleListUseCase(mockCalledPostAPIResponse: mockCalledPostAPIResponse, error: nil)
        peopleListViewModel = DefaultPeopleListViewModel(peopleListUseCase: mockPeopleListUseCase)
        let todosPromise: Promise<[PeopleResults]> = peopleListViewModel.fetchPeopleList()
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
        
        let expectation = expectation(description: "test_fetch_people_list_failure_case")
        mockPeopleListUseCase = makeMockPeopleListUseCase(mockCalledPostAPIResponse: nil, error: RuntimeError.init(MessageConstants.someThingWentWrong))
        peopleListViewModel = DefaultPeopleListViewModel(peopleListUseCase: mockPeopleListUseCase)
        let todosPromise: Promise<[PeopleResults]> = peopleListViewModel.fetchPeopleList()
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
    
    func test_item_list_with_valid_index_and_count() {

        mockPeopleListUseCase = makeMockPeopleListUseCase(mockCalledPostAPIResponse: mockCalledPostAPIResponse, error: nil)
        let defaultPeopleListViewModel = DefaultPeopleListViewModel(peopleListUseCase: mockPeopleListUseCase)
        defaultPeopleListViewModel.arrPeopleList = mockCalledPostAPIResponse.results!
        
        let listCount = defaultPeopleListViewModel.peopleCount
        XCTAssertEqual(listCount, defaultPeopleListViewModel.arrPeopleList.count)
        
        let eachPeople = defaultPeopleListViewModel.peopleAt(index: listCount - 1)
        XCTAssertNotNil(eachPeople)
    }
}
