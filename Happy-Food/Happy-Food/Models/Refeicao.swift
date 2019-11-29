//
//  Refeicao.swift
//  Happy-Food
//
//  Created by Pedro Henrique  on 08/11/19.
//  Copyright © 2019 Pedro Henrique . All rights reserved.
//

import UIKit

class Refeicao: NSObject, NSCoding {
   
    
       let nome:String
       let felicidade: Int
       var itens: Array<Item> = []
       
       //MARK - Construtor
    init(nome:String, felicidade: Int, itens: [Item] = []){ //item ja inicializado 
           self.nome = nome
           self.felicidade = felicidade
           self.itens = itens
       }
    
    //MARK - NSCODING
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
       }
       
       required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        felicidade = aDecoder.decodeInteger(forKey: "felicidade") 
        itens = aDecoder.decodeObject(forKey: "itens") as! Array<Item>
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
