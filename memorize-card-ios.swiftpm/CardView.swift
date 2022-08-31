import SwiftUI

// メインの画面
// 単語をひとつずつ表示する
// 操作する度に、"単語1"→"単語2の意味"→"単語2"→"単語2の意味"→... と表示が切り替わる
struct CardView: View {
    @State var content = garbageitems[0].name
    @State var detail = ""
    var body: some View {
        VStack {
            // 単語の表記
            Text(content)
                .frame(maxWidth: .infinity)
                .font(.title)
                .border(Color.blue)
                .padding(.vertical, 28)
                .padding(.horizontal, 16)
                .background(Color(uiColor: UIColor(red: 0.3, green: 0.7, blue: 0.7, alpha: 0.2)))
                .padding(.top, 100)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
            // 単語の意味
            Text(detail)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.title2)
                .border(Color.blue)
                .padding(.vertical, 28)
                .padding(.horizontal, 16)
                .background(Color(uiColor: UIColor(red: 0.3, green: 0.7, blue: 0.7, alpha: 0.2)))
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    detail = String(garbageitems[0].detail![0].name)  // detailはオプショナルの配列
                }
            // ボタンのコンテナ
            HStack {
                
                Button("Back", action: {})
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color.blue)
                Button("Next", action: {})
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color.blue)
            }
            .padding(24)
        }
        .frame(maxWidth: .infinity)
    }
}
