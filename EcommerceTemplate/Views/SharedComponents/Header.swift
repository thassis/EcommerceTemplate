//
//  Header.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 20/02/22.
//

import SwiftUI

struct Header<TargetView: View>: View {
    let title: String
    let showGoBack: Bool
    let goBackTo: TargetView?
    
    init(title: String, showGoBack: Bool = false, goBackTo: TargetView = TargetView.self as! TargetView){
        self.title = title
        self.showGoBack = showGoBack
        self.goBackTo = goBackTo
    }
    
    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 0) {
                if(showGoBack){
                    NavigationLink(destination: goBackTo){
                        Image("Back")
                    }
                    Spacer()
                }
                TextStyle(title, type: .large)
                Spacer()
                if(!showGoBack){
                    Image("cart").padding(.trailing, 18)
                    Image("heart")
                }
            }
            .padding(.horizontal, 16)
            .padding(.top)
        }
        .padding(.bottom, 24)
        .frame(maxWidth: .infinity)
        .background(Color("Primary"))
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Header<Home>(title: "title", showGoBack: true)
            Spacer()
        }
    }
}
