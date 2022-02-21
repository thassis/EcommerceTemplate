//
//  Header.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 20/02/22.
//

import SwiftUI

struct Header: View {
    let title: String
    let isPrimaryScreen = true
    
    var body: some View {
        VStack(spacing: 0){
            Text(title)
        }
        .background(Color.white)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(title: "title")
    }
}
