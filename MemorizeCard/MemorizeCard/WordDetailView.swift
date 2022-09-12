//
//  WordDetailView.swift
//  MemorizeCard
//
//  Created by コウスケ on 2022/09/03.
//

import SwiftUI


struct WordDetailView: View {
    var detail: String?
    var body: some View {
        VStack {
            Text(detail ?? "-")
        }
    }

}


struct WordDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WordDetailView()
    }
}

