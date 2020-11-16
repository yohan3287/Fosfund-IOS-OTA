//
//  UploadPembayaranController.swift
//  MacroChallenge
//
//  Created by Arif Luthfiansyah on 28/10/20.
//

import UIKit

class UploadPembayaranController: UIViewController {

    var picker: UIImagePickerController?
    @IBOutlet weak var ViewUploadPembayaran: UIView!
    @IBOutlet weak var uploadPembayaranView: UITableView!
    
    
    @IBOutlet weak var UploadPembayaranTableView: UITableView!
    
    @IBOutlet weak var unggahBuktiPembayaran: UIButton!
    
    var imagePicker: ImagePicker!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    let data = ["ID Pembayaran: P00231",
               "Detail Order Paket",
               "Satu demi Satu",
                "Metode Pembayaran",
                "Bank Mandiri"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UploadPembayaranTableView.delegate = self
        UploadPembayaranTableView.dataSource = self
        
        
        ViewUploadPembayaran.layer.shadowOpacity = 0.6
        ViewUploadPembayaran.layer.cornerRadius = 6
        ViewUploadPembayaran.layer.shadowRadius = 6
        
        UploadPembayaranTableView.delegate = self
        UploadPembayaranTableView.dataSource = self
        
        unggahBuktiPembayaran.layer.cornerRadius = 6
        
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    @IBAction func unggahBuktiPembayaran(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    var path: String = ""
    @IBAction func buttonUpload(_ sender: UIButton) {
        guard let image = imageView.image else{
            return
        }
        //postBuktiBayar(url: "abcdef", path: path)
       // uploadImage(paramName: "String", fileName: "String", image: )
    }
    
//    func postBuktiBayar(url: String, path: String){
//        let parameters = [
//          [
//            "key": "file",
//            "src": path,
//            "type": "file"
//          ]] as [[String : Any]]
//
//        let boundary = "Boundary-\(UUID().uuidString)"
//        var body = ""
//        var error: Error? = nil
//        for param in parameters {
//          if param["disabled"] == nil {
//            let paramName = param["key"]!
//            body += "--\(boundary)\r\n"
//            body += "Content-Disposition:form-data; name=\"\(paramName)\""
//            let paramType = param["type"] as! String
//            if paramType == "text" {
//              let paramValue = param["value"] as! String
//              body += "\r\n\r\n\(paramValue)\r\n"
//            } else {
//              let paramSrc = param["src"] as! String
//                do {
//                     let fileData = try NSData(contentsOfFile:paramSrc, options:[]) as Data
//                    let fileContent = String(data: fileData, encoding: .utf8)!
//                    body += "; filename=\"\(paramSrc)\"\r\n"
//                      + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
//                } catch let error {
//                    print(error)
//                }
//                //let fileData = try NSData(contentsOfFile:paramSrc, options:[]) as Data
//
//            }
//          }
//        }
//        body += "--\(boundary)--\r\n";
//        let postData = body.data(using: .utf8)
//        var orderId: Int = 1
//        var request = URLRequest(url: URL(string: "http://159.65.142.226/ota/bayar/\(orderId)")!,timeoutInterval: Double.infinity)
//        request.addValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYmVlMWUxMmM1OWJjMTYwYzNkYTllNThmNTc1YTAzMjM1MDNmYjQ5ZmQ2OGRlZmRlYTlhZTc2ZmY5YTAwNTI4MTMyNDQ3YTFlNThhYzdiNzQiLCJpYXQiOjE2MDUxNzAwMzQsIm5iZiI6MTYwNTE3MDAzNCwiZXhwIjoxNjM2NzA2MDM0LCJzdWIiOiIxIiwic2NvcGVzIjpbIioiXX0.UTIt9-SrLQyszl9w_nMdYPtTmCM6TKxxRni5nGFfI1wpBIZl8aZG1-GtXdpzgF_JfRKjlfy6Qpe3Cp_r8w6TWArSRP4XBXrLMy5WyrTLj1J26fkjP-XzHptwkbJSem63ujVMFcZcSVB-qPoCuSCopY-ymQABv0omtqh_KF2cw5GKZRcZBFYGmEoH9ys19dAYKijP2Oq0g_iTmRAZKQ1WCqh3jdq0dmVVfdaXWhG3bwFvovBPMCwjhKcYZZlDZ94knYwLpwoL5m_9U7vIXwpjtJHfjGUISBWb_GgPB2wR9JMAJBjHVNZEzpoIBS9r9E310qV780SCngntjTGJUd1RySECu0ogHkTjxTe2TkyIUOry65wHJkLFY8zNx6etHG9xlmGvB9xnaM0YcmUlMVtBmCivE_nu3NNHrqegaJ5TBXc1WQaa6DKv3rDT_0oJzuUStlfHt3THMqZnKu_GXQYwVF1SdcXv-GuPn-PBVkxa7UCLpOMCygxSSXwuYykvx5gyR12R8FMKvoIjYpMZtuPzHXTwI9XpGKuVaTCrD5a_xT9bmnC6YJ7YXBV_QIZS457ipY198fYrrbs3aPK2C5Nma3jmyuzOcAUYxJovIxT5oEOILe2fqs_NUsKzZjS6RRlxCVKGpa0JvS9sIe1DKYZS-_sXVHJTKZk1mErpf0YQXQ0", forHTTPHeaderField: "Authorization")
////                         forHTTPHeaderField: UserDefaults.standard.string (forKey: "access_token")!)
//        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//
//        request.httpMethod = "POST"
//        request.httpBody = postData
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//          guard let data = data else {
//            print(String(describing: error))
//            return
//          }
//          print(String(data: data, encoding: .utf8)!)
//
//        }
//
//        task.resume()
//    }
//
    let parameters = [
      [
        "key": "file",
        "src": "/Users/dickiemandela/Downloads/18-0226_popup.jpg",
        "type": "file"
      ]] as [[String : Any]]
    
    
    
    func uploadImage(paramName: String, fileName: String, image: UIImage) {
        let url = URL(string: "http://159.65.142.226/ota/bayar/")

        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString
        

        let session = URLSession.shared

        // Set the URLRequest to POST and to the specified URL
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"

        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var data = Data()

        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)

        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
                if let json = jsonData as? [String: Any] {
                    print(json)
                }
            }
        }).resume()
    }
   
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
//        self.UIImagePickerController.InfoKey; UIImagePickerController.InfoKey.referenceURL
//
//        let imageURL = info[UIImagePickerControllerReferenceURL] as NSURL
//        let imageName = imageURL.path!.lastPathComponent
//        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as String
//        let localPath = documentDirectory.stringByAppendingPathComponent(imageName)
//
//        let image = info[UIImagePickerControllerOriginalImage] as UIImage
//        let data = UIImagePNGRepresentation(image)
//        data.writeToFile(localPath, atomically: true)
//
//        let imageData = NSData(contentsOfFile: localPath)!
//        let photoURL = NSURL(fileURLWithPath: localPath)
//        let imageWithData = UIImage(data: imageData)!
//
//        picker.dismiss(animated: true, completion: nil)
//
//    }

}

extension UploadPembayaranController: ImagePickerDelegate{
    func didSelect(image: UIImage?, localPath: String?) {
        self.imageView.image = image
        self.path = localPath!
    }
    
}

extension UploadPembayaranController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension UploadPembayaranController: UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 5
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}


