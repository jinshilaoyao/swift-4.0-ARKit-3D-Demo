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
        
        button = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 44))
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        view.addSubview(button)
    }
    @IBAction func clickonTap(_ sender: UIButton) {
        self.navigationController?.pushViewController(ARSCNViewController(), animated: true)
    }
    
    @objc func nextPage() {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

