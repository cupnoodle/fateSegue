//
//  TranslationAnimator.swift
//  fateSegue
//
//  Created by Axel Kee on 08/05/2017.
//  Copyright © 2017 sweatshops. All rights reserved.
//

import UIKit

class TranslationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
	
	let duration = 1.0
	
	// presenting or dismissing
	var presenting = true
	
	// original frame rect of the image the user taps
	var originImageFrame = CGRect.zero
	
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return duration
	}
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		
	}

}
