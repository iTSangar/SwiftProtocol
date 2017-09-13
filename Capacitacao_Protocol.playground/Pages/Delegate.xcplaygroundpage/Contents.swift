/*:
 # Delegate
 
 Pattern muito utilizado na biblioteca Cocoa da Apple (TableView, CollectionView, ..)
 */

import UIKit


/*:
 ## Protocolo
 */

protocol FirstVCDelegate {
    func passData(data: String)
}

/*:
 ## Propriedade
 */

class FirstVC {
    var delegate: FirstVCDelegate?
}

/*:
 ## Conformidade com o Protocolo
 */

class SecondVC: FirstVCDelegate {
    func passData(data: String) {
        print("Something happened \(data)")
    }
}

/*:
 ## Criação do objetos
 */

let firstVC = FirstVC()
let secondVC = SecondVC()

/*:
 ## Atribuição do Delegate
 */

firstVC.delegate = secondVC  // secondVC = delegate

/*:
 ## Execução da função no Delegate
 */

firstVC.delegate?.passData(data: "a bunch of contracts")
// "Something happened"

/*:
 ****
 [Previous](@previous) | [Next](@next)
 */
