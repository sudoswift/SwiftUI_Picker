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
        VStack(alignment: .center){
            Text("선택된 값 : \(selectionValue)")
            // 같은 뷰에서 picker는 같은 Binding을 공유한다.
            Picker("", selection: $selectionValue, content: {
                Text("레드").tag(0)
                Text("그린").tag(1)
                Text("블루").tag(2)
            })
            .padding(.horizontal, 50.0)
            .pickerStyle(SegmentedPickerStyle()) // picker style 이 segmentedpickerstyle로 변경됨
            
            Picker("", selection: $selectionValue, content: {
                Text("레드").tag(0)
                Text("그린").tag(1)
                Text("블루").tag(2)
            })
            .padding(.horizontal, 50.0)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
