//
//  RemoveRefeicaoViewController.swift
//  Happy-Food
//
//  Created by Pedro Henrique  on 28/11/19.
//  Copyright © 2019 Pedro Henrique . All rights reserved.
//

import UIKit

class RemoveRefeicaoViewController{
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao , handler: @escaping (UIAlertAction) -> Void) {
        let alerta = UIAlertController(title: refeicao.nome , message: refeicao.detalhes(), preferredStyle: .alert)
                   
                   let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                   alerta.addAction(botaoCancelar)
           
                   let botaoRemover = UIAlertAction(title: "Remover", style: .destructive,
                       handler: handler)
                   alerta.addAction(botaoRemover)
                   controller.present(alerta, animated: true, completion: nil)
    }
}
