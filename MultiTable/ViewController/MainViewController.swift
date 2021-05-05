//
//  MainViewController.swift
//  MultiTable
//
//  Created by 野口伸吾 on 2021/05/03.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupChildren()
    }
    
    private func setupChildren() {
        // CollectionViewController
//        let collectionViewController = CollectionViewController()
//        addChild(collectionViewController)
//        stackView.addArrangedSubview(collectionViewController.view)
//        collectionViewController.didMove(toParent: self)

        // TableViewController
//        let tableViewController = TableViewController()
//        addChild(tableViewController)
//        stackView.addArrangedSubview(tableViewController.view)
//        tableViewController.didMove(toParent: self)
        
        //StationViewController
        let tableViewController = StationViewController()
        addChild(tableViewController)
        stackView.addArrangedSubview(tableViewController.view)
        tableViewController.didMove(toParent: self)
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
