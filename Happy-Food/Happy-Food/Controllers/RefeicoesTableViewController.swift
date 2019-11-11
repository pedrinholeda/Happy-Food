//
//  RefeicoesTableViewController.swift
//  Happy-Food
//
//  Created by Pedro Henrique  on 08/11/19.
//  Copyright © 2019 Pedro Henrique . All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController{
    var refeicoes = [Refeicao(nome: "Macarrao", felicidade: 3),
                     Refeicao(nome: "Pizza", felicidade: 5),
                     Refeicao(nome: "Churros", felicidade: 4)]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }
    
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData() // recarregando informaçoes da table apos add
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController{
            viewController.tableViewController = self // falando que a variavel e a instancia
        }
    }
    
}
