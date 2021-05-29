//
//  ContentView.swift
//  Picker_SwiftUI
//
//  Created by izvern on 2021/05/28.
//

import SwiftUI

enum School: String, CaseIterable {
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
}

struct MyFried: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var school: School
}

struct ContentView: View {
    
    @State private var filteredValue = School.elementary
    
    @State private var myFriendsList = [MyFried]()
    //생성자(init) 메서드
    init() {
        var newList = [MyFried]()
        for i in 0...20 {
            let newFriend = MyFried(name: "내 친구 \(i)", school: School.allCases.randomElement()!)
            newList.append(newFriend)
        }
        _myFriendsList = State(initialValue: newList)
    }
    
    var body: some View {
        VStack{
            Text("선택된 필터 : \(filteredValue.rawValue)")
            Picker("", selection: $filteredValue, content: {
                Text("초등학교").tag(School.elementary)
                Text("중학교").tag(School.middle)
                Text("고등학교").tag(School.high)
            })
            .padding(.horizontal, 50.0)
            .pickerStyle(SegmentedPickerStyle())
            
            List{
                ForEach(myFriendsList.filter{
                    $0.school == filteredValue
                }){ friendItem in
                GeometryReader{ GeometryProxy in
                    HStack {
                        Text("name: \(friendItem.name)")
                            .frame(width: GeometryProxy.size.width / 3)
                        Divider()
                        Text("school: \(friendItem.school.rawValue)")
                            .frame(width: GeometryProxy.size.width / 2)
                    }
                } // Geometry
                }
            }
            
//            List{
//                ForEach(myFriendsList, id: \.self){ friendItem in
//                    GeometryReader{ GeometryProxy in
//                        HStack {
//                            Text("name: \(friendItem.name)")
//                                .frame(width: GeometryProxy.size.width / 3)
//                            Divider()
//                            Text("school: \(friendItem.school.rawValue)")
//                                .frame(width: GeometryProxy.size.width / 2)
//                        }
//                    } // Geometry
//                } // ForEach
//            } //List
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
