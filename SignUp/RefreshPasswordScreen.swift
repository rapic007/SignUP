//
//  RefreshEmailScreen.swift
//  SignUp
//
//  Created by Влад  on 14.03.23.
//

import UIKit

class RefreshPasswordScreen: UIViewController {
    
    @IBOutlet var mainPicture: UIImageView!
    
    @IBOutlet var mainLabel: UILabel!
    
    @IBOutlet var littleLabel: UILabel!
    
    @IBOutlet var emailTextField: CustomTextField!
    
    @IBOutlet var recoverButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupScreen()
    }
    
    func setupScreen() {
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        
        mainPicture.image = UIImage(named: "mainEmailImage")
        
        //MARK: Maimlabel Properties
        
        mainLabel.textColor = UIColor(red: 0.208, green: 0.208, blue: 0.208, alpha: 1)
        mainLabel.font = UIFont(name: "montserrat-regular", size: 28)
        mainLabel.textAlignment = .center
        mainLabel.text = "Введите email"
        
        //MARK: litleLabel Properties
        
        littleLabel.textColor = UIColor(red: 0.62, green: 0.616, blue: 0.643, alpha: 1)
        littleLabel.font = UIFont(name: "lato-regular", size: 15)
        littleLabel.textAlignment = .center
        littleLabel.text = "Введите свой email и следуйте дальнейшим инструкциям"
        littleLabel.numberOfLines = 0
        
        //MARK: EmailTF Properties
        
        emailTextField.placeholder = "Введите email"
        emailTextField.padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
        
        //MARK: recoverButton Properties
        
        recoverButton.setTitle("Восстановить пароль", for: .normal)
        recoverButton.titleLabel?.font = UIFont(name: "lato-regular", size: 15)
        recoverButton.setTitleColor(.white, for: .normal)
        recoverButton.setTitleColor(.lightGray, for: .highlighted)
        recoverButton.layer.backgroundColor = UIColor(red: 0.82, green: 0.353, blue: 0.133, alpha: 1).cgColor
        recoverButton.layer.cornerRadius = 22
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
