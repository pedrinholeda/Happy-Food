//
//  Item.swift
//  Happy-Food
//
//  Created by Pedro Henrique  on 08/11/19.
//  Copyright © 2019 Pedro Henrique . All rights reserved.
//

import UIKit

class Item: NSObject {
    let nome: String
    let calorias: Double

    init(nome: String, calorias: Double){
    self.nome = nome
    self.calorias = calorias
    }
}
