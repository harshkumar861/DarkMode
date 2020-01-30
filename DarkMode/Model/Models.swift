//
//  Models.swift
//  DarkMode
//
//  Created by Apple on 29/01/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

class ResultOutput{
    
    var category = Categories()
    var subCategory = SubCategories()
    var categoriesArray = [NSDictionary]()
    var objItem = Items()
    var itemArray = [NSDictionary]()
    
    func saveCategories(dict:NSDictionary){
        if let categories = dict["categories"] as? NSArray{
            self.categoriesArray = category.setCatergories(dataArray: categories as! [NSDictionary])
        }
        
        if let items = dict["items"] as? NSArray{
            self.itemArray = objItem.setItems(dict: items as! [NSDictionary])
        }
    }
    
    
    
}

class Categories{
    var categoryStatus = String(),categorySequence = Int(),
        categoryCode = String(),categoryName = String(),categoryID = Int()

    var catArray = [NSDictionary]()
   
    func setCatergories(dataArray:[NSDictionary])->[NSDictionary]{
        for cat in dataArray{
            catArray = [cat]
        }       
        return catArray
    }
    

}

class SubCategories{
    var subCategoryStatus = String(),subCategoryCode = String(),subCategoryID = Int(),categoryID = Int(),
        subCategoryImageUrl = String(), subCategoryName = String()

    func setCatergories(dict:NSDictionary){
        subCategoryStatus = dict["subCategoryStatus"] as! String
        subCategoryID = dict["subCategoryID"] as! Int
        subCategoryCode = dict["subCategoryCode"] as! String
        subCategoryImageUrl = dict["subCategoryImageUrl"] as! String
        categoryID = dict["categoryID"] as! Int
        subCategoryName = dict["subCategoryName"] as! String
    }

}


class Items{
    var itemSpiceLevel = String(),itemType = String(),itemCode =  String(),
        subCategoryID = String(),itemID = Int(),itemSpiceDesc = String(),
        itemName = String(),itemDiscountAmount = Int(),itemStatus = String(),
        itemPrice = Float(),itemDeliveryType = String(),itemDescription = String(),
        itemTaxAmount = Int(),itemImageUrl = String()
    
    var itemArray = [NSDictionary]()
    
    func setItems(dict:[NSDictionary]) -> [NSDictionary]{
        
        for item in dict {
            itemArray.append(item)
//                    itemSpiceLevel = item["itemSpiceLevel"] as! String
//                    itemType = item["itemType"] as! String
//                    itemCode = item["itemCode"] as! String
//                    subCategoryID = item["subCategoryID"] as! String
//                    itemID = item["itemID"] as! Int
//                    itemSpiceDesc = item["itemSpiceDesc"] as! String
//                    itemName = item["itemName"] as! String
//                    itemDiscountAmount = item["itemDiscountAmount"] as! Int
//                    itemStatus = item["itemStatus"] as! String
//                    itemPrice = item["itemPrice"] as! Float
//                    itemDeliveryType = item["itemDeliveryType"] as! String
//                    itemDescription = item["itemDescription"] as! String
//                    itemTaxAmount = item["itemTaxAmount"] as! Int
//                    itemImageUrl = item["itemImageUrl"] as! String
            print(itemArray)
        }
        
        return itemArray

      }
    
}


