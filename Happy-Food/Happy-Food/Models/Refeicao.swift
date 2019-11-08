//
//  Refeicao.swift
//  Happy-Food
//
//  Created by Pedro Henrique  on 08/11/19.
//  Copyright © 2019 Pedro Henrique . All rights reserved.
//

import UIKit

class Refeicao: NSObject {
       let nome:String
       let felicidade: Int
       let itens: Array<Item> = []
       
       //MARK - Construtor
       init(nome:String, felicidade: Int) {
           self.nome = nome
           self.felicidade = felicidade
       }
       //MARK - Metodos
       func totalDeCalorias() -> Double{
           var total = 0.0
           for item in itens {
               total += item.calorias
           }
           return total
       }

}
