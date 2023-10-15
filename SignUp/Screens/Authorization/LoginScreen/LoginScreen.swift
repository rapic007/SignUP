import UIKit

class LoginScreen: UIViewController {
    
    @IBOutlet var mainImage: UIImageView!
    
    @IBOutlet var mainLabel: UILabel!
    
    @IBOutlet var emailTextField: CustomTextField!
    
    @IBOutlet var passwordTextField: CustomTextField!
    
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var orLabel: UILabel!
    
    @IBOutlet var googleImage: UIImageView!
    @IBOutlet var facebookImage: UIImageView!
    @IBOutlet var appleImage: UIImageView!
    
    let notifi = NotificationsController()
    let registrationTextView = CustomTextView()
    let continueTextView = CustomTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSettings()
        setupRegistrationTextView()
        setupContinueTextView()
        notifi.checkForPermission()
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
        emailTextField.keyboardType = .emailAddress
        
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
    }
    
    func setupRegistrationTextView() {

        view.addSubview(registrationTextView)
        NSLayoutConstraint.activate([
            registrationTextView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            registrationTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registrationTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registrationTextView.heightAnchor.constraint(equalToConstant: 30),
        ])
        let fullAttributedString = NSMutableAttributedString()
        let registration = registrationTextView.setAttributeWithURL(Url: "registration", attribute: "Зарегистрироваться")
        let noAccount = registrationTextView.setAttributeWithoutURL(attribute: "Нет аккаунта? ")

        fullAttributedString.append(noAccount)
        fullAttributedString.append(registration)

        registrationTextView.delegate = self
        registrationTextView.attributedText = fullAttributedString
        registrationTextView.setupTextView()
    }
    
    func  setupContinueTextView() {
        
        view.addSubview(continueTextView)

        let attributedString = continueTextView.setAttributeWithURL(Url: "Continue", attribute: "Продолжить без регистрации")
        continueTextView.attributedText = attributedString
        continueTextView.delegate = self
        continueTextView.setupTextView()
        
        NSLayoutConstraint.activate([
            continueTextView.topAnchor.constraint(equalTo: registrationTextView.bottomAnchor, constant: 106),
            continueTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueTextView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    func openTaskScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc =  storyboard.instantiateViewController(withIdentifier: "TaskScreen")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    @objc
    func loginButtonTapped() {
        let loginRequest = LoginUserRequest(email: self.emailTextField.text ?? "", password: self.passwordTextField.text ?? "")
        
        guard Validator.isValidEmail(for: loginRequest.email) else {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        guard Validator.isValidPassword(for: loginRequest.password) else {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        AuthenticationService.shared.signIn(with: loginRequest) { [weak self] error in
            
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showSignInErrorAlert(on: self, with: error)
                return
            }
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
}

extension LoginScreen: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.absoluteString == "registration" {
            let vc = RegistrationViewController()
            let ui = UINavigationController(rootViewController: vc)
            ui.modalPresentationStyle = .fullScreen
            present(ui, animated: true)
        }
        else if  URL.absoluteString == "Continue" {
            openTaskScreen()
        }
            return false
        }
}
