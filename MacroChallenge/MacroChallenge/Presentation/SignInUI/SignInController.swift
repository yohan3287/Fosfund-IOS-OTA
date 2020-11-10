//
//  SignInController.swift
//  MacroChallenge
//
//  Created by Arif Luthfiansyah on 28/10/20.
//

import UIKit


class SignInController: UIViewController {
    
    @IBOutlet weak var ViewModalSignIn: UIView!
    
    @IBOutlet weak var inputKataSandi: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewModalSignIn.layer.cornerRadius = 6    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    private func postSignIn(url: String, parameters:[[String:Any]]){
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        var error: Error? = nil
        for param in parameters {
            if param["disabled"] == nil {
                let paramName = param["key"]!
                body += "--\(boundary)\r\n"
                body += "Content-Disposition:form-data; name=\"\(paramName)\""
                let paramType = param["type"] as! String
                if paramType == "text" {
                    let paramValue = param["value"] as! String
                    body += "\r\n\r\n\(paramValue)\r\n"
                } else {
                    let paramSrc = param["src"] as! String
                    do{
                        let fileData = try NSData(contentsOfFile:paramSrc, options:[]) as Data
                        let fileContent = String(data: fileData, encoding: .utf8)!
                        body += "; filename=\"\(paramSrc)\"\r\n"
                            + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
                    } catch{
                        print("error")
                    }
                }
            }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            let str = String(data: data, encoding: .utf8)!
            
            guard let dict = self.convertToDictionary(text: str)
            else{
                return
            }
            
            print(dict["access_token"])
            
            UserDefaults.standard.set(dict["access_token"], forKey: "access_token")
        }
        
        task.resume()
    }
    
    @IBAction func buttonSignIn(_ sender: UIButton) {
        
        guard let email = self.inputEmail.text,
              let kataSandi = self.inputKataSandi.text
        else{
            
            return
        }
        
        let parameters = [
            [
                "key": "grant_type",
                "value": "password",
                "type": "text"
            ],
            [
                "key": "scope",
                "value": "*",
                "type": "text"
            ],
            [
                "key": "client_id",
                "value": "3",
                "type": "text"
            ],
            [
                "key": "client_secret",
                "value": "IKthG5cI1GyzDqlR01I3Yr8R55u4FrwwM5q5RotZ",
                "type": "text"
            ],
            [
                "key": "username",
                "value": email,
                "type": "text"
            ],
            [
                "key": "password",
                "value": kataSandi,
                "type": "text"
            ]] as [[String : Any]]
        
        postSignIn(url: "http://159.65.142.226/api/v1/oauth/token", parameters: parameters)
        
    }
    
   let storyBoard: UIStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
    
    
    @IBAction func buttonCreateAccount(_ sender: UIButton) {
        
        
    }
}


