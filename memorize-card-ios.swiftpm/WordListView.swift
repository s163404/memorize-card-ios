import SwiftUI

// 単語一覧する画面
struct WordListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< items.count) { index in
                    NavigationLink(destination: EmptyView()) {
                        Text(items[index])
                    }
                    .navigationTitle("一覧")
                }
            }
        }
    }
}
