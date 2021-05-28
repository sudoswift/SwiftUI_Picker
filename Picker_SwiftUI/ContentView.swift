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
        Picker("", selection: $selectionValue, content: {
            Text("수박").tag(0)
            Text("바나나").tag(1)
            Text("딸기").tag(2)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
