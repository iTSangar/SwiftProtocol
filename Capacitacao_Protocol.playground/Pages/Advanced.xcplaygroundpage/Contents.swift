/*:
 ****
 
 # SWIFT ADVANCED PROTOCOL ⭐️⭐️⭐️⭐️
 
 ****

 */

//: > *A Programação Orientada a Protocolo é certamente impressionante, e você pode fazer coisas incríveis com ele. - Hesham Salman*


import UIKit


/*:

 ## Animalia:
 
 Vamos escrever um sistema de catalogação de animais para um zoológico, gostaríamos de abordá-lo
 pensando nas propriedades genéricas e nos comportamentos de animais.
 
 Em vez de começar com uma classe base e começar uma cadeia de herança, começamos com um protocolo.
 
 */

protocol Animal {
    var numberOfLimbs: Int { get }
    var isVertebrate: Bool { get }
    var canSwim: Bool { get }
    var canBreatheUnderwater: Bool { get }
    var canFly: Bool { get }
}

extension Animal {
    var canSwim: Bool { return self is Swimmable }
    var isVertebrate: Bool { return self is Vertebrate }
    var canBreatheUnderwater: Bool { return self is WaterBreathable }
    var canFly: Bool { return self is Flyable }
}

protocol Vertebrate { }
protocol Invertebrate { }
protocol Flyable { }
protocol Swimmable { }
protocol WaterBreathable: Swimmable { }


/*:
 
 Como os tipos de protocolo são cidadãos de primeira (First-class Citizen) classe em Swift, podemos nos
 referir a Animal como se fosse uma classe base. Observe que o protocolo WaterBreathable implica em
 Swimmable, ou seja, podemos usar protolocos em cadeia.
 
 Neste ponto, podemos avançar e começar a definir muitos animais. Mas, antes de começar a produzir
 nossas estruturas, vamos definir alguns tipos gerais de animais, como aves e mamíferos.
 
 */

// Reptil 🐍 🦎
protocol Reptile: Vertebrate { }
protocol Slitherable { }

extension Reptile where Self: Animal {
    var numberOfLimbs: Int { return self is Slitherable ? 2 : 4 }
}

// Mamiferos 🐼 🐨
protocol Mammal: Vertebrate {
    var hasPouch: Bool { get }
}
protocol Marsupial: Mammal { }

extension Mammal {
    var numberOfLimbs: Int {
        return 4
    }
    var hasPouch: Bool {
        return self is Marsupial
    }
}

// Aves 🦉
protocol Bird: Vertebrate { }

extension Bird where Self: Animal {
    var canFly: Bool {
        return self is Flyable
    }
    
    var numberOfLimbs: Int {
        return 4
    }
}

// Peixes 🐡
protocol Fish: Vertebrate, WaterBreathable { }

extension Fish where Self: Animal {
    var numberOfLimbs: Int {
        return 0
    }
}

/*:
 
 E esses `extension` e `where` e `Self` ?? 😱
 
 Em vez de forçar todos esses tipos a se adaptarem aos animais, estamos apenas implementando esses
 comportamentos padrão para essas classes, caso sejam também animais. Usando esse padrão, podemos
 continuar definindo comportamentos padrão para Animal. Isso também significa que nossas extensões
 impõem um requisito de Self, mesmo que nosso protocolo não.
 
 */


/*:
 
 ## Definindo os animais:
 
 Usando nossa nova biblioteca de protocolos, podemos começar a definir nossos tipos de animais.
 
 */

struct Lion: Animal, Mammal, Swimmable { }

struct Cow: Animal, Mammal { }


/*:
 
 ## 🤔💭
 
 Usando nossa nova biblioteca de protocolos, podemos começar a definir nossos tipos de animais.
 Wow! Não precisamos preencher um corpo para estas estruturas porque seus comportamentos já são
 implementados por seus protocolos de suporte.

 */

/*:
 
 ## Associated Types
 
 Então, depois de levar isso tudo para produção, começamos a notar que nossas 🐮 e 🦁 estão
 ☠️ porque não catalogamos seus requisitos alimentares.
 
 Vamos corrigir isso agora.
 
 */

protocol Food { }
struct Grass: Food { }
struct Meat: Food { }


//protocol Animal {
//    func eat(food: Food)
//    var numberOfLimbs: Int { get }
//    var isVertebrate: Bool { get }
//    var canSwim: Bool { get }
//    var canBreatheUnderwater: Bool { get }
//    var canFly: Bool { get }
//}

/*:
 
 Nós definimos um protocolo, Alimentos e seus tipos: Carne e Grama. Nós também
 atualizamos nosso objeto animal para comer um tipo de alimento. Mas, com esta implementação, percebemos
 um problema: as vacas não comem alimentos; eles comem Grama. Da mesma forma, os leões não comem
 alimentos genéricos, eles comem Carne.
 
 */

// OOP:

//struct Cow: Animal, Mammal {
//    func eat(food: Food) {
//        if food is Grass {
//            // implementation
//        } else {
//            // throw error or crash
//        }
//    }
//}


/*:
 
 Isso parece inadequado, não só porque não representa a relação entre animais e alimentos, mas também
 porque esperamos que os usuários dessas classes conheçam os alimentos apropriados para cada animal.
 
 O Swift permite uma abordagem alternativa, envolvendo a palavra-chave `associatedtype`. Um tipo
 associado é um tipo de placeholder dentro de um protocolo. A implementação de tipos associados
 permite que você use um tipo "genérico" em seu protocolo.
 
 > Momento: "Não existe almoço grátis" 👉🏽
        Ao usar um protocolo com um tipo associado, você perderá a capacidade de usar esse protocolo
        como um tipo.
 
 */

//protocol Animal {
//    associatedtype FoodType
//    func eat(food: FoodType)
//    var numberOfLimbs: Int { get }
//    var isVertebrate: Bool { get }
//    var canSwim: Bool { get }
//    var canBreatheUnderwater: Bool { get }
//    var canFly: Bool { get }
//}

/*:
 
 
 */

