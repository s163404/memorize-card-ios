//
//  ContentView.swift
//  MemorizeCard
//
//  Created by コウスケ on 2022/09/03.
//

import SwiftUI
import CoreData

// TODO: ContentView.swiftは削除すること
struct ContentView: View {
    // 被管理オブジェクトコンテキスト(ManagedObjectContext)の取得
    @Environment(\.managedObjectContext) private var viewContext

    // データ取得処理
    @FetchRequest(
        entity: Task.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.timestamp, ascending: true)],
        predicate: nil,
        animation: nil
    ) private var tasks: FetchedResults<Task>
    
    var body: some View {
        NavigationView {
            // 取得したデータリストを表示
            List {
                ForEach(tasks) { task in
                    // タスクの表示
                    HStack {
                        Image(systemName: task.checked ? "checkmark.circle.fill" : "circle")
                        Text("\(task.name!)")
                        Spacer()
                    }
                    
                    // タスクをタップでcheckdフラグを変更する
                    .contentShape(Rectangle())
                    .onTapGesture {
                        task.checked.toggle()
                        try? viewContext.save()
                    }
                }
                .onDelete(perform: deleteTasks)
            }
            .navigationTitle("Todoリスト")
            // ツールバーの設定
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddTaskView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    // タスクの削除
    // - Patameter offsets: 要素番号のコレクション
    func deleteTasks(offsets: IndexSet) {
        for index in offsets {
            viewContext.delete(tasks[index])
        }
        try? viewContext.save()
    }
}

// タスク追加View
struct AddTaskView: View {
    @Environment(\.managedObjectContext) private var context
    @Environment(\.presentationMode) var presentationMode
    @State var task = ""
    
    var body: some View {
        Form {
            Section() {
                TextField("タスクを入力", text: $task)
            }
        }
        .navigationTitle("タスク追加")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("保存") {
                    // タスク新規登録処理
                    let newTask = Task.create(
                        context: context,
                        timestamp: Date(),
                        checked: false,
                        name: task
                    )
                    
                    try? context.save()
                    
                    // 現在のViewを閉じる
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}


extension Task {
    // taskインスタンスを生成して属性値の初期値を設定する
    class func create(context: NSManagedObjectContext, timestamp: Date, checked: Bool, name: String) -> Task {
        let newTask = Task(context: context)
        newTask.timestamp = timestamp
        newTask.checked = checked
        newTask.name = name
        return newTask
    }
}
