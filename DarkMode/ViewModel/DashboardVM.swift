//
//  DashboardVM.swift
//  DarkMode
//
//  Created by Apple on 29/01/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Alamofire

class DashboardVM  {
    
    let resultModel = ResultOutput()
    
    func fetchMenu(completion:@escaping() -> Void) {
        let params = [
            "userName" : "Guest_User",
            "mobileNo" : "9999999999",
              "lastUpdatedDate": "30-01-2020 01:36:57",
              "whichMethod": "NewUser",
              "signatureKey":"1234",
              "accountID":"1",
              "siteID":"1"
            
        ] as [String:Any]
        
        print(params)
        
        AF.request("http://ediosrwp.edios.global/RWP_API/fetchMenuV4", method: .post, parameters: params, encoding: JSONEncoding.default , headers: ["Content-Type":"application/json", "Accept":"application/json"]).responseJSON { response in
            
            switch response.result{
            case .success(let json):
                if json != nil{
                    if let jsonData = json as? NSDictionary{
                        print(jsonData)
                        if let resultOutput = jsonData["Result_Output"] as? NSDictionary{
                            self.resultModel.saveCategories(dict: resultOutput)
                            completion()
                        }
                        
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
    }
    
    
}


extension DashboardVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objDashboardVM.resultModel.categoriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = (objDashboardVM.resultModel.categoriesArray[indexPath.row].value(forKey: "categoryName") as! String)
        return cell
    }
    
}
