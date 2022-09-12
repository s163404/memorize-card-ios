//
//  Word+Extension.swift
//  MemorizeCard
//
//  Created by コウスケ on 2022/09/12.
//

import CoreData
import Foundation


extension Word {
    // Wordインスタンスを生成して属性値の初期値を設定する
    class func create(context: NSManagedObjectContext, label: String, detail: String) -> Word {
        let newWord = Word(context: context)
        newWord.label = label
        newWord.detail = detail
        return newWord
    }
}
