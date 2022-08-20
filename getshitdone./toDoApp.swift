//
//  toDoApp.swift
//  toDo
//
//  Created by Rahul Budhiraja on 8/1/22.
//

import SwiftUI

@main
struct toDoApp: App {

    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                SignUpView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
