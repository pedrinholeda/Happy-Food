//
//  Item.swift
//  Happy-Food
//
//  Created by Pedro Henrique  on 08/11/19.
//  Copyright © 2019 Pedro Henrique . All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
 
    let nome: String
    let calorias: Double

    //MARK: - INIT
    init(nome: String, calorias: Double){
       self.nome = nome
       self.calorias = calorias
       }
    
    //MARK: - NSCODING
    func encode(with coder: NSCoder) {
         coder.encode(nome, forKey: "nome")
         coder.encode(calorias, forKey: "calorias")
        
     }
     
     required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        calorias = aDecoder.decodeDouble(forKey: "calorias")
     }
     
    
   
}
