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
       var itens: Array<Item> = []
       
       //MARK - Construtor
    init(nome:String, felicidade: Int, itens: [Item] = []){ //item ja inicializado 
           self.nome = nome
           self.felicidade = felicidade
           self.itens = itens
       }
       //MARK - Metodos
       func totalDeCalorias() -> Double{
           var total = 0.0
           for item in itens {
               total += item.calorias
           }
           return total
       }
    
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade)"
        
        for item in itens {
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        
        return mensagem
    }

}
