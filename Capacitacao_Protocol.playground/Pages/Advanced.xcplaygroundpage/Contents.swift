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


var str = "Hello, POP > OOP"
