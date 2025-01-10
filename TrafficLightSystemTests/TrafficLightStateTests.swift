//
//  TrafficLightStateTests.swift
//  TrafficLightSystem
//
//  Created by Borislav Borisov on 10/01/2025.
//

import XCTest
@testable import TrafficLightSystem

final class TrafficLightStateTests: XCTestCase {

	func testNextState_redToGreen() {
		let currentState = TrafficLightState.red
		let nextState = TrafficLightState.nextState(after: currentState)

		XCTAssertEqual(nextState, .green)
	}

	func testNextState_greenToOrange() {
		let currentState = TrafficLightState.green
		let nextState = TrafficLightState.nextState(after: currentState)

		XCTAssertEqual(nextState, .orange)
	}

	func testNextState_orangeToRed() {
		let currentState = TrafficLightState.orange
		let nextState = TrafficLightState.nextState(after: currentState)

		XCTAssertEqual(nextState, .red)
	}

	func testTrafficLightDurations() {
		XCTAssertEqual(TrafficLightState.red.duration, 4.0)
		XCTAssertEqual(TrafficLightState.orange.duration, 1.0)
		XCTAssertEqual(TrafficLightState.green.duration, 4.0)
	}
}
