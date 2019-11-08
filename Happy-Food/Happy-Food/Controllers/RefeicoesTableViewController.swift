//
//  RefeicoesTableViewController.swift
//  Happy-Food
//
//  Created by Pedro Henrique  on 08/11/19.
//  Copyright © 2019 Pedro Henrique . All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController{
    let refeicoes = [Refeicao(nome: "Macarrao", felicidade: 3),
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
}
