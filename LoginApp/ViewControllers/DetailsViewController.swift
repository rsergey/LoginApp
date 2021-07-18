//
//  DetailsViewController.swift
//  LoginApp
//
//  Created by Sergey on 18.07.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var personPhotoView: UIImageView!
    
    // MARK: - Public Properties
    var photoFileName = ""

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        personPhotoView.image = UIImage(named: photoFileName)
    }
    
}
