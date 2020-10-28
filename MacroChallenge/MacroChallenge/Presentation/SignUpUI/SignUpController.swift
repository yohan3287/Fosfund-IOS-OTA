//
//  SignUpController.swift
//  MacroChallenge
//
//  Created by Arif Luthfiansyah on 28/10/20.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet var signupView: SignUpView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.signupView.controller = self
        self.signupView.viewDidLoad()

        // Do any additional setup after loading the view.
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
