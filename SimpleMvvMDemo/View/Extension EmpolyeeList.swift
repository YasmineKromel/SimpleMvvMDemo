//
//  Extension EmpolyeeList.swift
//  SimpleMvvMDemo
//
//  Created by User on 7/11/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation
import UIKit


// extension EmployeeList - to Seprate tableView functions 
extension EmployeesList
{
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return EmployeeVM.numberOfSections
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EmployeeVM.numberOfCells
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? EmployeeCell else {fatalError("Cell Not Found")}
        let rowdata = EmployeeVM.getEmpolyee(at: indexPath)
        cell.E_name.text = rowdata.employee_name
        cell.E_age.text = rowdata.employee_age
        cell.E_salary.text = rowdata.employee_salary
        let url = rowdata.profile_image
        
        //dummy url for test downloading images is working
       // let url = "https://dummyimage.com/200x200/000/0011ff"
    
        
        EmployeeVM.getImage(url: url) { (err,image) in
            if image != nil {
                print("image downloaded")
                cell.E_image.image = image
            }
            else{
                print(err!)
            }
        }
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
