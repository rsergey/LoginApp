//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Sergey on 13.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var welcomeLabel: UILabel!
    
    // MARK: - Public Properties
    var userName: String?

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let userName = self.userName else { return }
        welcomeLabel.text = "Welcome, \(userName)!"
    }
    
}
