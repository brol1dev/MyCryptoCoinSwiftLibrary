import Alamofire

public struct CoinRetriever {
    private var apiKey: String;
    
    public init(apiKey: String) {
        self.apiKey = apiKey;
    }
    
    public func latestPrice(coin: String) -> String {
        let headers: HTTPHeaders = ["X-CMC_PRO_API_KEY": apiKey]
        let parameters: Parameters = ["symbol": "BTC"]
//        https://pro-api.coinmarketcap.com
        AF.request("https://sandbox-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest", parameters: parameters, headers: headers).response { response in
            debugPrint(response)
        }
        return "10"
    }
}
