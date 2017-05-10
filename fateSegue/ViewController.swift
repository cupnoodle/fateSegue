//
//  ViewController.swift
//  fateSegue
//
//  Created by Soul on 08/05/2017.
//  Copyright © 2017 sweatshops. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
	@IBOutlet weak var collectionView: UICollectionView!
	
	let transition = TranslationAnimator()
	let servantDataSource = ServantCollectionViewDataSource()
	var selectedImageFrame = CGRect.zero
	var selectedImageView : UIImageView = UIImageView()
	var selectedImage : UIImage = UIImage()
	var selectedLabelFrame = CGRect.zero
	var selectedLabel : UILabel = UILabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		self.configureCollectionView()
		self.collectionView.delegate = self
		self.collectionView.dataSource = servantDataSource
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	func configureCollectionView(){
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		layout.itemSize = CGSize(width: 90, height: 150)
		layout.scrollDirection = .vertical
		
		self.collectionView?.collectionViewLayout = layout
		self.collectionView?.register(UINib(nibName: servantDataSource.nibName, bundle: Bundle.main) , forCellWithReuseIdentifier: servantDataSource.cellIdentifier)
	}
	
	// user tapped the item in collection view
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let selectedServantCell = self.collectionView?.cellForItem(at: indexPath) as! ServantCollectionViewCell
		selectedImageFrame = self.view.convert(selectedServantCell.servantImageView.frame, from: selectedServantCell)
		selectedImage = selectedServantCell.servantImageView.image!
		selectedImageView = selectedServantCell.servantImageView
		
		selectedLabelFrame = self.view.convert(selectedServantCell.servantNameLabel.frame, from: selectedServantCell)
		selectedLabel = selectedServantCell.servantNameLabel
		
		presentServantDetail(indexPath)
	}
	
	func presentServantDetail(_ indexPath: IndexPath){
		let servantDetails = storyboard!.instantiateViewController(withIdentifier: "ServantDetailViewController") as! ServantDetailViewController
		servantDetails.servantIndexPath = indexPath
		
		servantDetails.transitioningDelegate = self
		present(servantDetails, animated: true, completion: nil)
	}
}

extension ViewController: UIViewControllerTransitioningDelegate {
	func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		
		transition.presentingView = presenting.view
		transition.originImageFrame = selectedImageFrame
		transition.endImageFrame = (presented as! ServantDetailViewController).servantImage.frame
		transition.presenting = true
		transition.image = selectedImage
		
		transition.originLabelFrame = selectedLabelFrame
		transition.endLabelFrame = (presented as! ServantDetailViewController).servantLabel.frame
		transition.label = selectedLabel
		
		selectedImageView.alpha = 0.0
		selectedLabel.alpha = 0.0
		return transition
	}
	
	func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		transition.presenting = false
		
		transition.originImageFrame = (dismissed as! ServantDetailViewController).servantImage.frame
		transition.endImageFrame = selectedImageFrame
		transition.image = selectedImage
		
		transition.originLabelFrame = (dismissed as! ServantDetailViewController).servantLabel.frame
		transition.endLabelFrame = selectedLabelFrame
		transition.label = selectedLabel
		
		selectedImageView.alpha = 0.0
		selectedLabel.alpha = 0.0
		
		print("dismissing lel")
		
		return transition
	}
	
	
}
