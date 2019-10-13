//
//  ViewController.swift
//  ChartMultiplier
//
//  Created by 정기욱 on 2019/10/13.
//  Copyright © 2019 kiwook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func increase(_ sender: UIButton) {
      
        
        UIView.animate(withDuration: 1) {
            self.graphHeight1 = self.graphHeight1.changeMultiplier(value: 0.5)
            self.graphHeight2 = self.graphHeight2.changeMultiplier(value: 0.6)
            self.graphHeight3 = self.graphHeight3.changeMultiplier(value: 0.7)
            self.graphHeight4 = self.graphHeight4.changeMultiplier(value: 0.8)
            self.graphHeight5 = self.graphHeight5.changeMultiplier(value: 0.9)
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func decrease(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            self.graphHeight1 = self.graphHeight1.changeMultiplier(value: 0.9)
            self.graphHeight2 = self.graphHeight2.changeMultiplier(value: 0.8)
            self.graphHeight3 = self.graphHeight3.changeMultiplier(value: 0.7)
            self.graphHeight4 = self.graphHeight4.changeMultiplier(value: 0.6)
            self.graphHeight5 = self.graphHeight5.changeMultiplier(value: 0.5)
            self.view.layoutIfNeeded()
        }
      
    }
    
    @IBOutlet weak var graphHeight1: NSLayoutConstraint!
    @IBOutlet weak var graphHeight2: NSLayoutConstraint!
    @IBOutlet weak var graphHeight3: NSLayoutConstraint!
    @IBOutlet weak var graphHeight4: NSLayoutConstraint!
    @IBOutlet weak var graphHeight5: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

extension NSLayoutConstraint {
    func changeMultiplier(value : CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(item: self.firstItem,
                                               attribute: self.firstAttribute,
                                               relatedBy: self.relation,
                                               toItem: self.secondItem,
                                               attribute: self.secondAttribute,
                                               multiplier: value,
                                               constant: self.constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
}
