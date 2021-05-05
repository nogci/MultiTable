//
//  StaTableViewCell.swift
//  MultiTable
//
//  Created by 野口伸吾 on 2021/05/03.
//

import UIKit

class StaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var prefecture: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setCell(station: Station) {
        self.name.text = station.name as String
        self.prefecture.text = station.prefecture as String
        
        //4.折り返しの設定
        self.prefecture.translatesAutoresizingMaskIntoConstraints = true //オートレイアウトを無効化しておかないとうまくフィットしない
        //prefecture.text = "これは折り返しラベルの設定です。複数行になった場合の表示が確認できます。"
        self.prefecture.numberOfLines = 0
        self.prefecture.lineBreakMode = NSLineBreakMode.byCharWrapping
        self.prefecture.sizeToFit()
        //self.prefecture.backgroundColor = UIColor.lightGray
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
