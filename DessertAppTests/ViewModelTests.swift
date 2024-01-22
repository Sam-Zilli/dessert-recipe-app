//
//  ViewModelTests.swift
//  fetch-recipesTests
//
//  Created by Sam on 1/21/24.
//

// ViewModelTests.swift
// fetch-recipesTests
//
// Created by Sam on 1/21/24.

import XCTest
@testable import fetch_recipes

final class ViewModelTests: XCTestCase {

    class MockDataFetcher: DataFetcher {
        var fetchDessertRecipesCalled = false
        var fetchRecipeCalled = false

        func fetchDessertRecipes() async throws -> [Meal] {
            fetchDessertRecipesCalled = true
            // Return mock data if needed
            return []
        }

        func fetchRecipe(from meal: Meal) async throws -> Recipe {
            fetchRecipeCalled = true
            // Return the mock recipe data
            return MockData.mockRecipe
        }
    }
    
    
    
    func testGetRecipeById() {
        // Given
        let mockDataFetcher = MockDataFetcher()
        let viewModel = ViewModel(dataFetcher: mockDataFetcher)
        let mockMeal = Meal(idMeal: "123", strMeal: "Mock Meal", strMealThumb: URL(string: "https://example.com/mock_meal.jpg")!)

        // Create an expectation
        let expectation = XCTestExpectation(description: "Fetching recipe")

        // When
        viewModel.getRecipeById(for: mockMeal) { result in
            switch result {
            case .success(let recipe):
                // Then
                XCTAssertTrue(mockDataFetcher.fetchRecipeCalled, "fetchRecipe should be called")
                XCTAssertEqual(viewModel.status, .recipeSuccess(data: recipe), "ViewModel status should be .recipeSuccess with mock recipe data")
            case .failure:
                XCTFail("Unexpected failure")
            }

            // Fulfill the expectation
            expectation.fulfill()
        }

        // Wait for the expectation to be fulfilled, with a timeout if necessary
        wait(for: [expectation], timeout: 5.0)
    }



}
