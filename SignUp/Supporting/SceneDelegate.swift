import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        self.setupWindow(with: scene)
        self.checkAuthentication()
//        let vc = TaskCreateController()
//        let vc = TaskScreenController()
//        let vc = RegistrationViewController()
//        let ui = UINavigationController(rootViewController: vc)
//        ui.modalPresentationStyle = .fullScreen
        
    }
    private func setupWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        self.window?.makeKeyAndVisible()
    }
    
    public func checkAuthentication() {
        if Auth.auth().currentUser == nil {
            self.goToStoryboard(withIdentifier: "Start")
    //        window?.rootViewController = ui
        } else {
            self.goToStoryboard(withIdentifier: "TaskScreen")
        }
    }
    
    private func goToStoryboard(withIdentifier Identifier: String ) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            self.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: Identifier)
    }
}

