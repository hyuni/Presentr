//
//  DynamicViewController.swift
//  PresentrExample
//
//  Created by Daniel Lozano Valdés on 3/21/17.
//  Copyright © 2017 danielozano. All rights reserved.
//

import UIKit

class DynamicViewController: UIViewController {
	
	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var button: UIButton!
	@IBOutlet weak var tableView: UITableView!
	
	@IBOutlet weak var heightConstraint: NSLayoutConstraint!
	
	var isExpanded: Bool = false {
		didSet {
			print("isExpanded ==> \(isExpanded)")
			
			guard heightConstraint != nil else { return }
			
			if isExpanded {
				heightConstraint.constant = 250
			} else {
				heightConstraint.constant = 100
			}
			
			self.view.layoutIfNeeded()
			
			//self.view.invalidateIntrinsicContentSize()
			//self.view.setNeedsLayout()
			
			guard let presentationController = self.presentationController else { return }
			
			presentationController.containerViewWillLayoutSubviews()
			
		}
	}
	
	@IBAction func didTapButton(_ sender: Any) {
		isExpanded.toggle()
	}
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		//self.view.intrinsicContentSize = CGSize(width: 300, height: 300)
		isExpanded = false
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
//	override var preferredContentSize: CGSize {
//		CGSize(width: 100, height: 100)
//	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		//self.view.layoutIfNeeded()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		let size = self.view.systemLayoutSizeFitting(CGSize.zero)
		
		print("viewDidLayoutSubviews size ==> \(size)")
		
//		guard let presentationController = self.presentationController else { return }
//
//		presentationController.containerViewWillLayoutSubviews()
		
	}

}
