//
//  CarInputViewController.swift
//  TrafficLightSystem
//
//  Created by Borislav Borisov on 10/01/2025.
//

import UIKit

final class CarInputViewController: UIViewController {

	private let viewModel = CarInputViewModel()

	@IBOutlet private weak var carModelLabel: UILabel!
	@IBOutlet private weak var carModelTextField: UITextField!
	@IBOutlet private weak var startDrivingButton: UIButton!
	
	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}

	// MARK: - Private

	private func setup() {
		carModelLabel.text = String(localized: "Car Model")
		carModelTextField.placeholder = String(localized: "Write your car's model here")
		startDrivingButton.setTitle(String(localized: "Start Driving"), for: .normal)

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.title = String(localized: "Car Model Input")
	}

	// MARK: - IBAction

	@IBAction private func textFieldDidChange(_ sender: UITextField) {
		viewModel.carModel = sender.text ?? ""
	}
	
	@IBAction private func startDriving(_ sender: UIButton) {
		guard viewModel.isCarModelValid else {
			ValidationAlertPresenter.present(
				on: self,
				title: String(localized: "Invalid Car Model"),
				message: String(localized: "Car model must be at least 3 characters long.")
			)
			return
		}

		performSegue(withIdentifier: SegueIdentifier.showTrafficLight, sender: nil)
	}

	// MARK: - IBSegueAction

	@IBSegueAction private func showTrafficLight(coder: NSCoder) -> TrafficLightViewController? {
		let trafficLightViewModel = TrafficLightViewModel(carModel: viewModel.carModel)
		return TrafficLightViewController(coder: coder, viewModel: trafficLightViewModel)
	}
}
