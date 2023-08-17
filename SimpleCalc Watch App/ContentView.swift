//
//  ContentView.swift
//  SimpleCalc Watch App
//
//  Created by Gaurav Tak on 17/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CalcUiView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
