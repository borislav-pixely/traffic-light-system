//
//  TrafficLightViewModelTests.swift
//  TrafficLightSystem
//
//  Created by Borislav Borisov on 10/01/2025.
//

import XCTest
import Combine
@testable import TrafficLightSystem

final class TrafficLightViewModelTests: XCTestCase {

	private var cancellables = Set<AnyCancellable>()

	func testCarModelFormatted() {
		let viewModel = TrafficLightViewModel(carModel: "BMW")
		let formatted = viewModel.carModelFormatted

		XCTAssertEqual(formatted, "Car Model: BMW")
	}

	func testInitialTrafficLightState() {
		let viewModel = TrafficLightViewModel(carModel: "BMW")
		let initialState = viewModel.currentState

		XCTAssertEqual(initialState, .red)
	}

	func testTrafficLightTransitionsThroughStates() {
		let expectation = expectation(description: "Traffic light transitions through all states")
		let viewModel = TrafficLightViewModel(carModel: "BMW")

		var observedStates: [TrafficLightState] = []
		viewModel.$currentState
			.sink { state in
				observedStates.append(state)
				if observedStates == [.red, .green, .orange, .red] {
					expectation.fulfill()
				}
			}
			.store(in: &cancellables)

		viewModel.startTrafficLight()

		wait(for: [expectation], timeout: 11.0)
	}

	func testStopTrafficLight() {
		let viewModel = TrafficLightViewModel(carModel: "BMW")

		viewModel.startTrafficLight()
		viewModel.stopTrafficLight()

		XCTAssertNil(viewModel.timer)
	}
}
