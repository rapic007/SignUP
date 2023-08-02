import UIKit

class LoginScreen: UIViewController, UITextViewDelegate {
    
    @IBOutlet var mainImage: UIImageView!
    
    @IBOutlet var mainLabel: UILabel!
    
    @IBOutlet var emailTextField: CustomTextField!
    
    @IBOutlet var passwordTextField: CustomTextField!
    
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var orLabel: UILabel!
    
    @IBOutlet var googleImage: UIImageView!
    @IBOutlet var facebookImage: UIImageView!
    @IBOutlet var appleImage: UIImageView!
    
    @IBOutlet var continueLabel: UILabel!
    
    let userAgreementInfoTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSettings()
        setupTextView()
        setupRegistrationLabel()
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
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
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
    
    func setupTextView() {
        
        view.addSubview(userAgreementInfoTextView)
        userAgreementInfoTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userAgreementInfoTextView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            userAgreementInfoTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userAgreementInfoTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userAgreementInfoTextView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    @objc
    func loginButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc =  storyboard.instantiateViewController(withIdentifier: "TaskScreen")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc
    func handleTap(recognizer: UITapGestureRecognizer) {
        let vc = RegistrationViewController()
        let ui = UINavigationController(rootViewController: vc)
        ui.modalPresentationStyle = .fullScreen
        present(ui, animated: true)
    }

    private func setupRegistrationLabel() {
        
        let noAccountAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: UIFont(name: "lato-regular", size: 15)!,
        ]
        
        let registrationAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: UIFont(name: "lato-regular", size: 15)!,
            NSAttributedString.Key.link: URL(string: "registration")!
        ]
        
        let noAccountString = NSMutableAttributedString(string: "Нет аккаунта? ", attributes: noAccountAttributes)
        let registration = NSMutableAttributedString(string:"Зарегистрироваться", attributes: registrationAttributes)
        
        let fullAttributedString = NSMutableAttributedString()
        fullAttributedString.append(noAccountString)
        fullAttributedString.append(registration)
    
        
        self.userAgreementInfoTextView.linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        self.userAgreementInfoTextView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        self.userAgreementInfoTextView.delegate = self
        self.userAgreementInfoTextView.attributedText = fullAttributedString
        self.userAgreementInfoTextView.isEditable = false
        self.userAgreementInfoTextView.textAlignment = .center
    }
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.absoluteString == "registration" {
            let vc = RegistrationViewController()
            let ui = UINavigationController(rootViewController: vc)
            ui.modalPresentationStyle = .fullScreen
            present(ui, animated: true)
        }
            return false
        }

}
