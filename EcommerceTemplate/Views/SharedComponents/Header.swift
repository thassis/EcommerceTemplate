//
//  Header.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 20/02/22.
//

import SwiftUI

struct Header: View {
    let title: String
    let showGoBack = true
    
    var body: some View {
        VStack{
            HStack(spacing: 0) {
                TextStyle(title, type: .large).padding(.top)
                Spacer()
                Image("cart").padding(.trailing, 18)
                Image("heart")
            }
            .padding(.horizontal, 16)
        }
        .padding(.bottom, 24)
        .frame(maxWidth: .infinity)
        .background(Color("Primary"))
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Header(title: "title")
            Spacer()
        }
    }
}
