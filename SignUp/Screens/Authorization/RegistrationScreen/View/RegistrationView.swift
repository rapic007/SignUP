import UIKit

final class RegistrationView: UIView {
    

    
    let registrationLabel = CustomLabel()
    let emailTextField = CustomTextField()
    let passwordTextField = CustomTextField()
    let messageLabel = CustomLabel()
    let registrationButton = CustomButton()
    
    var onButtonPressed: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        
        backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        
        registrationLabel.setupBigLabel(size: 28)
        registrationLabel.text = "Зарегистрироваться"
        registrationLabel.textAlignment = .center
        
        emailTextField.placeholder = "Введите свой email"
        emailTextField.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
        
        passwordTextField.placeholder = "Придумайте пароль"
        passwordTextField.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 40)
        passwordTextField.eyeButton()
        
        messageLabel.setupLabel(size: 13)
        messageLabel.numberOfLines = 0
        messageLabel.text = "* Минимум 6 символов, 1 цифра, 1 прописная буква, 1 специальный символ"

        registrationButton.setTitle("Зарегистрироваться", for: .normal)
        registrationButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        [registrationLabel, emailTextField, passwordTextField, messageLabel, registrationButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        NSLayoutConstraint.activate([
            registrationLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 123),
            registrationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            registrationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: 49),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),

            messageLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 9),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

            registrationButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 32),
            registrationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            registrationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            registrationButton.heightAnchor.constraint(equalToConstant: 44),
            
        ])
    }
    
    @objc
    func buttonPressed() {
        onButtonPressed?()
    }
}
