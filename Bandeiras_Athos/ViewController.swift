//
//  ViewController.swift
//  Bandeiras_Athos
//
//  Created by user219712 on 8/5/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Botao1: UIButton!
    @IBOutlet weak var Botao2: UIButton!
    @IBOutlet weak var Botao3: UIButton!
    
    var paises = [String]()
    var pontuacao = 0
    var respostaCorreta = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        Botao1.layer.borderWidth = 1
        Botao2.layer.borderWidth = 1
        Botao3.layer.borderWidth = 1
        
        Botao1.layer.borderColor = UIColor.lightGray.cgColor
        Botao2.layer.borderColor = UIColor.lightGray.cgColor
        Botao3.layer.borderColor = UIColor.lightGray.cgColor
        
        paises += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        fazerPergunta()
    }

        func fazerPergunta(action: UIAlertAction! = nil) {
        paises.shuffle()
        
        Botao1.setImage(UIImage(named: paises[0]), for: .normal)
        Botao2.setImage(UIImage(named: paises[1]), for: .normal)
        Botao3.setImage(UIImage(named: paises[2]), for: .normal)
            
        respostaCorreta = Int.random(in: 0...2)

        title = paises[respostaCorreta].uppercased()
    }

    @IBAction func clicouButao(_ sender: UIButton) {
        
        var titulo: String

        if sender.tag == respostaCorreta {
        titulo = "Acertou"
        pontuacao += 1
        } else {
        titulo = "Errou"
        pontuacao -= 1
        }

        let alerta = UIAlertController(title: titulo, message: "Sua pontuação é \(pontuacao)", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Continuar", style: .default, handler: fazerPergunta))
        present(alerta, animated: true)
    }
}

