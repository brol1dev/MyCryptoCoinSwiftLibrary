
struct Coin: Decodable {
    let name: String
    let symbol: String
    let quote: [String: Quote]
}
