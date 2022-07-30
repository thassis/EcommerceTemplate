//
//  Header.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 20/02/22.
//

import SwiftUI

struct Header: View {
    let title: String
    let showGoBack: Bool
    @State var paddingBottom: CGFloat
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(title: String, showGoBack: Bool = false) {
        self.title = title
        self.showGoBack = showGoBack
        _paddingBottom = State(initialValue: title.isEmpty ? 8 : 24)
    }
    
    var body: some View {
        VStack{
            ZStack(alignment: .leading) {
                if(showGoBack){
                    Button(action: { self.mode.wrappedValue.dismiss() }) {
                        Image("Back")
                    }
                }
                
                TextStyle(title, type: .large)
                    .frame(maxWidth: .infinity)
                
            }
            .padding(.horizontal, 16)
            .padding(.top)
        }
        .padding(.bottom, self.paddingBottom)
        .frame(maxWidth: .infinity)
        .background(Color("Primary"))
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Header(title: "title", showGoBack: true)
            Spacer()
        }
    }
}
