//
//  ServantDetailViewController.swift
//  fateSegue
//
//  Created by Soul on 08/05/2017.
//  Copyright © 2017 sweatshops. All rights reserved.
//

import UIKit

class ServantDetailViewController: UIViewController {

	var servantIndexPath: IndexPath = IndexPath()
	
	@IBOutlet weak var servantLabel: UILabel!
	@IBOutlet weak var servantImage: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(servantImageTapped(_:)) )
		self.servantImage.isUserInteractionEnabled = true
		self.servantImage.addGestureRecognizer(imageTapRecognizer)
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.servantLabel.text = Servants().allNames()[servantIndexPath.item]
		self.servantImage.image = UIImage(named: Servants().allImages()[servantIndexPath.item])
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

	func servantImageTapped(_ tapGesture: UITapGestureRecognizer){
		print("servant image tapped")
		self.servantLabel.alpha = 0.0
		self.servantImage.alpha = 0.0
		presentingViewController?.dismiss(animated: true, completion: nil)
	}
}
