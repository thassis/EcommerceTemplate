//
//  Splash.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

struct Splash: View {
    @State var goToTabViews = false
    
    var body: some View {
        if(!goToTabViews){
            ZStack {
                Color("Primary").ignoresSafeArea()
                VStack{
                    Image("SplashImage")
                        .resizable()
                        .frame(width: 126, height: 126)
                    
                    Button(action: {
                        goToTabViews = true
                    }) {
                        TextStyle("Tradly", type: .large)
                    }
                }
            }
        } else {
            TabViews()
        }        
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
