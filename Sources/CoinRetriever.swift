import Alamofire

public struct CoinRetriever {
    private var apiKey: String;
    
    public init(apiKey: String) {
        self.apiKey = apiKey;
    }
    
    public func latestPrice(coins: [String]) -> String {
        let headers: HTTPHeaders = [
            "X-CMC_PRO_API_KEY": apiKey,
            "Accept": "application/json",
            "Accept-Encoding": "deflate, gzip"
        ]
        let parameters: Parameters = ["symbol": coins.joined(separator: ",")]
        debugPrint(parameters)
//        https://pro-api.coinmarketcap.com
//        sandbox-api.coinmarketcap.com
        AF.request("https://sandbox-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest", parameters: parameters, headers: headers).responseDecodable(of: Coins.self) { response in
            debugPrint(response)
            guard let coins = response.value else { return }
            debugPrint("after: \(coins)")
        }
        return "10"
    }
}
