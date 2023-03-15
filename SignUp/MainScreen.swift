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
    
    @IBOutlet var passwordTextField: CustomTextField!
    
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var registrationLabel: UILabel!
    
    @IBOutlet var orLabel: UILabel!
    
    @IBOutlet var googleImage: UIImageView!
    @IBOutlet var facebookImage: UIImageView!
    @IBOutlet var appleImage: UIImageView!
    
    @IBOutlet var continueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSettings()
        
    }
    
    func screenSettings() {
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        
        //MARK: SET Image
        
        mainImage.image = UIImage(named: "mainImage")
        googleImage.image = UIImage(named:"googleImage")
        facebookImage.image = UIImage(named: "facebookImage")
        appleImage.image = UIImage(named: "appleImage")
        
        //MARK: Mainlabel Propeties
        
        mainLabel.textColor = UIColor(red: 0.208, green: 0.208, blue: 0.208, alpha: 1)
        mainLabel.font = UIFont(name: "montserrat-regular", size: 28)
        mainLabel.textAlignment = .center
        mainLabel.text = "Войти в аккаунт"
        
        //MARK: EmailTF Propeties
        
        emailTextField.placeholder = "Введите свой email"
        emailTextField.padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 50)
        emailTextField.setupLeftSideImage(ImageViewNamed: "emailImage")
        
        
        //MARK: PasswordTF Properties
        
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 85)
        passwordTextField.setupLeftSideImage(ImageViewNamed: "passwordImage")
        passwordTextField.setupRightSideButton()
        passwordTextField.buttonHandler = { [weak self] in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "RefreshPasswordScreen")
            self?.present(vc, animated: true)
        }
        
       
        
        //MARK: LoginButton Properties
        
        loginButton.setTitle("Войти", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "lato-regular", size: 15)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitleColor(.lightGray, for: .highlighted)
        loginButton.layer.backgroundColor = UIColor(red: 0.82, green: 0.353, blue: 0.133, alpha: 1).cgColor
        loginButton.layer.cornerRadius = 22
        
        
        //MARK: registrationLabel Properties
        
        registrationLabel.textColor = UIColor(red: 0.82, green: 0.353, blue: 0.133, alpha: 1)
        registrationLabel.font = UIFont(name: "lato-regular", size: 15)
        registrationLabel.textAlignment = .center
        registrationLabel.text = "Нет аккаунта? Зарегистрироваться"
        
        //MARK: orLabel Properties
        
        orLabel.textColor = UIColor(red: 0.567, green: 0.567, blue: 0.567, alpha: 1)
        orLabel.font = UIFont(name: "lato-regular", size: 15)
        orLabel.textAlignment = .center
        orLabel.text = "или"
        
        //MARK: continueLabel Properties
        
        continueLabel.textColor = UIColor(red: 0.82, green: 0.353, blue: 0.133, alpha: 1)
        continueLabel.font = UIFont(name: "lato-regular", size: 15)
        continueLabel.textAlignment = .center
        continueLabel.text = "Продолжить без регистрации"
        
      
    }
    
}
