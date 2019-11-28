//
//  RefeicoesTableViewController.swift
//  Happy-Food
//
//  Created by Pedro Henrique  on 08/11/19.
//  Copyright © 2019 Pedro Henrique . All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController , AdicionaRefeicaoDelegate{
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
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData() // recarregando informaçoes da table apos add
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began { // longo toque (so inicio)
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            let alerta = UIAlertController(title: refeicao.nome , message: refeicao.detalhes(), preferredStyle: .alert)
            
            let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            alerta.addAction(botaoCancelar)
    
            let botaoRemover = UIAlertAction(title: "Remover", style: .destructive,
                handler:{ alerta in //closure
                    self.refeicoes.remove(at: indexPath.row)
                    self.tableView.reloadData()
            })
            alerta.addAction(botaoRemover)
            present(alerta, animated: true, completion: nil)
        }
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController{
            viewController.delegate = self // falando que a variavel e a instancia
        }
    }
    
}
