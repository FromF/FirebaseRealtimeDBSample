//
//  FirebaseRealTimeDBViewModel.swift
//  FirebaseRealtimeDBSample
//
//  Created by 藤治仁 on 2022/02/25.
//

import SwiftUI
import Firebase


class FirebaseRealTimeDBViewModel: ObservableObject {
    private let database: Database
    private lazy var ref: DatabaseReference = {
        database.reference()
    }()
    private let root = "Sample"
    private let userID: String
    private let names = ["taro" , "jiro" , "tanaka" , "sato" , "ninomiya"]

    init() {
//        database = Database.database(url: "https://hogehoge/")
        database = Database.database()
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
        
        let reference = ref.child(root).child(userID)
        
        reference.setValue(childValuesToSet)
        debugLog(childValuesToSet)
    }
    
    func add() {
        let detailValuesToSet: [AnyHashable: Any]
        
        detailValuesToSet = [
            "name": names.randomElement() ?? "no name",
            "value": Int.random(in: 0...100),
            "value2": Double.random(in: 0...100),
            "timeStamp": ServerValue.timestamp(),
        ]
        
        let reference = ref.child(root).child(userID)
        
        reference.childByAutoId().updateChildValues(detailValuesToSet)
        debugLog(detailValuesToSet)
    }
}
