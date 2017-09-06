/*:
 
 # POP
 
 */

//: > *Protocol-Oriented Programming in Swift - Session 408 by Dave Abrahams in WWDC 2015. - Apple®*

//: > *Lembram da palavra "modelo" (blueprint). Um protocolo é como um treinador de basquete. Ele diz a seus jogadores o que fazer, mas ele não sabe como fazer uma enterrada. - Bob*

import UIKit

/*:
 ## OOP x POP
 
 Ainda há benefícios em utilizar OOP, mas vejamos o oposto:
 * Quando criamos uma subclasse, herdamos propriedades e métodos que talvez não precisamos tornando nosso objeto desnecessariamente inchado.
 * Ao utilizar um monte de super-classes, o código torna-se difícil para navegar entre cada classe e corrigir erros ou editar.
 * Como utiliza referência de memória, se fizermos uma cópia e alteramos a propriedade essa nova cópia será alterada. (Multabilidade devido à referência)
 * Porém a Apple ainda utiliza (UIKit framework)
 
 ![uikit](2015_wwdc_object.png)
 
 */


/*:
 ## Um exemplo nunca visto: **Classe Animal**
 Imagine o seguinte cenário abaixo de uma aplicação já existente e que as classes principais podem ser vistas no seguinte diagrama:
 
 ![animal-class](animal-base.jpeg)
 
 Agora, suponha que temos a tarefa de atualizar nosso aplicativo para incorporar novos requisitos de negócios.
 
 Queremos introduzir uma categorização adicional de nossos animais, com base em como se movem em seu ambiente: correr, nadar ou voar utilizando herança clássica.
 
 ![animal-new](animal-new-func.jpeg)
 
 */

//: - Todos os animais se encaixam na nova classificação?
//: - Alguns deles pertecem a mais de uma classificação?
//: - Todos os passáros podem voar?
//: - Duplicar o código em cada subclasse?
//: - ???
class Animal {
    // Essas propriedades não podem ser facilmente colocadas em uma das subclasses. Por isso foram subindo na hierarquia gerando o risco de serem usadas na subclasse errada!!
    var groundSpeed = 0.0
    var airSpeed = 0.0
    var waterSpeed = 0.0
    
    func run() -> String? {
        return nil
    }
    
    func swim() -> String? {
        return nil
    }
    
    func fly() -> String? {
        return nil
    }
}


/*:
 ## Uma melhor abordagem para modelagem: Composição > Herança 
 ## POP 😎
 *"Pense primeiro na interface, depois na implementação" - Design Patterns — GoF*
 */

protocol Flyable {
    var airSpeed: Double { get }
    func fly() -> String
}

protocol Runnable {
    var groundSpeed: Double { get }
    func run() -> String
}

protocol Swimmable {
    var waterSpeed: Double { get }
    func swim() -> String
}

extension Flyable {
    func fly() -> String {
        return "Flying at \(airSpeed) km/h"
    }
}

extension Runnable {
    func run() -> String {
        return "Running at \(groundSpeed) km/h"
    }
}

extension Swimmable {
    func swim() -> String {
        return "Swimming at \(waterSpeed) km/h"
    }
}

protocol Bird {
    var className: String { get }
}

protocol Fish {
    var className: String { get }
}

protocol Mammal {
    var className: String { get }
}


struct Tiger: Mammal, Runnable {
    var className = "Tiger 🐯"
    var groundSpeed = 50.0
}

struct Dolphin: Mammal, Swimmable {
    var className = "Dolphin 🐬"
    var waterSpeed = 40.0
}

struct Elephant: Mammal, Runnable, Swimmable {
    var className = "Elephant 🐘"
    var groundSpeed = 20.0
    var waterSpeed = 12.0
}

struct Hawk: Bird, Flyable {
    var className = "Hawk 🦅"
    var airSpeed = 25.0
}

struct Penguin: Bird, Runnable, Swimmable {
    var className = "Penguin 🐧"
    var groundSpeed = 2.0
    var waterSpeed = 25.0
}

struct Shark: Fish, Swimmable {
    var className = "Shark 🦈"
    var waterSpeed = 30.0
}


var runnables = [Runnable]()
runnables.append(Tiger())
runnables.append(Elephant())
runnables.append(Penguin())

var flyables = [Flyable]()
flyables.append(Hawk())

var swimmables = [Swimmable]()
swimmables.append(Dolphin())
swimmables.append(Elephant())
swimmables.append(Penguin())
swimmables.append(Shark())


func getClassName(for animal: Any) -> String {
    let mirror = Mirror(reflecting: animal)
    let chunks = mirror.description.characters.split(separator: " ").map { String($0) }
    return chunks.last!
}


for animal in runnables {
    //print("\(getClassName(for: animal)): \(animal.run())")
}

for animal in flyables {
    //print("\(getClassName(for: animal)): \(animal.fly())")
}

for animal in swimmables {
   // print("\(getClassName(for: animal)): \(animal.swim())")
}

/*:
 ****
 [Previous](@previous) | [Next](@next)
 */

