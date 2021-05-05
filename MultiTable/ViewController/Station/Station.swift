//
//  Station.swift
//  MultiTable
//
//  Created by 野口伸吾 on 2021/05/03.
//

import Foundation

class Station : NSObject {
    var name: String
    var prefecture: String
    
    init(name: String, prefecture: String){
        self.name = name as String
        self.prefecture = prefecture as String
    }
}
