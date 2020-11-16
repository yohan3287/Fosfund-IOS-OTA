//
//  ProfileController.swift
//  MacroChallenge
//
//  Created by Dickie Mandela on 12/11/20.
//

import Foundation
import UIKit

class ProfileController: UIViewController {
    
    @IBOutlet weak var viewGradient: UIView!
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var textFieldNama: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPhoneNumber: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var buttonLogOut: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageProfile.layer.borderWidth = 1
        imageProfile.layer.masksToBounds = true
        imageProfile.layer.borderColor = UIColor.black.cgColor
        imageProfile.layer.cornerRadius = imageProfile.bounds.width / 2
        
        buttonSave.layer.cornerRadius = 6
        buttonLogOut.layer.cornerRadius = 6
        
    }
    
    @IBAction func buttonSimpanTouchUpInside(_ sender: UIButton) {
    }
    
    @IBAction func buttonKeluarTouchUpInside(_ sender: UIButton) {
    }
    
    
}

