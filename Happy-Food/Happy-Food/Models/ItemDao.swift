//
//  ItemDao.swift
//  Happy-Food
//
//  Created by Pedro Henrique  on 02/12/19.
//  Copyright © 2019 Pedro Henrique . All rights reserved.
//

import Foundation

class ItemDao {
    func save(_ itens: [Item]){
        do{
           let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
           guard let caminho = reculperaDiretorio() else { return }
           try  dados.write(to: caminho)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> [Item] {
        do{
            guard let diretorio = reculperaDiretorio() else { return [] }
            let dados = try Data(contentsOf: diretorio)
            let intensSalvos =  try
                NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! Array<Item> //convertendo o tipo para array de item
            return intensSalvos
        }catch{
            print(error.localizedDescription)
            return[]
        }
    }
    
    func reculperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil} // retorna a primeira url que ele achar
        let caminho = diretorio.appendingPathComponent("itens") //criando uma pasta para salvar os arquivos
        
        return caminho
    }
}
