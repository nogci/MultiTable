//
//  StationViewController.swift
//  MultiTable
//
//  Created by 野口伸吾 on 2021/05/03.
//

import UIKit

class StationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var stationTableView: UITableView!
    var stations:[Station] = [Station]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stationTableView.dataSource = self
        stationTableView.delegate = self
        stationTableView.register(UINib(nibName: "StaTableViewCell", bundle: nil), forCellReuseIdentifier: "StaTableViewCell")
        self.setupStations()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }

    func setupStations() {
      stations = [Station(name: "飯田橋", prefecture: "東京都新宿区"),
                  Station(name: "九段下1", prefecture: "東京都千代田区東京都千代田区東京都千代田区、東京都千代田区東京都千代田区。東京都千代田区東京都千代田区。"),
                  Station(name: "九段下2", prefecture: "東京都千代田区"),
                  Station(name: "九段下3", prefecture: "東京都千代田区"),
                  Station(name: "九段下4", prefecture: "東京都千代田区"),
                  Station(name: "九段下5", prefecture: "東京都千代田区"),
                  Station(name: "九段下6", prefecture: "東京都千代田区"),
                  Station(name: "九段下7", prefecture: "東京都千代田区"),
                  Station(name: "九段下8", prefecture: "東京都千代田区"),
                  Station(name: "九段下9", prefecture: "東京都千代田区"),
                  Station(name: "御茶ノ水", prefecture: "東京都文京区") ];
    }

    // セクションの数を明示する
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return 1
    }

    // セクションごとに何個のcellを表示するのか
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stations.count
    }
    
    // cellに何を表示するのか
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StaTableViewCell", for: indexPath ) as! StaTableViewCell
        
        cell.setCell(station: stations[indexPath.row])
        
        return cell
    }
    
    /*
     セルの高さを設定
     */
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        tableView.estimatedRowHeight = 20 //セルの高さ
//        return UITableView.automaticDimension //自動設定
//     }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        tableViewHeight.constant = CGFloat(stationTableView.contentSize.height)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
