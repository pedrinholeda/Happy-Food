//
//  RefeicaoDao.swift
//  Happy-Food
//
//  Created by Pedro Henrique  on 29/11/19.
//  Copyright © 2019 Pedro Henrique . All rights reserved.
//

import Foundation

class RefeicaoDao{
    func save(_ refeicoes: [Refeicao]){
               //salvando arquivos em um diretorio
        guard let caminho = recuperaCaminho() else { return }
        
         do{
             let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false) // converter em dados
             try dados.write(to: caminho) // salvando dados na url
             
         }catch{
             print(error.localizedDescription)
         }
    }
    
    func recupera() -> [Refeicao] {
        guard let caminho = recuperaCaminho() else { return []}
        do{
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try
                NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as?
                    Array<Refeicao> else { return [] }
            return refeicoesSalvas
        }catch{
            print(error.localizedDescription)
            return[]
        }
    }
    
    func recuperaCaminho() -> URL? {
           guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil} // retorna a primeira url que ele achar
           let caminho = diretorio.appendingPathComponent("refeicao") //criando uma pasta para salvar os arquivos
           return caminho
       }
}
