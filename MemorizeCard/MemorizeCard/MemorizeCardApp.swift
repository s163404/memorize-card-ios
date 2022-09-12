//
//  MemorizeCardApp.swift
//  MemorizeCard
//
//  Created by コウスケ on 2022/09/03.
//

import SwiftUI

// アプリ起動時の実行内容を記述される
@main
struct MemorizeCardApp: App {
    // NSPersistentContainerの初期化を行う
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            WordListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            // 環境変数＠Environment(\.managedObjectContext)にNSManagedObjectContext（viewContext）を登録する
            // 環境変数に設定したことでアプリケーションの各viewで viewContextが使用可能になる。
        }
    }
}
