/*:
 
 # Extras
 
 */

import UIKit

//: • Inicializadores:

protocol SomeProtocol {
    init(someParameter: Int)
}

class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}

// O uso do required garante que você forneça uma implementação explícita em todas as subclasses da classe em conformidade com o protocolo. 

//: • Composição do protocolo

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    //print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = Person(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

// Não define um novo tipo de protocolo (exemplo typealias)

/*:
 ****
 [Previous](@previous) | [Next](@next)
 */
