//
//  DataController.swift
//  ProBookworm
//
//  Created by Sothesom on 07/11/1402.
//

import Foundation
import CoreData

class DataController : ObservableObject { //شعی قابل مشاهده
    
    // لود کردن دیتا
    let container = NSPersistentContainer(name: "DataModel")
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error{
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
