//
//  SearchBar.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 23/02/22.
//

import SwiftUI

struct SearchBar: View {
    var onSubmit: (String?) -> Void
    
    var body: some View {
        TextInput(
            placeholder: "Search Product",
            bgColor: Color.white,
            fontColor:   Color("Black"),
            leftImgName: "magnifyingglass"
        ) { text in
            self.onSubmit(text)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("Primary").ignoresSafeArea()
            SearchBar() { text in
                print("previews: " + (text ?? ""))
            }
        }
    }
}
