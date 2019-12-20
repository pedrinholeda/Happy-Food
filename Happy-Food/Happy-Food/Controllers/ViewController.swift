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

    var itens: [Item] = []
    
    
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlets
    
   @IBOutlet var nomeTextField: UITextField?
   @IBOutlet var felicidadeTextFiel: UITextField?
   
    // MARK: - View life cycle
    
    override func viewDidLoad(){
        let botaoAdicionarItem = UIBarButtonItem(title: "Novo Item", style: .plain, target: self, action: #selector((adicionarItens)))
        navigationItem.rightBarButtonItem = botaoAdicionarItem
        recuperaItens()
        
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard)))
    }
    
    func recuperaItens(){
        itens = ItemDao().recupera()
    }
    
    @objc func adicionarItens(){
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        ItemDao().save(itens)
        if let tableView = itensTableView{ //tratamento de erro
            tableView.reloadData()
        }else{
            Alerta(controller: self).exibe(titulo: "Desculpe", mensagem: "Não foi possivel atualizar a tabela")
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
    
    func reculperaRefeicaoDoFormulario() -> Refeicao? {
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return nil
               }

        guard let felicidadeDaRefeicao = felicidadeTextFiel?.text, let felicidade = Int (felicidadeDaRefeicao) else {
               return nil
               }

        let refeicao = Refeicao(nome:nomeDaRefeicao,felicidade: felicidade, itens: itensSelecionados)
        
        return refeicao
    }

    @IBAction func adicionar(){
     if let refeicao = reculperaRefeicaoDoFormulario() {
      delegate?.add(refeicao)
      navigationController?.popViewController(animated: true) //retirar a tela de cima
    } else {
        Alerta(controller: self).exibe(mensagem: "Não foi possivel adicionar esta refeição")
        }
    }
    
    
    // Retirar teclaco com o toque fora

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
}


