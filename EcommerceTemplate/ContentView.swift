//
//  ContentView.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var navigation = Navigation()
//    @State private var selection: String? = navigation.screen
    var body: some View {
        VStack{
            Header(title: navigation.screen ?? "")
            NavigationView {
                VStack{
                    NavigationLink(destination: Login(), tag: "Login", selection: $navigation.screen) { EmptyView() }
                    NavigationLink(destination: SignUp(), tag: "SignUp", selection: $navigation.screen) { EmptyView() }
                    Splash()
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
            .environmentObject(navigation)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
