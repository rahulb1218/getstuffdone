//
//  AddView.swift
//  toDo
//
//  Created by Rahul Budhiraja on 8/6/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @FocusState private var addFocused: Bool
    var body: some View {
        ScrollView{
            VStack{
            TextField("Type something here...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .focused($addFocused)
                .onSubmit{saveButtonPressed()}
            Button(action: saveButtonPressed, label: {
                Text("Save".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            })
            }
                .padding(14)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.addFocused = true
                    }
                }
        }.navigationTitle("Add an Item ✍🏽")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
       
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 1{
            alertTitle = "pls type something fudu"
            addFocused = true
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AddView()
        }
        .environmentObject(ListViewModel())
    }
}
