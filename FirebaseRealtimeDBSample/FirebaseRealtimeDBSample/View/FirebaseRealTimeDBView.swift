//
//  FirebaseRealTimeDBView.swift
//  FirebaseRealtimeDBSample
//
//  Created by 藤治仁 on 2022/02/25.
//

import SwiftUI

struct FirebaseRealTimeDBView: View {
    @StateObject var viewModel = FirebaseRealTimeDBViewModel()
    
    var body: some View {
        VStack {
            Text("Firebase Realtime Database Sample App")
                .padding()
            Button("Write") {
                viewModel.write()
            }
            .padding()
            Button("Add") {
                viewModel.add()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseRealTimeDBView()
    }
}
