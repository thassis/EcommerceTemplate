//
//  ContentView.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabViews()
//        NavigationView {
//            Splash()
//                .navigationBarTitle("")
//                .navigationBarHidden(true)
//                .navigationBarBackButtonHidden(true)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
