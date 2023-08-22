import UIKit

class AlertManager {
    
    private static func showBasicAlert(on vc: UIViewController, title: String, message: String?) {
     
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Назад", style: .default, handler: nil))
            
            vc.present(alert, animated: true)
        }
    }
}

// MARK: - Show Validation Alerts
extension AlertManager {
    
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Неверный Email", message: "Пожалуйста введите верный Email.")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Неверный Пароль", message: "Пожалуйста введите верный Пароль.")
    }
}
// MARK: - Registarion error
extension AlertManager {
    
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Неизвестная ошибка регистрации", message: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Неизвестная ошибка регистрации", message: "\(error.localizedDescription)")
    }
}

// MARK: - Login error
extension AlertManager {
    
    public static func showSignInErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Неизвестная ошибка при входе", message: nil)
    }
    public static func showSignInErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Ошибка при входе", message: "\(error.localizedDescription)")
    }
}
// MARK: - Logout Errors

extension AlertManager {
    
    public static func showLogoutError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Ошибка при выходе", message: "\(error.localizedDescription)")
    }

}

// MARK: - Forgot Password
extension AlertManager {
    
    public static func showPasswordResetSend(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Сброс пароля отправлен", message: nil)
    }
    
    public static func showErrorSendingPasswordReser(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Ошибка отправки сброса пароля", message: "\(error.localizedDescription)")
    }
}

// MARK: - Fetching User Errors
extension AlertManager {
    
    public static func showFetchingUserError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Ошибка получения пользователя", message: "\(error.localizedDescription)")
    }
    
    public static func showUnknownFetchongUserError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Неизвестная ошибка при получении пользователя", message: nil)
    }
}

