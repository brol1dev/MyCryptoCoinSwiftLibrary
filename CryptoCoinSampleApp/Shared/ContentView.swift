import SwiftUI
import MyCryptoCoinSwiftLibrary

struct ContentView: View {
    let coinRetriever = CoinRetriever(apiKey: "YOUR API KEY")
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
