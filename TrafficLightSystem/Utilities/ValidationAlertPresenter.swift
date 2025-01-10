//
//  ValidationAlertPresenter.swift
//  TrafficLightSystem
//
//  Created by Borislav Borisov on 10/01/2025.
//

import UIKit

class ValidationAlertPresenter {
	static func present(
		on viewController: UIViewController,
		title: String,
		message: String,
		buttonTitle: String = String(localized: "OK")
	) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: buttonTitle, style: .default)

		alert.addAction(action)
		viewController.present(alert, animated: true)
	}
}
