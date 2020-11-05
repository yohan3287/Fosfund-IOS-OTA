//
//  APIManager.swift
//  MacroChallenge
//
//  Created by Dickie Mandela on 03/11/20.
//

import Foundation

enum UserError: Error{
    case NoDataAvailable
    case CAnnotProcessData
    case invalidURL
}

class APIManager {
    static let shareInstance = APIManager()
    let session = URLSession.shared
    
    let userURL = "http://159.65.142.226/ota/register"
    
    
     func getUsers(completion: @escaping(Result<[SignUpModel],UserError>)-> Void){
                    guard let UserURL = URL(string: userURL)else{
                        completion(.failure(.NoDataAvailable))
                        return

                    }
        
            let dataTask=session.dataTask(with: UserURL){
                data,_,_ in
                guard let jsonData = data else{
                    completion(.failure(.NoDataAvailable))
                    return
                    
                }
                do{
                    let decoder = JSONDecoder()
                    let userResponse = try decoder.decode([SignUpModel].self, from: jsonData)
                    completion(.success(userResponse))
                }catch{
                    completion(.failure(.CAnnotProcessData))
                }
            }
        dataTask.resume()
        }
}
