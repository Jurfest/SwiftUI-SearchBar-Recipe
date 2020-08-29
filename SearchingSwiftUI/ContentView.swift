//
//  ContentView.swift
//  SearchingSwiftUI
//
//  Created by Mohammad Azam on 8/21/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm: String = ""
    let names = ["Azam","Jake","Alex","Mary","Jack","Jerry"]
    
    var body: some View {
        
        ZStack{
            Card {
                VStack {
                    
                    HStack {
                        Text("Lista")
                        .font(.title)
                        .fontWeight(.bold)
                        
                        Spacer()
                    }
                    
                    // SearchBar is UIViewRepresentable
                    Card {
                        SearchBar(text: $searchTerm)
                    }.cornerRadius(20)
                        .colorScheme(.dark)
                        .padding(.bottom)
                    
                    ScrollView {
                        ForEach(self.names.filter {
                            self.searchTerm.isEmpty ? true :
                                $0.localizedCaseInsensitiveContains(self.searchTerm)
                        },id: \.self) { name in
                            Card {
                                Text(name)
                            }
                            .padding()
                            .colorScheme(.dark)
                            .background(Color.black)
                            .cornerRadius(10)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        }
                    }
                    
                }.padding()
            }.background(Color.white)
                .cornerRadius(20)
                .padding(EdgeInsets(top: 32, leading: 16, bottom: 32, trailing: 16))
            
        }.background(Color.black)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
