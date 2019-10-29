//
//  ViewController.swift
//  Omlet Login
//
//  Created by Omlet Arcade on 10/16/19.
//  Copyright © 2019 Omlet Arcade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        button.backgroundColor = .darkGray
        button.setTitle("Get Omlet User Token", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let webLoginViewController = WebLoginViewController()
        self.navigationController?.pushViewController(webLoginViewController, animated: true)
    }


}

