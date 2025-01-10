//
//  TrafficLightViewController.swift
//  TrafficLightSystem
//
//  Created by Borislav Borisov on 10/01/2025.
//

import UIKit
import Combine

final class TrafficLightViewController: UIViewController {

	private let viewModel: TrafficLightViewModel
	private var cancellables = Set<AnyCancellable>()

	@IBOutlet private weak var carModel: UILabel!
	@IBOutlet private weak var redLightView: UIView!
	@IBOutlet private weak var orangeLightView: UIView!
	@IBOutlet private weak var greenLightView: UIView!

	init?(coder: NSCoder, viewModel: TrafficLightViewModel) {
		self.viewModel = viewModel
		super.init(coder: coder)
	}

	required init?(coder: NSCoder) {
		self.viewModel = TrafficLightViewModel(carModel: "")
		super.init(coder: coder)
	}

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}

	// MARK: - Private

	private func setup() {
		navigationItem.title = String(localized: "Traffic Light")
		carModel.text = viewModel.carModelFormatted

		viewModel.$currentState
			.receive(on: DispatchQueue.main)
			.sink { [weak self] state in
				self?.updateTrafficLight(to: state)
			}
			.store(in: &cancellables)

		viewModel.startTrafficLight()
	}

	private func updateTrafficLight(to state: TrafficLightState) {
		UIView.animate(withDuration: 0.4) { [weak self] in
			self?.redLightView.backgroundColor = state == .red ? .redLight : .disabledRedLight
			self?.orangeLightView.backgroundColor = state == .orange ? .orangeLight : .disabledOrangeLight
			self?.greenLightView.backgroundColor = state == .green ? .greenLight : .disabledGreenLight
		}
	}
}
