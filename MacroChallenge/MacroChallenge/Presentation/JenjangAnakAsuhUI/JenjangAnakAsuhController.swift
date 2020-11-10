//
//  JenjangAnakAsuhController.swift
//  MacroChallenge
//
//  Created by Arif Luthfiansyah on 28/10/20.
//

import UIKit

class JenjangAnakAsuhController: UIViewController {

    @IBOutlet weak var ViewJenjangAnakAsuh1: JenjangAnakAsuhView!
    
    @IBOutlet weak var pilihPaketLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        ViewJenjangAnakAsuh1.layer.masksToBounds = true
        ViewJenjangAnakAsuh1.layer.borderColor = UIColor.lightGray.cgColor
        ViewJenjangAnakAsuh1.layer.borderWidth = 0.5
        ViewJenjangAnakAsuh1.layer.cornerRadius = 4
        ViewJenjangAnakAsuh1.layer.opacity = 1
        
        pilihPaketLabel.font = UIFont.init(name: "SF Compact Display", size: 22.0)
        
        
        //setelah view ditekan akan menampilkan shadow
//        ViewJenjangAnakAsuh1.layer.borderColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
//        ViewJenjangAnakAsuh1.layer.cornerRadius = 4
//        ViewJenjangAnakAsuh1.layer.shadowOffset = CGSize (width: 0, height: 1.75)
//        ViewJenjangAnakAsuh1.layer.shadowRadius = 5
//        ViewJenjangAnakAsuh1.layer.shadowOpacity = 0.45
        
    }
    

   
}
