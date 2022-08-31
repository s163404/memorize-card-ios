import SwiftUI

struct ContentView: View {
    private let maxWidth: CGFloat = 700
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.7)
    }
    var body: some View {
        TabView {
            CardView()
                .tabItem {
                    Image(systemName: "tray")
                    Text("Test")
                }
                .frame(maxWidth: maxWidth)
            WordListView()
                .tabItem {
                    Image(systemName: "hand.thumbsup")
                    Text("Words")
                }
                .frame(maxWidth: maxWidth)
        }
        
    }
}

var items: [String] = [
    "deduction",
    "controversal",
    "coincide",
    "anecdote",
    "fairy",
    "accommondation",
    "nationwide",
    "found",
    "spacious",
    "scenic",
    "culinary",
    "yujine",
    "occasion",
    "overwhelmingly",
    "spectacular"
]

// 試作でつかっただけのデータ
var garbageitems: [WordItem] = [
    WordItem(name: "Dahyun",
             detail: [WordItem(name: "ああああああああああああああああああああああああああああああ"), WordItem(name: "Kim"), WordItem(name: "Lead Rapper")]),
    WordItem(name: "Sana",
             detail: [WordItem(name: "1996/12/29"), WordItem(name: "Minatozaki"), WordItem(name: "Sub Vocal")]),
    WordItem(name: "Cheyoung", 
             detail: [WordItem(name: "1999/04/23"), WordItem(name: "Lead Rapper")]),
    WordItem(name: "deduction", 
             detail: [WordItem(name: "控除", detail: [WordItem(name: "名詞")])])
]
