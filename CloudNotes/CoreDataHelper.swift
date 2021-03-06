//
//  CoreDataHelper.swift
//  CloudNotes
//
//  Created by Tim Pryor on 2015-12-15.
//  Copyright (c) 2015 Tim Pryor. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper: NSObject {
   
    class func insertManagedObject(className:NSString, managedObjectContext:NSManagedObjectContext) -> AnyObject {
        let managedObject = NSEntityDescription.insertNewObjectForEntityForName(className as String, inManagedObjectContext: managedObjectContext) as! NSManagedObject
        
        return managedObjectContext
    }
    
    class func fetchEntities (className:NSString, managedObjectContext:NSManagedObjectContext, predicate:NSPredicate?)->NSArray{
        let fetchRequest = NSFetchRequest()
        let entityDescription = NSEntityDescription.entityForName(className as String, inManagedObjectContext: managedObjectContext)
        fetchRequest.entity = entityDescription
        
        if predicate != nil {
            fetchRequest.predicate = predicate!
        }
        
        fetchRequest.returnsObjectsAsFaults = false
        
        let items = managedObjectContext.executeFetchRequest(fetchRequest, error: nil)
        
        return items!
        
    }
    
}
