//
//  ViewController.swift
//  CarRentalApp
//
//  Created by Samxal Quliyev  on 21.10.23.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.text = "12345"
        emailTextField.text = "ayan@mail.ru"
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        if passwordTextField.text == "12345" && emailTextField.text == "ayan@mail.ru" {
            //let controller = storyboard?.instantiateViewController(identifier: "TabBarController")
           // navigationController?.show(controller!, sender: nil)
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                    sceneDelegate.setTabBarAsRootController(windowScene: windowScene)
                    UserDefaults.standard.setValue(true, forKey: "Logged in")
            } else {
                print("user does not exist")
            }
        }
    }
}

//if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//   let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
//    sceneDelegate.setHomeAsRootController(windowScene: windowScene)
//    UserDefaults.standard.setValue(true, forKey: "Logged In")
//} else {
//    print("User not exist")
//}
