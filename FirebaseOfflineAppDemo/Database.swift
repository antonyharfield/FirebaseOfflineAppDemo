//
//  Database.swift
//  FirebaseStorageCache
//
//  Created by Ant on 20/02/2017.
//  Copyright © 2017 Apptitude. All rights reserved.
//

import Foundation

import Foundation
import FirebaseDatabase

class Database {
    
    private static let databaseRef = FIRDatabase.database().reference()
    private static let eventsRef = databaseRef.child("events")
    
    static func setup() {
        FIRDatabase.database().persistenceEnabled = true
    }
    
    static func events(completion: @escaping ([Event]) -> ()) {
        eventsRef.observe(.value, with: { (snapshot) in
            guard let dict = snapshot.value as? [String: AnyObject] else {
                print("Error getting events")
                completion([])
                return
            }
            let results: [Event] = dict.keys.sorted().flatMap {
                guard let contents = dict[$0] as? [String : AnyObject] else {
                    return nil
                }
                return Event(id: $0, contents: contents)
            }
            completion(results)
        })
    }
    
}
