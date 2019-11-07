//
//  ViewController.swift
//  Happy-Food
//
//  Created by Pedro Henrique  on 06/11/19.
//  Copyright © 2019 Pedro Henrique . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   @IBOutlet var nomeTextField: UITextField! //force run app
    @IBOutlet var felicidadeTextFiel: UITextField!

   @IBAction func adicionar(){
    let nome = nomeTextField.text // para pegar somente o texto
    let felicidade = felicidadeTextFiel.text
        print("Comi \(nome) e fiquei com felicidade: \(felicidade)")
    }

}

