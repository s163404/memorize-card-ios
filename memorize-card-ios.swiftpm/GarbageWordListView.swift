import SwiftUI

struct GarbageWordListView: View {
    @State var new = ""
    var body: some View {
        VStack(spacing: 4) {
            VStack(spacing: 0) {
                HStack {
                    Text("Add new item")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                HStack {
                    TextField("Input new item", text: $new)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        let newItem = WordItem(name: new)
                        garbageitems.append(newItem)
                        new = ""
                    }) {
                        Text("Add")
                            .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 4.0)
            List(garbageitems, children: \.detail) {
                Text($0.description)
            }
            .listStyle(.insetGrouped)
        }
        
    }
}
