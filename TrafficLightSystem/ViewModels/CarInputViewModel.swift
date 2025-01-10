//
//  CarInputViewModel.swift
//  TrafficLightSystem
//
//  Created by Borislav Borisov on 10/01/2025.
//

import Foundation
import Combine

final class CarInputViewModel: ObservableObject {

	var carModel: String = ""

	var isCarModelValid: Bool {
		return carModel.count >= 3
	}
}
