//
//  Card.swift
//  SearchingSwiftUI
//
//  Created by Diego Jurfest Ceccon on 28/08/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct Card<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
        .frame(maxWidth: .infinity)
        .background(Color("Default"))
        .cornerRadius(8)
        .shadow(radius: 8)
        .padding([.top, .leading, .trailing])
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card{
            VStack() {
                Text("Content")
            }.frame(
                maxWidth: .infinity
            )
            .padding()
        }
    }
}
