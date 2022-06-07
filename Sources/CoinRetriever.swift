import Alamofire


public struct CoinRetriever {
    private var apiKey: String;
    
    public init() {}
    
    public func setApiKey(key: String) {
        self.apiKey = key;
    }
    public func latestPrice(coin: String) -> String {
        let headers: HTTPHeaders = ["X-CMC_PRO_API_KEY": "b54bcf4d-1bca-4e8e-9a24-22ff2c3d462c"]
//        https://pro-api.coinmarketcap.com
        AF.request("https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/latest", headers: headers).response { response in
            debugPrint(response)
        }
        return "10"
    }
}
