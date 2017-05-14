//
//  ViewController.swift
//  RoundedButton
//
//  Created by Loic Verrall on 14/05/2017.
//  Copyright © 2017 Loic Verrall. All rights reserved.
//

import UIKit

/// This class simply demonstrates how to use the RoundedButton class (see RoundedButton.swift).
class ViewController: UIViewController {
	
	// Outlet to the default (blue) button.
	@IBOutlet weak var defaultButton: RoundedButton!
	
	// Outlet to the destructive (red) button.
	@IBOutlet weak var destructiveButton: RoundedButton!
	
	// Make the status bar light (against the dark background).
	override var preferredStatusBarStyle: UIStatusBarStyle { get { return .lightContent } }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		defaultButton.isDisabled = true
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		destructiveButton.isDisabled = true
	}

}

