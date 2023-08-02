import UIKit

class RegistrationViewController: UIViewController {

    var registrationView: RegistrationView { return self.view as! RegistrationView}
    
    let minimalLeghtPass = 6
    lazy var regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{\(minimalLeghtPass),}$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupPasswordTextField()
        
    }

    override func loadView() {
        self.view = RegistrationView(frame: UIScreen.main.bounds)
    }

    func setupNavigationController() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"chevron.backward"),
                                                           style:.plain,
                                                           target: self,
                                                           action: #selector(buttonTapped))
        navigationController?.navigationBar.tintColor = .black
    }
    
    func setupPasswordTextField() {
        registrationView.passwordTextField.delegate = self
    }
    
    func checkValidation(password: String) {
        let messageLabel = registrationView.messageLabel
        
        guard password.count >= minimalLeghtPass else {
            messageLabel.text = ""
            return
        }
        if password.matches(regex) {
            messageLabel.textColor = .green
            messageLabel.text = "Верные символы в пароле "
            
        } else {
            messageLabel.textColor = .red
            messageLabel.text = "* Минимум 6 символов, 1 цифра, 1 прописная буква, 1 специальный символ"
        }
    }
    
    @objc
    func buttonPressed() {
        if registrationView.backgroundColor == UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1) {
            registrationView.backgroundColor = .orange
        } else {
            registrationView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        }
    }
    
    @objc
    func buttonTapped() {
        dismiss(animated: true)
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        checkValidation(password: result)
        textField.text = result
        return false
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
