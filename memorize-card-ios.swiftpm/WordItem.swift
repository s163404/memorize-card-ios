
struct WordItem: Identifiable {
    let name: String
    var detail: [WordItem]? = nil
    var meaning = "意味"
    var id: String { name }
    var description: String {
        switch detail {
        case nil:
            return "📄 \(name)"
        default:
            return name
        }
    }
}
