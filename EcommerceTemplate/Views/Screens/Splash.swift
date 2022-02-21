//
//  Splash.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

struct Splash: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        ZStack {
            Color("Primary").ignoresSafeArea()
            VStack{
                Image("SplashImage")
                    .resizable()
                    .frame(width: 126, height: 126)
                TextLarge("Tradly").onTapGesture {
                    navigation.navigate(to: "Login")
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
