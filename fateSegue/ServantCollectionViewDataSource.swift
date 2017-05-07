//
//  ServantCollectionViewDataSource.swift
//  fateSegue
//
//  Created by Soul on 08/05/2017.
//  Copyright © 2017 sweatshops. All rights reserved.
//

import UIKit

class ServantCollectionViewDataSource: NSObject, UICollectionViewDataSource {
	let servantStore = Servants()
	let cellIdentifier = "servantCellIdentifier"
	let nibName = "ServantCollectionViewCell"
	var collectionView: UICollectionView?

	// Mark: Collection View Data Source
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return servantStore.allImages().count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let servantImageName = servantStore.allImages()[indexPath.item]
		let servantName = servantStore.allNames()[indexPath.item]
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ServantCollectionViewCell
		
		cell.servantImageView.image = UIImage(named: servantImageName)
		cell.servantNameLabel.text = servantName
		
		return cell
	}
	
}
