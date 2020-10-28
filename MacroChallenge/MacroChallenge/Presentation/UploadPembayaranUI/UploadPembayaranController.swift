//
//  UploadPembayaranController.swift
//  MacroChallenge
//
//  Created by Arif Luthfiansyah on 28/10/20.
//

import UIKit

class UploadPembayaranController: UIViewController {

    @IBOutlet var uploadPembayaranView: UploadPembayaranView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uploadPembayaranView.controller = self
        self.uploadPembayaranView.viewDidLoad()
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
