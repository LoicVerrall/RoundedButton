//
//  RoundedButton.swift
//  PetRemind
//
//  Created by Loic Verrall on 09/11/2016.
//  Copyright © 2017 Loic Verrall. All rights reserved.
//

import UIKit
import QuartzCore


fileprivate struct Colors {
	static let defaultBlue = #colorLiteral(red: 0.2806159854, green: 0.724293828, blue: 0.8902605176, alpha: 1)
	static let destructiveRed = #colorLiteral(red: 1, green: 0.3824155331, blue: 0.389177084, alpha: 1)
	
	static let disabledGray = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
}

/// A beautifully rectangularly-rounded button. Available in two flavours: `Default` (blue), and `Destructive` (red).
@IBDesignable open class RoundedButton: UIButton {
	
	/// Sets the corner radius of this rounded button.
	@IBInspectable var cornerRadius: CGFloat = 4.0 {
		didSet {
			layer.cornerRadius = cornerRadius
		}
	}
	
	/// The alpha to dim to when the button is pressed.
	let alphaWhenPressed: CGFloat = 0.5
	
	/// The time, in seconds, it takes for the button to dim or undim when pressed, or when disabled.
	let dimDuration: TimeInterval = 0.2
	
	/// Used to dim the button when it is pressed.
	override open var isHighlighted: Bool {
		didSet {
			UIView.animate(withDuration: dimDuration) {
				self.alpha = self.isHighlighted ? self.alphaWhenPressed : 1.0
			}
		}
	}
	
	/// Used to change the color of the button to disabledGray if the button is disabled.
	var isDisabled = false {
		didSet {
			UIView.animate(withDuration: dimDuration) {
				self.backgroundColor = self.isDisabled ? Colors.disabledGray : self.tintColor
			}
		}
	}
	
	
	
	
	// MARK: -
	
	/// Calls the `configureButton()` function to set up the buttons properties.
	override open func awakeFromNib() {
		super.awakeFromNib()
		configureButton()
	}
	
	/// Calls the `configureButton()` function to set up the buttons properties.
	/// This function is called when the IBDesignables are drawn in Interface Builder.
	override open func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		configureButton()
	}
	
	/// Configures the button for display by clipping the corners and setting the border, as well as the text color.
	fileprivate func configureButton() {
		clipsToBounds = true
		layer.cornerRadius = cornerRadius
		layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
		layer.borderWidth = 2
		
		backgroundColor = tintColor
		
		setTitleColor(.white, for: .normal)
		setAttributedTitle(NSAttributedString(string: titleLabel?.text ?? "", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 17)]), for: .normal)
	}
}
