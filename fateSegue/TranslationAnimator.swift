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
	
	var endImageFrame = CGRect.zero
	
	var image: UIImage = UIImage()
	
	var presentingView : UIView = UIView()
	
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return duration
	}
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		let containerView = transitionContext.containerView
		let toView = transitionContext.view(forKey: .to)!
		let fromView = transitionContext.view(forKey: .from)!
		
		let initialFrame = presenting ? originImageFrame : endImageFrame
		let finalFrame = presenting ? endImageFrame : originImageFrame
		
		let xScaleFactor = presenting ?
			initialFrame.width / finalFrame.width :
			finalFrame.width / initialFrame.width
		
		let yScaleFactor = presenting ?
			initialFrame.height / finalFrame.height :
			finalFrame.height / initialFrame.height
		
		let scaleTransform = CGAffineTransform(scaleX: xScaleFactor,
		                                       y: yScaleFactor)
		
		if presenting{
			let tmpImageView = UIImageView(frame: originImageFrame)
			tmpImageView.image = image
			toView.addSubview(tmpImageView)
			toView.alpha = 1.0
			
			containerView.addSubview(toView)
			fromView.alpha = 0.0
		}
		

	}

}
