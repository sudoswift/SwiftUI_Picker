//
//  ContentView.swift
//  Picker_SwiftUI
//
//  Created by izvern on 2021/05/28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectionValue = 0
    
    let myColorArray = ["레드","그린","블루"]
    
    //Swift에서 func 사용법
    //func 함수명(파라미터: 파라미터의 타입(Int,String,Bool ...)) -> 반환할 타입{}
    func changeColor(index: Int) -> Color{
        //switch 문을 사용해 index가 0일 경우 red... 으로 설정해주고 default는 red로 설정해준다.
        switch index {
        case 0:
            return Color.red
        case 1:
            return Color.green
        case 2:
            return Color.blue
        default:
            return Color.red
        }
        
    }
    
    var body: some View {
        
        VStack(alignment: .center){
            
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(changeColor(index: selectionValue))
            
            Text("세그먼트 value : \(selectionValue)")
            Text("선택된 색 : \(myColorArray[selectionValue])")
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
