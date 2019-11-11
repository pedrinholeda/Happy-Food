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

class ViewController: UIViewController {
    
    var delegate: AdicionaRefeicaoDelegate?
    
   @IBOutlet var nomeTextField: UITextField?
   @IBOutlet var felicidadeTextFiel: UITextField?

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


