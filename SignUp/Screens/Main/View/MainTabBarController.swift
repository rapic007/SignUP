//
//  MainTabBarController.swift
//  SignUp
//
//  Created by Влад  on 3.04.23.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
        setupTabBar()
 
    }
    private func createTabBar() {
        viewControllers = [
 
        setupVC(viewController: TaskScreen(), title: "Задачи", image: UIImage(named: "taskImage")),
        setupVC(viewController: CourseScreen(), title: "Курсы", image: UIImage(named: "courseImage")),
        setupVC(viewController: ProfileScreen(), title: "Профиль", image: UIImage(named: "profileImage")),
            
        ]
    }
    
    private func setupVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
    
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
        return viewController
    }
    private func setupTabBar () {
        
        tabBar.tintColor = UIColor(red: 0.941, green: 0.667, blue: 0.055, alpha: 1)
        tabBar.unselectedItemTintColor = UIColor(red: 0.208, green: 0.208, blue: 0.208, alpha: 1)

    }

    @IBAction func backMainScreen(_ sender: Any) {
        self.dismiss(animated: true)
    }
}


