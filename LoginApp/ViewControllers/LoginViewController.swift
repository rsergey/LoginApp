//
//  ViewController.swift
//  LoginApp
//
//  Created by Sergey on 13.07.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    // MARK: - IB Outlets
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    // MARK: - Private Properties
    private let user = User.getUser()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super .viewDidLoad()
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        guard let viewControllers = tabBarController.viewControllers else { return }
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = user.userName
            } else if let navigationVC = viewController as? UINavigationController {
                guard let aboutVC = navigationVC.topViewController as? AboutViewController else { return }
                aboutVC.title = user.person.firstName + " " + user.person.secondName
                aboutVC.photoFileName = user.person.photoFileName
                aboutVC.gender = user.person.gender
                aboutVC.firstName = user.person.firstName
                aboutVC.secondName = user.person.secondName
                aboutVC.dateOfBirth = user.person.dateOfBirth
                aboutVC.location = user.person.placeOfLiving
                aboutVC.email = user.email
            }
        }
    }
    
    // MARK: - IB Actions
    @IBAction func logInButtonTapped() {
        if userNameTF.text == user.userName && passwordTF.text == user.password {
            performSegue(withIdentifier: "welcomeScreenSegue", sender: nil)
        } else {
            showAlert(title: "Oops!",
                      message: "Wrong username or password! Try again.",
                      incorrectTextFields: userNameTF, passwordTF)
        }
    }
    
    @IBAction func showHelp(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(title: "No problem!",
                      message: "Your user name: " + user.userName,
                      incorrectTextFields: userNameTF)
        } else if sender.tag == 1 {
            showAlert(title: "Hmm...",
                      message: "Your password: " + user.password,
                      incorrectTextFields: passwordTF)
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    // MARK: - Pablic Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        }
        if textField == passwordTF {
            logInButtonTapped()
        }
        return true
    }
    
    // MARK: - Private Methods
    private func showAlert(title: String, message: String, incorrectTextFields: UITextField...) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButtonAction = UIAlertAction(title: "Ok", style: .default) { _ in
            for incorrectTextFeeld in incorrectTextFields {
                incorrectTextFeeld.text = ""
            }
            incorrectTextFields[0].becomeFirstResponder()
        }
        alert.addAction(okButtonAction)
        present(alert, animated: true)
    }
    
}
