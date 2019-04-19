
import Foundation

class NBRatesLoader: IReatsLoader {
    func loadReats(_ completion: @escaping ([Currency]) -> ()) {
        let urlString = "https://www.nbrb.by/API/ExRates/Rates?Periodicity=0"
        guard let url = URL(string: urlString) else{
            completion([])
            return
        }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard let dataResponce = data, error == nil else{
                print(error?.localizedDescription ?? "Response error")
                completion([])
                return
            }
            do{
                if let jsonResponce = try JSONSerialization.jsonObject(with: dataResponce, options: []) as? NSArray{
                    var results = [Currency]()
                    for oneDict in jsonResponce{
                        if let dictionary = oneDict as? NSDictionary{
                            let oneCurrency = Currency(dictionary: dictionary)
                            if oneCurrency.code != 299{
                            results.append(oneCurrency)
                            }
                        }
                    }
                    completion(results)
                }
                else{
                    completion([])
                }
            }
            catch let parsingError{
                print ("Passing error : \(parsingError.localizedDescription)")
            }
        }.resume()
    }
}
