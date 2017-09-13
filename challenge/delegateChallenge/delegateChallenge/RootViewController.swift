//
//  RootViewController.swift
//  closureChallenge
//
//  Created by Teobaldo Mauro de Moura on 23/08/17.
//  Copyright © 2017 Teobaldo Mauro de Moura. All rights reserved.
//

import UIKit


// TODO: Conformar com o protocolo contido na NextViewController
class RootViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextSegueID" {
            if let nextVC = segue.destination as? NextViewController {
                // TODO: Preencher a propriedade delegate da NextViewController com a RootViewController (self)

                
            }
        }
    }
}
