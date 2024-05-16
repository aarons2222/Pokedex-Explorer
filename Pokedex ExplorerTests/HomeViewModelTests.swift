//
//  Pokedex_ExplorerTests.swift
//  Pokedex ExplorerTests
//
//  Created by Aaron Strickland on 13/05/2024.
//

import XCTest

import XCTest
@testable import Pokedex_Explorer

class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = HomeViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchPokemons() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch Pokemons")
        
        // When
        Task{
             await viewModel.fetchPokemons()
        }
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // Adjust time based on network speed
            XCTAssertFalse(self.viewModel.pokemons.isEmpty, "Pokemons should be fetched")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testSortPokemons() {
        // Given
        let pokemons = [
            Pokemon(name: "Charmander", url: ""),
            Pokemon(name: "Bulbasaur", url: ""),
            Pokemon(name: "Squirtle", url: "")
        ]
        
        // When
        let sortedByName = viewModel.sortPokemons(pokemons, order: .ascending)
        let sortedByRandom = viewModel.sortPokemons(pokemons, order: .random)
        
        // Then
        XCTAssertEqual(sortedByName, pokemons.sorted { $0.name < $1.name }, "Pokemons should be sorted by name in ascending order")
        XCTAssertNotEqual(sortedByRandom, pokemons, "Pokemons should be shuffled")
    }
    
    func testFilteredPokemons() {
        // Given
        let searchText = "char"
        viewModel.searchText = searchText
        
        // When
        let filteredPokemons = viewModel.filteredPokemons
        
        // Then
        XCTAssertTrue(filteredPokemons.allSatisfy { $0.name.lowercased().contains(searchText.lowercased()) }, "Filtered pokemons should contain only those whose name contains the search text")
    }
}
