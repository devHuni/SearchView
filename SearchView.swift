//
//  SearchView.swift
//  BbakMemo
//
//  Created by 심범수 on 2022/05/07.
//

import SwiftUI
 
struct SearchView: View {
    let array = [
        "심훈", "후니", "훈", "짱구", "철수", "유리",
        "맹구", "기철", "기영", "아리", "예삐", "정대리",
        "아이폰", "스위프트", "포스텍", "아카데미", "SwiftUI"
    ]
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                List {
                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                        searchText in Text(searchText)
                    }
                } //리스트의 스타일 수정
                .listStyle(PlainListStyle())
                  //화면 터치시 키보드 숨김
                .onTapGesture {
                    hideKeyboard()
                }
            }
            .navigationBarTitle("검색기능")
        }
    }
}

//캔버스 컨텐츠뷰
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
 
 
//화면 터치시 키보드 숨김
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
