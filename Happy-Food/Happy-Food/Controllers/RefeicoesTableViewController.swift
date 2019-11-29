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
    //exibindo arquivos salvos na tela
    override func viewDidLoad() {
         guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return} // retorna a primeira url que ele achar
         let caminho = diretorio.appendingPathComponent("refeicao") //criando uma pasta para salvar os arquivos
        do{
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try
                NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as?
                    Array<Refeicao> else {return}
            refeicoes = refeicoesSalvas
        }catch{
            print(error.localizedDescription)
        }
       
    }
    
    
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
       //salvando arquivos em um diretorio
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return} // retorna a primeira url que ele achar
        let caminho = diretorio.appendingPathComponent("refeicao") //criando uma pasta para salvar os arquivos
       
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false) // converter em dados
            try dados.write(to: caminho) // salvando dados na url
            
        }catch{
            print(error.localizedDescription)
        }
        }
       
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began { // longo toque (so inicio)
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(controller: self).exibe(refeicao, handler:
                { alert in
                    self.refeicoes.remove(at: indexPath.row)
                    self.tableView.reloadData()
                
            })
           
        }
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController{
            viewController.delegate = self // falando que a variavel e a instancia
        }
    }
    
}
