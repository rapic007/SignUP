//
//  MainScreen.swift
//  SignUp
//
//  Created by Влад  on 9.03.23.
//

import UIKit

class MainScreen: UIViewController {
    
    @IBOutlet var mainImage: UIImageView!
    
    @IBOutlet var mainLabel: UILabel!

    @IBOutlet var emailTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        mainImage.image = UIImage(named: "mainImage")

        mainLabel.textColor = UIColor(red: 0.208, green: 0.208, blue: 0.208, alpha: 1)
        mainLabel.font = UIFont(name: "montserrat-regular", size: 28)
        mainLabel.textAlignment = .center
        mainLabel.text = "Войти в аккаунт"
        
         let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        button.setTitle("buton", for: .normal)
        button.backgroundColor = .red
        
        emailTextField.rightView = button
        emailTextField.rightViewMode = .always
        
        
    }
}
