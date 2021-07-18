//
//  AboutViewController.swift
//  LoginApp
//
//  Created by Sergey on 18.07.2021.
//

import UIKit

class AboutViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var personPhotoButton: UIButton!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    // MARK: - Public Properties
    var photoFileName = ""
    var firstName = ""
    var secondName = ""
    var dateOfBirth: DateComponents = DateComponents()
    var location = ""
    var email = ""
    var gender: Gender = .unknown
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        personPhotoButton.clipsToBounds = true
        personPhotoButton.layer.cornerRadius = 50
        personPhotoButton.setImage(UIImage(named: photoFileName), for: .normal)
        
        firstNameLabel.text = firstName
        secondNameLabel.text = secondName
        locationLabel.text = location
        emailLabel.text = email
        genderLabel.text = gender.rawValue
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let createCalendar = Calendar(identifier: .gregorian)
        guard let date = createCalendar.date(from: dateOfBirth) else { return }
        dateOfBirthLabel.text = dateFormatter.string(from: date)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? DetailsViewController else { return }
        detailsVC.photoFileName = photoFileName
    }

    // MARK: - IB Actions
    @IBAction func personPhotoButtonTapped() {
        performSegue(withIdentifier: "detailsScreenSegue", sender: nil)
    }
    
    
}
