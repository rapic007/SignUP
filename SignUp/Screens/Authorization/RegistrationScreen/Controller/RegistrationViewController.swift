import UIKit

class RegistrationViewController: UIViewController {

    var registrationView: RegistrationView { return self.view as! RegistrationView}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationView.onRegistrationButtonPressed = { [weak self] in self?.registrationButtonPressed()}
        registrationView.onSignInPressed = { [weak self] in self?.signInPressed()}
        setupNavigationController()
        
    }

    override func loadView() {
        self.view = RegistrationView(frame: UIScreen.main.bounds)
    }

    func setupNavigationController() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"chevron.backward"),
                                                           style:.plain,
                                                           target: self,
                                                           action: #selector(leftBarButtonTapped))
        navigationController?.navigationBar.tintColor = .black
    }
    
    func signInPressed() {
        dismiss(animated: true)
    }
    
    @objc
    func registrationButtonPressed() {
        let registerUserRequest = RegisterUserRequest(email: registrationView.emailTextField.text ?? "",
                                                      password: registrationView.passwordTextField.text ?? "")
  
        guard Validator.isValidEmail(for: registerUserRequest.email) else {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        guard Validator.isValidPassword(for: registerUserRequest.password) else {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthenticationService.shared.registerUser(with: registerUserRequest) { [weak self] wasRegistered, error in
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
                return
            }
            if wasRegistered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                } else {
                    AlertManager.showRegistrationErrorAlert(on: self)
                }
            }
        }
    }
    
    @objc
    func leftBarButtonTapped() {
        dismiss(animated: true)
    }
}
