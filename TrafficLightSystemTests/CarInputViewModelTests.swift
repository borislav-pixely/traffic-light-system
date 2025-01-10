//
//  CarInputViewModelTests.swift
//  TrafficLightSystem
//
//  Created by Borislav Borisov on 10/01/2025.
//

import XCTest
@testable import TrafficLightSystem

final class CarInputViewModelTests: XCTestCase {

	func testCarModelValidation_validModel() {
		let viewModel = CarInputViewModel()
		viewModel.carModel = "BMW"

		let isValid = viewModel.isCarModelValid

		XCTAssertTrue(isValid)
	}

	func testCarModelValidation_invalidModel() {
		let viewModel = CarInputViewModel()
		viewModel.carModel = "BM"

		let isValid = viewModel.isCarModelValid

		XCTAssertFalse(isValid)
	}

	func testCarModelValidation_emptyModel() {
		let viewModel = CarInputViewModel()

		let isValid = viewModel.isCarModelValid

		XCTAssertFalse(isValid)
	}
}
