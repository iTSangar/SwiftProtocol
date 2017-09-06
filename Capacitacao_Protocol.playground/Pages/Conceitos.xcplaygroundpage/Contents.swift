/*:
 
 # Conceitos
 
 */
//: > *A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. - Apple®*

//: > *Um protocolo pode ser pensado como um escopo ou interface que define um conjunto de propriedades e métodos - Pesquisa do Google®*

import UIKit

/*:
 ## Sintax de um protocolo
 Protocolos são definidos de maneira similar à classes, struct e enum:
 
 ```
    protocol SomeProtocol {
        // protocol definition goes here
    }
 ```
 
 ## Utilizando um protocolo
 Um protocolo pode ser *adotado* por uma classe, struct ou enum para fornecer uma implementação específica dos seus requisitos. 
 
 Quando uma classe, struct ou enum satisfaz os requisitos de um protocolo dizemos que está em *conformidade* com esse protocolo.

 ```
    struct SomeStructure: FirstProtocol, AnotherProtocol {
        // structure definition goes here
    }
 ```
 
 
 ```
    class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
        // class definition goes here
    }
 ```
 
 */


/*:
 ## Propriedades do protocolo
 Um protocolo pode conter propriedades para que sejam fornecidas pela instância que conforma com o protocolo.
 
 * O protocolo não especifica se a propriedade deve ser computada(computed property) ou armazenada (stored property), mas ela deve especificar o nome e o tipo da propriedade
 * O protocolo especifica se cada propriedade deve ser *gettable* ou *gettable* e *settable*
 * As propriedades sempre são declaradas como variáveis (*var*)
 */

protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var justGettable: Int { get }
}

protocol FullyNamed {
    var fullName: String { get }
}


struct Person: FullyNamed {
    var fullName: String
}

let lattner = Person(fullName: "Chris Lattner")
// lattner.fullName


class Starship: FullyNamed {
    var prefix: String?
    var name: String
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
// ncc1701.fullName


/*:
 ## Métodos do protocolo

 * São escritos da mesma maneira mas sem abrir as chaves e sem corpo do método
 * Permite parâmetros múltiplos, assim como nos métodos normais
 * Não podem conter valores defaults para parâmetros
 */

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
//generator.random()


/*:
 ## Protocolo como tipo
 Os protocolos realmente não implementam nenhuma funcionalidade. Entretanto, qualquer protocolo criado pode se tornar um tipo para ser usado no código
 
 Isso permite usar protocolos em muitos lugares assim comos os tipos:
 * Como tipo de parâmetro ou retorno de uma função e inicializadores
 * Como um tipo de constante e variável
 * Como um tipo de itens de um array e dicionários
 */

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    //print("Random dice roll is \(d6.roll())")
}


/*:
 ****
 [Previous](@previous) | [Next](@next)
 */
