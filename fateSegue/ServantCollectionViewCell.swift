//
//  ServantCollectionViewCell.swift
//  fateSegue
//
//  Created by Soul on 08/05/2017.
//  Copyright © 2017 sweatshops. All rights reserved.
//

import UIKit

class ServantCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var servantImageView: UIImageView!
	@IBOutlet weak var servantNameLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: 90, height: 150)
    }

}
