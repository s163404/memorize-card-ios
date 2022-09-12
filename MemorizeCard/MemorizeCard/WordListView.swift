//
//  WordListView.swift
//  MemorizeCard
//
//  Created by コウスケ on 2022/09/03.
//

import SwiftUI
import CoreData


struct WordListView: View {
    // 被管理オブジェクトコンテキストの取得
    @Environment(\.managedObjectContext) private var viewContext
    
    // データ取得
    @FetchRequest(
        entity: Word.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Word.label, ascending: true)],
        predicate: nil,
        animation: nil
    )
    private var words: FetchedResults<Word>
    
    var body: some View {
        NavigationView {
            // 取得したデータリストを表示
            List {
                ForEach(words) { word in
                    NavigationLink(destination: WordDetailView(detail: word.detail)) {
                        // 表記の表示
                        HStack {
                            Text(word.label ?? "-")
                            Spacer()
                        }
                    }
                }
                .onDelete(perform: deleteWords)
            }
            .navigationTitle("単語リスト")
            // ツールバーの設定
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddWordView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    // Wordの削除
    // - Patameter offsets: 要素番号のコレクション
    func deleteWords(offsets: IndexSet) {
        for index in offsets {
            viewContext.delete(words[index])
        }
        try? viewContext.save()
    }
}


struct WordListView_Previews: PreviewProvider {
    static var previews: some View {
        WordListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
