//
//  StoreList.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 28/02/22.
//

import SwiftUI

struct StoreList: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    TextStyle("Store to Follow", type: .medium, bold: true)
                    Spacer()
                    TextStyle("View All", type: .small, bold: true, textColor: Color("Primary"))
                        .padding(.horizontal, 24)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(Color.white)
                        )
                }
                ScrollView(.horizontal){
                    HStack(spacing: 10) {
                        CardStore()
                        CardStore()
                        CardStore()
                        CardStore()
                        CardStore()
                    }
                }
            }
        }
        .padding(16)
        .background(
            VStack(spacing: 0){
                Color("Primary")
                Color("background")
            }
        )
    }
}

struct StoreList_Previews: PreviewProvider {
    static var previews: some View {
        StoreList()
    }
}
