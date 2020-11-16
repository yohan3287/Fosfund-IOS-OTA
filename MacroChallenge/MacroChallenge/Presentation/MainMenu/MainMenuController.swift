//
//  MainMenuController.swift
//  MacroChallenge
//
//  Created by Dickie Mandela on 05/11/20.
//

import UIKit

class MainMenuController: UIViewController{
    
    @IBOutlet var buttonMasuk: UIButton!
    @IBOutlet var buttonMasukWithApple: UIButton!
    @IBOutlet weak var buttonBuatAkunBaru: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonMasuk.layer.cornerRadius = 6
        buttonMasukWithApple.layer.cornerRadius = 6
    }
    @IBAction func buatAkunBaru(_ sender: UIButton) {
        
        
    }
    @IBAction func buttonMasuk(_ sender: UIButton) {
    }
    
    @IBAction func lanjutkanDenganApple(_ sender: UIButton) {
    }
    
    
}
