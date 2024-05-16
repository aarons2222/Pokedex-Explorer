//
//  DetailViewModelTests.swift
//  Pokedex ExplorerTests
//
//  Created by Aaron Strickland on 15/05/2024.
//

import XCTest
@testable import Pokedex_Explorer

class DetailViewModelTests: XCTestCase {
    
    var viewModel: DetailViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = DetailViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchPokemonDetail() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch Pokemon Detail")
        let pokemonId = 25 // Pikachu
        
        // When
        Task{
           await viewModel.fetchPokemonDetail(pokemonId: pokemonId)
        }
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // Adjust time based on network speed
            XCTAssertFalse(self.viewModel.pokemonDetails.name.isEmpty, "Pokemon detail should be fetched")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
}
