//
//  ViewController.swift
//  closureChallenge
//
//  Created by Teobaldo Mauro de Moura on 23/08/17.
//  Copyright © 2017 Teobaldo Mauro de Moura. All rights reserved.
//

import UIKit

// TODO: Criar o protocolo na NextViewController com uma função

class NextViewController: UIViewController {
    
    // TODO: Criar um propriedade optional delegate na NextViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doSomethingTapped(_ sender: UIButton) {
        print("Do something button tapped on Next view controller")
        // TODO: Executar o delegate no clique do botão
    }

}

