//
//  AddView.swift
//  toDo
//
//  Created by Rahul Budhiraja on 8/6/22.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State private var willMoveToNextScreen = false
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @FocusState private var addFocused: Bool
    var body: some View {
        ScrollView{
            VStack{
            Text("Welcome. We're glad you're ready to take your productivity to the next level. We're just gonna need some information so your friends know who you are. Let's start with your phone number.")
                    .font(.body)
                    .padding(40)
                    .foregroundColor(.gray)
            TextField("10 digit phone number with area code", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .onSubmit{nextButtonPressed()}
                
                NavigationLink(destination: ListView(), label: {
                Text("Next".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    
                }).disabled(!textIsAppropriate())
            }
            
                .padding(14)
        }.navigationTitle("Let's get started😈")
            .alert(isPresented: $showAlert, content: getAlert)
            
    }
    
    
    func nextButtonPressed(){
        if textIsAppropriate(){
            willMoveToNextScreen = true
        }
       
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 10{
            alertTitle = "Nope. Please type a valid 10 digit phone number including your area code."
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        SignUpView()
        }
        .environmentObject(ListViewModel())
    }
}
