//
//  FirebaseRealTimeDBViewModel.swift
//  FirebaseRealtimeDBSample
//
//  Created by 藤治仁 on 2022/02/25.
//

import SwiftUI
import Firebase


class FirebaseRealTimeDBViewModel: ObservableObject {
    private let root = "Sample"
    private let userID: String
    private let names = ["taro" , "jiro" , "tanaka" , "sato" , "ninomiya"]

    init() {
        userID = UUID().uuidString
        Auth.auth().signInAnonymously { authResult, error in
          debugLog("singin OK")
        }
    }
    
    func write() {
        let childValuesToSet: [AnyHashable: Any]
        childValuesToSet = [
            "uid": userID
        ]
        
        let reference = Database.database().reference().child(root).child(userID)
        
        reference.setValue(childValuesToSet)
        debugLog(childValuesToSet)
    }
    
    func add() {
        let childValuesToSet: [AnyHashable: Any]
        let detailValuesToSet: [AnyHashable: Any]
        
        detailValuesToSet = [
            "name": names.randomElement() ?? "no name",
            "value": Int.random(in: 0...100),
            "value2": Double.random(in: 0...100),
            "timeStamp": ServerValue.timestamp(),
        ]
        
        childValuesToSet = [
            UUID().uuidString: detailValuesToSet,
        ]
        
        
        let reference = Database.database().reference().child(root).child(userID)
                
        reference.updateChildValues(childValuesToSet)
        debugLog(childValuesToSet)
    }
}
