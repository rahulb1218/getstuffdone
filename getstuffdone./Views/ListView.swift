//
//  ListView.swift
//  toDo
//
//  Created by Rahul Budhiraja on 8/4/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
            else{
                List{
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture{
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                        
                        //ListRowView(title: item)
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
            VStack{
            Spacer()
            HStack{
            Spacer()
            NavigationLink(destination: AddView()){
                        Image("Plus")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(90)
                    }
            .padding(25)
            }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("get stuff done.")
        .navigationBarItems(
            leading: EditButton()
        .navigationBarBackButtonHidden(true)
        )
    }
  
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(){
            ListView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(ListViewModel())
        .previewInterfaceOrientation(.portrait)
    }
}

