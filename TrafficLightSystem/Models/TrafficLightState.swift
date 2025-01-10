//
//  TrafficLightState.swift
//  TrafficLightSystem
//
//  Created by Borislav Borisov on 10/01/2025.
//

import Foundation

enum TrafficLightState: CaseIterable {
	case red
	case orange
	case green

	var duration: TimeInterval {
		switch self {
		case .red: return 4.0
		case .orange: return 1.0
		case .green: return 4.0
		}
	}

	static func nextState(after current: TrafficLightState) -> TrafficLightState {
		switch current {
		case .green:
			return .orange
		case .orange:
			return .red
		case .red:
			return .green
		}
	}
}
