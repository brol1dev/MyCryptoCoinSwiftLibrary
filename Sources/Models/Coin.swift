
public struct Coin: Decodable, Identifiable {
    public let id: Int
    public let name: String
    public let symbol: String
    public let quote: [String: Quote]
}
