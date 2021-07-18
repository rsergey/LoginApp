//
//  AboutViewController.swift
//  LoginApp
//
//  Created by Sergey on 18.07.2021.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var userName: UILabel!
    
    var user = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = user
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
