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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
 
    //MARK: - IBOutlet
    
    
    @IBOutlet weak var itensTableView: UITableView?
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?

    var itens: [Item] = [Item(nome: "Molho de Tomate", calorias: 40.0),
                            Item(nome: "Molho Branco", calorias: 40.0),
                            Item(nome: "Molho Apimentado", calorias: 40.0),
                            Item(nome: "Queijo", calorias: 40.0),
                            Item(nome: "Manjericão", calorias: 40.0)]
    
    
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlets
    
   @IBOutlet var nomeTextField: UITextField?
   @IBOutlet var felicidadeTextFiel: UITextField?
   
    // MARK: - View life cycle
    
    override func viewDidLoad(){
        let botaoAdicionarItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector((adicionarItens)))
        navigationItem.rightBarButtonItem = botaoAdicionarItem
    }
    @objc func adicionarItens(){
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        if let tableView = itensTableView{ //tratamento de erro
            tableView.reloadData()
        }else{
            let alerta = UIAlertController(title: "Desculpe", message: "Não foi possivel atualizar a tabela", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alerta.addAction(ok)
           
            present(alerta, animated: true, completion: nil )
        }
     }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)

        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]

        celula.textLabel?.text = item.nome
        return celula
    }
    
    // MARK: - UITableViewDelegate
    //identifica o clique do usuario
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else {return}
        //colocando check na opcão escolhida
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark

            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        }else{
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item){
                itensSelecionados.remove(at: position)
//                //teste
//                for itemSelecionado in itensSelecionados{
//                    print(itemSelecionado.nome)
//                }
            }
            
        }
    }
    
    
    // MARK: - IBActions

   @IBAction func adicionar(){

    
    guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }

        guard let felicidadeDaRefeicao = felicidadeTextFiel?.text, let felicidade = Int (felicidadeDaRefeicao) else {
            return
        }

    let refeicao = Refeicao(nome:nomeDaRefeicao,felicidade: felicidade, itens: itensSelecionados)
    
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


