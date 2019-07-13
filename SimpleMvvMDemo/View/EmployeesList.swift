//
//  EmployeesList.swift
//  SimpleMvvMDemo
//
//  Created by User on 7/11/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit
import Alamofire

class EmployeesList : UITableViewController{
    
    // get an instance of EmployeeViewModel
    lazy var EmployeeVM : EmpolyeeViewModel = {
        return EmpolyeeViewModel()
    }()

   
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initVM()
    }
    
    
    // this function - set closure - call getEmployeesData
    func initVM() {
       EmployeeVM.reloadTableViewClosure = { [weak self] () in
            self?.tableView.reloadData()
        }
        EmployeeVM.getEmployeesData { (error, data) in
            if error == nil
            {
                print("Data fetched")
            }
        }
    }
    
    
    
    func initView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
//        EmployeeVM.getEmployeesData { (error, data) in
//            if error == nil
//            {
//                print("Data fetched")
//            }
//        }
        
   //     initVM()
    }
    


   

}
