import SwiftUI

// 単語一覧する画面
struct WordListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< items.count) { index in
                    NavigationLink(destination: WordDetailView(word: "意味")) {
                        Text(items[index])
                    }
                    .navigationTitle("一覧")
                }
            }
        }
    }
}
