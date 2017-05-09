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
	
	
	var originLabelFrame = CGRect.zero
	var endLabelFrame = CGRect.zero
	var label: UILabel = UILabel()
	
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
			
			let tmpLabelView = UILabel(frame: originLabelFrame)
			tmpLabelView.font = label.font
			tmpLabelView.textColor = label.textColor
			tmpLabelView.text = label.text
			tmpLabelView.textAlignment = label.textAlignment
			
			containerView.addSubview(tmpImageView)
			containerView.addSubview(tmpLabelView)
			
			containerView.backgroundColor = UIColor.white
			
			let newSize : CGFloat = 15.3
			
			tmpLabelView.font = UIFont.systemFont(ofSize: newSize)
			tmpLabelView.transform = CGAffineTransform(scaleX: 14.0 / newSize, y: 14.0 / newSize)
			tmpLabelView.sizeToFit()
			
			UIView.animate(
				withDuration: duration,
				animations: {
					fromView.alpha = 0.0
					tmpImageView.frame = self.endImageFrame
					tmpLabelView.frame.origin.y = 353
					tmpLabelView.center.x = self.endLabelFrame.midX
					tmpLabelView.transform = CGAffineTransform(scaleX: newSize / 14.0, y: newSize / 14.0)
					
			}, completion: { _ in
				
				tmpLabelView.font = UIFont.systemFont(ofSize: 17.0)
				tmpLabelView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
				tmpLabelView.sizeToFit()
				
				
				containerView.addSubview(toView)
				transitionContext.completeTransition(true)
			})

		}
		

	}

}
