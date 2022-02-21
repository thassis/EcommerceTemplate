//
//  Navigation.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 20/02/22.
//

import Foundation

class Navigation: ObservableObject {
    @Published var screen: String? = nil
    
    func navigate(to screen: String) {
        self.screen = screen
        print(screen)
    }
    
}
