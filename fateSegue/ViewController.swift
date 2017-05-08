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
		print("did select item")
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
		return transition
	}
	
	func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return nil
	}
}
