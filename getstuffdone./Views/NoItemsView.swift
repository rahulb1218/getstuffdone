//
//  NoItemsView.swift
//  toDo
//
//  Created by Rahul Budhiraja on 8/18/22.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
            Text("you finished eveything. good stuff. sit back and relax for now 🥱")
                    //.font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
            NavigationLink(
                    destination: AddView(),
                     label: {
                        Text("Ready to work?? Add Something😈")
                             .foregroundColor(.white)
                             .font(.headline)
                             .frame(height: 55)
                             .frame(maxWidth: .infinity)
                             .background(Color.accentColor)
                             .cornerRadius(10)
                    })
            .padding(.horizontal, 30)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else{return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}


struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
                .navigationTitle("Title")
        }
        .preferredColorScheme(.dark)
        .previewInterfaceOrientation(.landscapeLeft)
        
    }
}
