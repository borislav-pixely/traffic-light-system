//
//  TrafficLightViewModel.swift
//  TrafficLightSystem
//
//  Created by Borislav Borisov on 10/01/2025.
//

import Foundation
import Combine

final class TrafficLightViewModel: ObservableObject {

	@Published private(set) var currentState = TrafficLightState.red

	private let carModel: String
	private(set) var timer: Timer?

	var carModelFormatted: String {
		return String(localized: "Car Model: \(carModel)")
	}

	init(carModel: String) {
		self.carModel = carModel
	}

	// MARK: - Public

	func startTrafficLight() {
		timer?.invalidate()
		scheduleNextStateChange()
	}

	func stopTrafficLight() {
		timer?.invalidate()
		timer = nil
	}

	// MARK: - Private

	private func scheduleNextStateChange() {
		timer = Timer.scheduledTimer(
			withTimeInterval: currentState.duration,
			repeats: false
		) { [weak self] _ in
			guard let self = self else { return }

			self.currentState = TrafficLightState.nextState(after: self.currentState)
			self.scheduleNextStateChange()
		}
	}
}
