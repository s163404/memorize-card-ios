//
//  AddWordView.swift
//  MemorizeCard
//
//  Created by コウスケ on 2022/09/12.
//

import CoreData
import SwiftUI

struct AddWordView: View {
    @Environment(\.managedObjectContext) private var context
    @Environment(\.presentationMode) var presentationMode
    @State var label = ""
    @State var detail = ""
    
    var body: some View {
        Form {
            Section() {
                TextField("単語を入力", text: $label)
                TextField("意味を入力", text: $detail)
                
            }
        }
        .navigationTitle("単語を追加")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("保存") {
                    _ = Word.create(
                        context: context,
                        label: label,
                        detail: detail)
                    
                    try? context.save()
                    
                    // 現在のviewを閉じる
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct AddWordView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
