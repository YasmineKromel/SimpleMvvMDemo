//
//  EmpolyeeModel.swift
//  SimpleMvvMDemo
//
//  Created by User on 7/11/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation

// Employee Strutural data model 

struct Empolyee:Codable
{
    let id:String
    let employee_name:String
    let employee_salary:String
    let employee_age:String
    let profile_image:String
    
    init(id:String, name:String,salary:String,age:String,image:String)
    {
        self.id = id
        self.employee_name = name
        self.employee_salary = salary
        self.employee_age = age
        self.profile_image = image 
    }
    
   
}
