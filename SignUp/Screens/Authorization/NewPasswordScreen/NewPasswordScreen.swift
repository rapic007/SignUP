//
//  NewPasswordScreen.swift
//  SignUp
//
//  Created by Влад  on 16.03.23.
//

import UIKit

class NewPasswordScreen: UIViewController {

    @IBOutlet var mainImage: UIImageView!
    
    @IBOutlet var mainLabel: UILabel!
    
    @IBOutlet var informationLabel: UILabel!
    
    @IBOutlet var PasswordTF: CustomTextField!
    
    @IBOutlet var repeatPasswordTF: CustomTextField!
    
    @IBOutlet var aboutPasswordLabel: UILabel!
    
    @IBOutlet var savePasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }

    func setupScreen() {
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        
        mainImage.image = UIImage(named: "NewPasswordMain")
        
        mainLabel.textColor = UIColor(red: 0.208, green: 0.208, blue: 0.208, alpha: 1)
        mainLabel.font = UIFont(name: "montserrat-regular", size: 28)
        mainLabel.textAlignment = .center
        mainLabel.text = "Новый пароль"
        
        informationLabel.textColor = UIColor(red: 0.62, green: 0.616, blue: 0.643, alpha: 1)
        informationLabel.font = UIFont(name: "lato-regular", size: 15)
        informationLabel.textAlignment = .center
        informationLabel.text = "Придумайте новый пароль и  введите его ниже два раза"
        informationLabel.numberOfLines = 0
        
        PasswordTF.placeholder = "Придумайте пароль"
        PasswordTF.padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 50)
        PasswordTF.eyeButton()
        
        repeatPasswordTF.placeholder = "Повторите пароль"
        repeatPasswordTF.padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 50)
        repeatPasswordTF.eyeButton()
        
        
        aboutPasswordLabel.textColor = UIColor(red: 0.62, green: 0.616, blue: 0.643, alpha: 1)
        aboutPasswordLabel.font = UIFont(name: "lato-regular", size: 13)
        aboutPasswordLabel.textAlignment = .center
        aboutPasswordLabel.text = "* Минимум 6 символов, 1 цифра и прописная буква"

        
        savePasswordButton.setTitle("Сохранить пароль", for: .normal)
        savePasswordButton.titleLabel?.font = UIFont(name: "lato-regular", size: 15)
        savePasswordButton.setTitleColor(.white, for: .normal)
        savePasswordButton.setTitleColor(.lightGray, for: .highlighted)
        savePasswordButton.layer.backgroundColor = UIColor(red: 0.82, green: 0.353, blue: 0.133, alpha: 1).cgColor
        savePasswordButton.layer.cornerRadius = 22
        
    }
    
    @IBAction func backRefreshPasswordScreen(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
