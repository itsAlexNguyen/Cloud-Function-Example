//
//  FirebaseService.swift
//  CloudFunctionExample
//
//  Created by Alex Nguyen on 2017-03-15.
//  Copyright © 2017 Alex Nguyen. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = FIRDatabase.database().reference()

class FirebaseService {
    static let shared = FirebaseService()
    
    enum Keys : String {
        case users = "users"
        case fcmToken = "fcm_tokens"
    }
    
    func addFCMTokenToFirebase(_ token : String) {
        guard let user = FIRAuth.auth()?.currentUser else { return }
        let childUpdates = [ token : true ]
        DB_BASE.child(Keys.users.rawValue).child(user.uid).child(Keys.fcmToken.rawValue).updateChildValues(childUpdates)
    }
}
