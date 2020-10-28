//
//  OnBoardingController.swift
//  MacroChallenge
//
//  Created by Arif Luthfiansyah on 12/10/20.
//

import UIKit

class OnBoardingController: UIViewController {

    @IBOutlet var onboardingView: OnBoardingView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.onboardingView.controller = self
        self.onboardingView.viewDidLoad()
    }

}

