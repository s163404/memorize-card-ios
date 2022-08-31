import SwiftUI


struct WordDetailView: View {
    var word: String?
    var body: some View {
        VStack {
            Text(word ?? " - ")
            Text("This is named Detail View")
        }
    }

}

