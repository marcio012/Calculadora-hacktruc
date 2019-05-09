//
//  ViewController.swift
//  calculadora_sample
//
//  Created by eldorado on 5/9/19.
//  Copyright © 2019 marcioheleno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numeroTela: Double = 0.0
    var numeroAnterior: Double = 0.0
    var realizaConta: Bool = false
    var operadores = 0
    
    
    @IBOutlet weak var telaDisplay: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numerosButton(_ sender: UIButton) {
        
        if realizaConta == true {
            telaDisplay.text = String(sender.tag-1)
            numeroAnterior = Double(telaDisplay.text!)!
            realizaConta = false
        } else {
            
            telaDisplay.text = telaDisplay.text! + String(sender.tag-1)
            numeroTela = Double(telaDisplay.text!)!
            
        }
        
        
    }
    
    
    @IBAction func operacaoButton(_ sender: UIButton) {
        
        if telaDisplay.text != "" && sender.tag != 11 && sender.tag != 16 {
           
            numeroAnterior = Double(telaDisplay.text!)!
            
            if sender.tag == 12 {
                // op divisao
                telaDisplay.text = "/"
                
            } else if sender.tag == 13 {
                // op multiplicacao
                telaDisplay.text = "X"
                
            } else if sender.tag == 14 {
                // op diminuicao
                telaDisplay.text = "-"
                
            } else if sender.tag == 15 {
                // op soma
                telaDisplay.text = "+"
                
            }
            
            operadores = sender.tag
            realizaConta = true
            
        } else if sender.tag == 16 {
            
            if operadores == 12 {
                telaDisplay.text = String(numeroTela / numeroAnterior)
            
            } else if operadores == 13 {
                telaDisplay.text = String(numeroAnterior * numeroTela)
            
            } else if operadores == 14 {
                telaDisplay.text = String(numeroTela  - numeroAnterior)
            
            } else if operadores == 15 {
                telaDisplay.text = String(numeroAnterior + numeroTela)
            
            }
            
        } else if sender.tag == 11 {
            telaDisplay.text = ""
            numeroAnterior = 0
            numeroTela = 0
            operadores = 0
            
        }
        
    }
    
}

