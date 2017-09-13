//: [Previous](@previous)

import Foundation


// TODO: Criar um protocolo que garante a existência de uma variável de idade

protocol Ageable {
    var age: Int { get set }
}

// TODO: Criar uma extension que adiciona dois métodos no Array:
//  - Método 1: A entrada é uma idade e o retorno é true se existir no array um objeto com iddade maior ou igual
//  - Método 2: A entrada é um objeto com idade e o retorno é true se existeir no array um objeto com iddade maior ou igual

extension Array where Element : Ageable {
    
    func anyIsOlderThan(_ oldAge: Int) -> Bool {
        let elements =  self.filter( { $0.age >= oldAge } ).count > 0
        return elements
    }
    
    func anyIsOlderThan(element oldElement: Element) -> Bool {
        let elements = self.filter({ $0.age >= oldElement.age }).count > 0
        return elements
    }
    
}

// TODO: Criar um objeto que assine o protocolo criado

class Person: Ageable {
    var age: Int
    init(age: Int) {
        self.age = age
    }
}

// TODO: Criar um array com instâncias do objeto criado e testar os métodos da extension

var people: [Person] = []
people.append(Person(age: 10))
people.append(Person(age: 1))
people.append(Person(age: 2))
people.append(Person(age: 3))

people.anyIsOlderThan(10)
people.anyIsOlderThan(5)
people.anyIsOlderThan(15)

people.anyIsOlderThan(element: Person(age: 25))
people.anyIsOlderThan(element: Person(age: 2))

//: [Next](@next)
