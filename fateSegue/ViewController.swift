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
}
