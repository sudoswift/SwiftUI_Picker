//
//  ContentView.swift
//  Picker_SwiftUI
//
//  Created by izvern on 2021/05/28.
//

import SwiftUI

struct ContentView: View {
    
    let langs = ["SwiftUI","Objective-C","Python"]
    
    @State private var selectionValue = 0
    var body: some View {
        Picker("피커", selection: $selectionValue, content: {
            ForEach(0..<langs.count){
                Text("I am good at \(langs[$0])")
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
