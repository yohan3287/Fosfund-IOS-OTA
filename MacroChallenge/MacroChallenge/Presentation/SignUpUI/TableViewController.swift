//
//  TableViewController.swift
//  MacroChallenge
//
//  Created by Dickie Mandela on 05/11/20.
//

import UIKit

class TableViewController: UITableViewController{
    var users = [SignUpModel](){
        didSet{
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        }
    }
    
    func fetchData() {
        APIManager.shareInstance.getUsers { [weak self] result in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let usersRes):
                self?.users = usersRes
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
}


