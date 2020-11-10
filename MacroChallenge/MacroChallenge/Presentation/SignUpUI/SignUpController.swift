//
//  SignUpController.swift
//  MacroChallenge
//
//  Created by Arif Luthfiansyah on 28/10/20.
//

import UIKit
import Foundation

protocol TextFieldCellDelegate: class {
    
    func todo(string: String, at indexPath: IndexPath)
    
}


class TextFieldCell: UITableViewCell {
    
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: TextFieldCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textField.delegate = self
    }
    
}

extension TextFieldCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let tableView = self.superview as? UITableView,
              let indexPath = tableView.indexPath(for: self) else {
            return true
        }
        let text = textField.text ?? ""
        guard let textRange = Range(range, in: text) else { return false }
        let updatedText = text.replacingCharacters(in: textRange, with: string)
        self.delegate?.todo(string: updatedText, at: indexPath)
        return true
    }
    
}

class SignUpController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    
    
    
    let data = [
        "Nama Lengkap",
        "Email",
        "Nomor Telepon",
        "Kata Sandi",
        "Tulis Ulang Kata Sandi"
    ]
    
    var fullName: String?
    var email: String?
    var nomorTelp: String?
    var password: String?
    var confirmPassword: String?
    
    
    override func viewDidLoad() {
        
        daftarAkun.layer.cornerRadius = 6
        
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        //        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150))
        //
        //        header.backgroundColor = .white
        //        footer.backgroundColor = .white
        //
        //        let label = UILabel(frame: header.bounds)
        //        label.text = "Buat akun baru"
        //
        //        //label.text = "Silahkan mengisi data-data yang diperlukan"
        //        label.textAlignment = .left
        //        header.addSubview(label)
        //
        //        let label2 = UILabel(frame: label.bounds)
        //       // label.text = "Buat akun baru"
        //        label2.text = "Silahkan mengisi data-data yang diperlukan"
        //        label2.textAlignment = .left
        //        header.addSubview(label2)
        //
        ////        tableView.tableHeaderView = header
        ////        tableView.tableFooterView = footer
        
        
    }
    
    @IBOutlet weak var daftarAkun: UIButton!
    
    
    @IBAction func daftarAkunTouchUpInside(_ sender: UIButton) {
        
        register()
        
    }
    
    private func post(target: String, jsonInBody: [String: Any]){
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonInBody)
        
        // create post request
        let url = URL(string: target)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let session = URLSession.shared
        request.httpMethod = "POST"
        
        do {
            request.httpBody = jsonData
        } catch let error {
            print(error.localizedDescription)
            
        }
        
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    return
                }
                print(json)
            } catch let error {
                print(error.localizedDescription)
            }
        })
        
        task.resume()
    }
    
    
    func register(){
//        guard let fullName = self.fullName,
//              let email = self.email,
//              let nomorTelp = self.nomorTelp,
//              let password = self.password,
//              password == confirmPassword else {
//            return
//        }
//        let json: [String: Any] = ["email": email,
//                                   "password": password,
//                                   "nama": fullName,
//                                   "telepon": nomorTelp]
        
        let json: [String: Any] = [
            "grant_type": "passwordd",
            "scope": "*",
            "client_id": "3",
            "client_secret": "IKthG5cI1GyzDqlR01I3Yr8R55u4FrwwM5q5RotZ",
            "email": "handy@email.com",
            "password": "secret"
        ]
        
//        post(target: "http://159.65.142.226/ota/register", jsonInBody: json)
        post(target: "http://159.65.142.226/api/v1/oauth/token", jsonInBody: json)
        
    }
    
}


extension SignUpController: UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension SignUpController: UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: TextFieldCell.self)
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        guard let cell = reusableCell as? TextFieldCell else {
            fatalError("Cannot dequeue reusable cell with identifier: \(identifier)")
        }
        cell.delegate = self
        cell.textField.placeholder = self.data[indexPath.row]
        return cell
    }
    
}

extension SignUpController: TextFieldCellDelegate {
    
    func todo(string: String, at indexPath: IndexPath) {
        let datum = self.data[indexPath.row]
        switch datum {
        case "Nama Lengkap":
            print("Nama TextField: \(string)")
            fullName = string
        case "Email":
            print("Email TextField: \(string)")
            email = string
        case "Nomor Telepon":
            print("Nomor Telepon TextField: \(string)")
            nomorTelp = string
        case "Kata Sandi":
            print("Kata Sandi TextField: \(string)")
            password = string
        case "Tulis Ulang Kata Sandi":
            print("Tulis Ulang Kata Sandi TextField: \(string)")
            confirmPassword = string
        default:
            break
        }
    }
    
}
