//
//  TranslationAnimator.swift
//  fateSegue
//
//  Created by Axel Kee on 08/05/2017.
//  Copyright © 2017 sweatshops. All rights reserved.
//

import UIKit

class TranslationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
	
	let duration = 0.8
	
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
		
		let toViewController = transitionContext.viewController(forKey: .to)!
		
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
			
			fromView.alpha = 1.0

			UIView.animate(
				withDuration: duration,
				delay: 0.0,
				options: .curveEaseInOut,
				animations: {
					fromView.alpha = 0.0
					tmpImageView.frame = self.endImageFrame
					tmpLabelView.frame.origin.y = self.endLabelFrame.origin.y + 3
					tmpLabelView.center.x = self.endLabelFrame.midX
					tmpLabelView.transform = CGAffineTransform(scaleX: newSize / 14.0, y: newSize / 14.0)
					
			}, completion: { _ in
				
				tmpLabelView.font = UIFont.systemFont(ofSize: 17.0)
				tmpLabelView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
				tmpLabelView.sizeToFit()
				
				
				containerView.addSubview(toView)
				
				// restore view controller view alpha to 1.0 after animation
				fromView.alpha = 1.0
				tmpImageView.removeFromSuperview()
				tmpLabelView.removeFromSuperview()
				transitionContext.completeTransition(true)
			})

		} else {
			
			let tmpImageView = UIImageView(frame: originImageFrame)
			tmpImageView.image = image
			tmpImageView.alpha = 1.0
			
			let tmpLabelView = UILabel(frame: originLabelFrame)
			tmpLabelView.font = UIFont.systemFont(ofSize: 17.0)
			tmpLabelView.textColor = label.textColor
			tmpLabelView.text = label.text
			tmpLabelView.textAlignment = label.textAlignment
			
			let newSize : CGFloat = 15.5
			
			containerView.addSubview(tmpImageView)
			containerView.addSubview(tmpLabelView)
			
			containerView.backgroundColor = UIColor.white
			
			fromView.alpha = 1.0
			
			tmpLabelView.font = UIFont.systemFont(ofSize: newSize)
			tmpLabelView.transform = CGAffineTransform(scaleX: 17.0 / newSize, y: 17.0 / newSize)
			tmpLabelView.sizeToFit()
			
			toView.alpha = 0.0
			containerView.insertSubview(toView, belowSubview: tmpImageView)
			
			UIView.animate(
				withDuration: duration,
				delay: 0.0,
				options: .curveEaseInOut,
				animations: {
					toView.alpha = 1.0
					fromView.alpha = 0.0
					tmpImageView.frame = self.endImageFrame
					tmpLabelView.frame.origin.y = self.endLabelFrame.origin.y - 2
					tmpLabelView.center.x = self.endLabelFrame.midX
					tmpLabelView.transform = CGAffineTransform(scaleX: newSize / 17.0, y: newSize / 17.0)
					
			}, completion: { _ in
				
				tmpLabelView.font = UIFont.systemFont(ofSize: 14.0)
				tmpLabelView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
				tmpLabelView.sizeToFit()
				
				(toViewController as! ViewController).selectedImageView.alpha = 1.0
				(toViewController as! ViewController).selectedLabel.alpha = 1.0
				
				transitionContext.completeTransition(true)
			})
			
		}
		

	}

}
