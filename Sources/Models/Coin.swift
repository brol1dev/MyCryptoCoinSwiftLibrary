
public struct Coin: Decodable {
    public let name: String
    public let symbol: String
    public let quote: [String: Quote]
}
