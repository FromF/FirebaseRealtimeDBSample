//
//  FirebaseRealtimeDBSampleApp.swift
//  FirebaseRealtimeDBSample
//
//  Created by 藤治仁 on 2022/02/25.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()

        return true
    }
}

@main
struct FirebaseRealtimeDBSampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            FirebaseRealTimeDBView()
        }
    }
}
