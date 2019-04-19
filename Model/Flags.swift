
import Foundation

class Flag{
    public class func flagByCurrencyAbbreviation(_ abbr: String) -> String?{
        switch abbr {
        case "AUD":
            return "🇦🇺"
        case "BGN":
            return "🇧🇬"
        case "UAH":
            return "🇺🇦"
        case "DKK":
            return "🇩🇰"
        case "USD":
            return "🇺🇸"
        case "EUR":
            return "🇪🇺"
        case "PLN":
            return "🇵🇱"
        case "IRR":
            return "🇮🇷"
        case "ISK":
            return "🇮🇸"
        case "JPY":
            return "🇯🇵"
        case "CAD":
            return "🇨🇦"
        case "CNY":
            return "🇨🇳"
        case "KWD":
            return "🇰🇼"
        case "MDL":
            return "🇲🇩"
        case "NZD":
            return "🇳🇿"
        case "NOK":
            return "🇳🇴"
        case "RUB":
            return "🇷🇺"
        case "XDR":
            return "🇻🇦"
        case "SGD":
            return "🇸🇬"
        case "KGS":
            return "🇰🇬"
        case "KZT":
            return "🇰🇿"
        case "TRY":
            return "🇹🇷"
        case "GBP":
            return "🇬🇧"
        case "CZK":
            return "🇨🇿"
        case "SEK":
            return "🇸🇪"
        case "CHF":
            return "🇨🇭"
            
            
            
            
            
        default:
            return nil
        }
    }
}
