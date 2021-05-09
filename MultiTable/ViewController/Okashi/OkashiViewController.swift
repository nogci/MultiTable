//
//  OkashiViewController.swift
//  MultiTable
//
//  Created by 野口伸吾 on 2021/05/09.
//

import UIKit

class OkashiViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {

    @IBOutlet weak var searchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // お菓子リスト（タプル配列）
    var okashiList : [(name: String, maker: String, link: URL, image: URL)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // searchbarのDelegate通知先を設定
        searchText.delegate = self
        // 入力のプレースホルダーを設定
        searchText.placeholder = "お菓子の名前を入力してください"
    
        // TableViewのデータソースを設定
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "okashiCell")
    }
    
    //Cellの総数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return okashiList.count
    }
    
    // Cellに値を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //今回表示を行うCellオブジェクト(1行)を取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "okashiCell", for: indexPath)
        //お菓子のタイトル設定
        cell.textLabel?.text = okashiList[indexPath.row].name
        //お菓子画像を取得
        if let imageData = try? Data(contentsOf: okashiList[indexPath.row].image) {
            //正常取得時。UIImageで画像オブジェクトを生成して、Cellにお菓子画像を設定
            cell.imageView?.image = UIImage(data: imageData)
        }
        //設定済みCellを画面に反映
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //keyboardを閉じる
        view.endEditing(true)
        
        if let searchword = searchBar.text {
            //debug出力
            print(searchword)
            //お菓子検索
            searchOkashi(keyword: searchword)
        }
    }
    
    //okashi検索
    func searchOkashi(keyword: String) {
        // 検索KeywordをURLEncoding
        guard let keyword_encord = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        //request url生成
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encord)&max=10&order=r") else {
            return
        }
        print(req_url)
        
        //request
        let req = URLRequest(url: req_url)
        //リクエストセッション
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        //リクエストをタスクとして登録
        let task = session.dataTask(with: req, completionHandler: {
            (data, response, error) in
            //セッション終了
            session.finishTasksAndInvalidate()
            //エラーハンドリング
            do {
                //jsondecoderインスタンス
                let decoder = JSONDecoder()
                //responseJsonをParseして格納
                let json = try decoder.decode(ResultJson.self, from: data!)
                //print(json)
                
                //取得確認
                if let items = json.item {
                    //リスト初期化
                    self.okashiList.removeAll()
                    for item in items {
                        // お菓子名称、メーカー、URL,画像URLをアンラップ(値があるか確認）
                        if let name = item.name, let maker = item.maker, let url = item.url, let image = item.image {
                            let okashi = (name, maker, url, image)
                            self.okashiList.append(okashi)
                        }
                    }
                    // TableViewを更新する
                    self.tableView.reloadData()
                    
                    //debug
                    if let okashidbg = self.okashiList.first {
                        print("--------------------")
                        print("okashiList[0] = \(okashidbg)")
                    }
                }
                
            } catch {
                //エラー処理
                print("エラーが発生しました")
            }
        })
        // ダウンロード開始
        task.resume()
        
    }

    //jsonのitem内のデータ構造
    struct ItemJson: Codable {
        let name: String?
        let maker: String?
        let url: URL?
        let image: URL?
    }
    
    struct ResultJson: Codable {
        let item: [ItemJson]?
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
