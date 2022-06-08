import SwiftUI
import MyCryptoCoinSwiftLibrary

struct ContentView: View {
    // prod
//    let coinRetriever = CoinRetriever(apiKey: "0e3cd0cc-0e09-4693-9675-15a9d079ae68")
    // sandbox
    let coinRetriever = CoinRetriever(apiKey: "b54bcf4d-1bca-4e8e-9a24-22ff2c3d462c")
    @State var coins = [Coin]()
    
    var body: some View {
        if coins.isEmpty {
            Text("Loading").padding()
        }
        List(coins) { coin in
            VStack(alignment: .center) {
                Text("\(coin.name) price: \(coin.quote["USD"]!.price)")
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        let bitcoinSymbol = "BTC"
        coinRetriever.latestPrice(coins: [bitcoinSymbol]) { result in
            switch (result) {
            case .success(let coins):
                self.coins = coins.data[bitcoinSymbol]!
            case .failure(let error):
                print(error)
            }
        }
    }
}
