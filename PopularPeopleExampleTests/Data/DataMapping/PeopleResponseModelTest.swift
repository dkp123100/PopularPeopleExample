//
//  PeopleResponseModelTest.swift
//  PopularPeopleExampleTests
//
//  Created by Patel Dhruvkumar Kiranbhai on 14/06/22.
//

import Foundation
import XCTest
@testable import PopularPeopleExample

class PeopleResponseModelTest: XCTestCase {
    
    func testPeopleListResponse() throws {
       
        let peopleListResponse = PeopleListRepositoryTest.mockPeopleListResponse()

        XCTAssertEqual(peopleListResponse?.total_results, 1)
        XCTAssertEqual(peopleListResponse?.results?.count, 1)
        
        let result = peopleListResponse?.results?.first
        XCTAssertEqual(result?.gender, 2)
        XCTAssertEqual(result?.adult, false)
        XCTAssertEqual(result?.known_for_department, "Acting")
        XCTAssertEqual(result?.name, "Antony Starr")
        XCTAssertEqual(result?.popularity, 81.26)
        XCTAssertEqual(result?.profile_path, "/dyTQZSc6Jl7Ph1PvCTW7cx4ByIY.jpg")
    }
}
