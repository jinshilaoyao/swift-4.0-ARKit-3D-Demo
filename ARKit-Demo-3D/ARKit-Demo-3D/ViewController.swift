//
//  ViewController.swift
//  ARKit-Demo-3D
//
//  Created by yesway on 2017/7/7.
//  Copyright © 2017年 yesway. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func clickonTap(_ sender: UIButton) {
        self.navigationController?.pushViewController(ARSCNViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

