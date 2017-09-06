//
//  ViewController.swift
//  protocolChallenge
//
//  Created by iTSangar on 06/09/17.
//  Copyright © 2017 iTSangar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passcodTextField: UITextField!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var codeImageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCornerRadius()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didTapAnswerButton(_ sender: UIButton) {
        
        // pop animation
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: { self.errorMessageLabel.alpha = 1.0 }) { (animationCompleted) in
                        if animationCompleted == true {
                            UIView.animate(withDuration: 0.3,
                                           delay: 2.0,
                                           options: .curveEaseOut,
                                           animations: { self.errorMessageLabel.alpha = 0.0 },
                                           completion: nil)
                        }
        }

        // buzz animation
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.passcodTextField.center.x - 5.0, y: self.passcodTextField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.passcodTextField.center.x + 5.0, y: self.passcodTextField.center.y))
        passcodTextField.layer.add(animation, forKey: "position")

    }
    
    func setUpCornerRadius() {
        let imageHeight = codeImageView.frame.height/2
        codeImageView.layer.cornerRadius = imageHeight
        codeImageView.layer.masksToBounds = true
        
    }
}

