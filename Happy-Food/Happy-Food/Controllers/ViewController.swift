//
//  ViewController.swift
//  Happy-Food
//
//  Created by Pedro Henrique  on 06/11/19.
//  Copyright © 2019 Pedro Henrique . All rights reserved.
//

import UIKit

protocol AdicionaRefeicaoDelegate { //protocolo de comunicação
     func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource {
    
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [String] = ["Molho de Tomate","Molho Branco","Molho Apimentado","Queijo","Manjericão"]
    
    // MARK: - IBOutlets
    
   @IBOutlet var nomeTextField: UITextField?
   @IBOutlet var felicidadeTextFiel: UITextField?
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)

        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]

        celula.textLabel?.text = item

        return celula
    }
    
    // MARK: - IBActions

   @IBAction func adicionar(){

    
    guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }

        guard let felicidadeDaRefeicao = felicidadeTextFiel?.text, let felicidade = Int (felicidadeDaRefeicao) else {
            return
        }

    let refeicao = Refeicao(nome:nomeDaRefeicao,felicidade: felicidade)
    print("Comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")

    delegate?.add(refeicao)
    
    navigationController?.popViewController(animated: true) //retirar a tela de cima
    
//    if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextFiel?.text{
//
//        let nome = nomeDaRefeicao
//        if let felicidade = Int(felicidadeDaRefeicao){
//            let refeicao = Refeicao(nome:nome,felicidade: felicidade)
//             print("Comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
//        } else {
//            print("Error ao criar refeição")
//            }
//        }
    }
}


