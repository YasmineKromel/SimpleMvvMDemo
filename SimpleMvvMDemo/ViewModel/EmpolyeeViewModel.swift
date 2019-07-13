//
//  EmpolyeeViewModel.swift
//  SimpleMvvMDemo
//
//  Created by User on 7/12/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

// this class contain all logic of Employee listVC
class EmpolyeeViewModel
{
    
    // closure used to reload tableView
    var reloadTableViewClosure: (()->())?
    
    
    // use didSet observer to reload table view when Array of Employees get any new data
     var Employees :[Empolyee] = [Empolyee]()
     {
        didSet{
            reloadTableViewClosure?()
        }
        
    }
    
    
    // property with closure to return fixed number of sections
    var numberOfSections:Int
    {
        return 1
    }
    
    // property return number of cells in table view
    var numberOfCells : Int {
        return Employees.count
    }
    
    // Return item at specific indexPath in Employees Array
    func getEmpolyee(at indexPath: IndexPath) -> Empolyee {
        return Employees[indexPath.row]
    }
    
//    func downloadProfileImageOfEmpolyee(url:String,Placeholder: UIImageView)
//    {
//        guard let imageURL = URL(string: url) else {return}
//        Placeholder.af_setImage(withURL: imageURL)
//
//    }
    
    // this function is used to download Empolyee profile image from url - using AlamofireImage
    func getImage(url:String,handler: @escaping (_ error: String?,_ image:UIImage?)->Void) {
        
        Alamofire.request(url, method: .get).responseImage { response in
            //get data of image
            if let data = response.result.value{
                handler(nil,data)
            }
            else{
                    handler("No image downloaded" ,nil)
            }
       }

    }
    
    
    //this function fetches Empolyees data from API - Using Alamofire
    func getEmployeesData(_ completion: @escaping (_ error: NSError?, _ json: Data?) -> Void)
    {
        Alamofire.request(Endpoint).responseJSON { response in
            let json = response.data
            do{
                //created the json decoder
                let decoder = JSONDecoder()
                //using the array to put values
                self.Employees = try decoder.decode([Empolyee].self, from: json!)
              completion(nil,json)
            }catch let err{
                print(err)
                completion(err as NSError,nil)
            }
        }
    }
    
}
