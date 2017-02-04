//
//  UIView+Rotation.swift
//
//  Created by Jim Rhoades on 1/22/17.
//

import UIKit

extension UIView {
	
	/**
	Animates rotating a UIView
	
		- Parameter duration:		In seconds, how long it takes to rotate the UIView 360 degrees.
		- Parameter repeatCount:	The number of times to repeat the rotation. Use ".infinity" to repeat indefinitely.
		- Parameter clockwise:		Set to true if you want it to rotate clockwise, false if you want it to rotate counter-clockwise.
	*/
	func startRotation(duration: CFTimeInterval, repeatCount: Float, clockwise: Bool) {
		// this helped figure out how to start/stop from current rotation angle
		// instead of resetting each time
		// http://stackoverflow.com/a/38471346/234609
		
		// get the current rotation angle
		var currentRotationAngle: CGFloat = 0
		if let presentationLayer = layer.presentation(), let zValue = presentationLayer.value(forKeyPath: "transform.rotation.z") as? CGFloat {
			currentRotationAngle = zValue
		}
		
		// animate rotating the view 360 degrees
		let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
		rotationAnimation.fromValue = currentRotationAngle
		if clockwise {
			rotationAnimation.toValue = M_PI * 2.0 + Double(currentRotationAngle)
		}
		else {
			rotationAnimation.toValue = -M_PI * 2.0 + Double(currentRotationAngle)
		}
		rotationAnimation.duration = duration
		rotationAnimation.repeatCount = repeatCount
		layer.add(rotationAnimation, forKey: nil)
	}
	
	/**
		Stops the UIView from rotating, and keeps it at the rotation angle it had when it stopped.
	*/
	func stopRotation() {
		// get the current rotation angle of the view
		var currentRotationAngle: CGFloat = 0
		if let presentationLayer = layer.presentation(), let zValue = presentationLayer.value(forKeyPath: "transform.rotation.z") as? CGFloat {
			currentRotationAngle = zValue
		}
		
		// remove the animation
		// this has the side effect of rotating it back to the starting angle
		layer.removeAllAnimations()
		
		// rotate the view back to the correct rotation angle
		layer.transform = CATransform3DMakeRotation(currentRotationAngle, 0, 0, 1)
	}
	
	/**
		Resets the UIView back to its starting rotation angle.
	*/
	func resetRotation() {
		layer.transform = CATransform3DMakeRotation(0, 0, 0, 1)
	}
}
