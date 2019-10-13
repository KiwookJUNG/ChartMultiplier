//
//  ViewController.swift
//  ChartMultiplier
//
//  Created by 정기욱 on 2019/10/13.
//  Copyright © 2019 kiwook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var graphHeight1: NSLayoutConstraint!
    @IBOutlet weak var graphHeight2: NSLayoutConstraint!
    @IBOutlet weak var graphHeight3: NSLayoutConstraint!
    @IBOutlet weak var graphHeight4: NSLayoutConstraint!
    @IBOutlet weak var graphHeight5: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        graphHeight1 = graphHeight1.changeMultiplier(value: 0.9)
        graphHeight2 = graphHeight2.changeMultiplier(value: 0.8)
        graphHeight3 = graphHeight3.changeMultiplier(value: 0.7)
        graphHeight4 = graphHeight4.changeMultiplier(value: 0.6)
        graphHeight5 = graphHeight5.changeMultiplier(value: 0.5)
        
        
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
