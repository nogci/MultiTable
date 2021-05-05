//
//  ViewController.swift
//  MultiTable
//
//  Created by 野口伸吾 on 2021/05/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btn1TouchUp(_ sender: Any) {
        let second = MainViewController()
        present(second, animated: true, completion: nil)
    }
    
}

