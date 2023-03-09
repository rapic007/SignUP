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
    
    @IBOutlet var emailTF: UITextField!
    
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var forgotButton: UIButton!
    
    @IBOutlet var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainImage.image = UIImage(named: "mainImage")
        mainImage.backgroundColor = .white
        
        
        mainLabel.textColor = UIColor(red: 0.208, green: 0.208, blue: 0.208, alpha: 1)
        mainLabel.font = UIFont(name: "montserrat-regular", size: 28)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1

        mainLabel.textAlignment = .center // Хотел спросить не могу никак его выставить по центру
        mainLabel.attributedText = NSMutableAttributedString(string: "Войти в аккаунт", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        signUpButton.layer.backgroundColor = UIColor(red: 0.82, green: 0.353, blue: 0.133, alpha: 1).cgColor
        signUpButton.layer.cornerRadius = 20
        
    }
    


}
