//
//  Splash.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

struct Splash: View {
    var body: some View {
        ZStack {
            Color("Primary").ignoresSafeArea()
            VStack{
                Image("SplashImage")
                    .resizable()
                    .frame(width: 126, height: 126)
                
                NavigationLink(destination: Login()) {
                    HStack(spacing: 0) {
                        TextLarge("Tradly")
                    }
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
