
import Foundation

struct Currency{
    let code: Int
    let scale: Int
    let rate: Double
    let name: String
    let abbr: String
    
    init (dictionary: NSDictionary){
        self.code = dictionary["Cur_ID"] as? Int ?? 0
        self.scale = dictionary["Cur_Scale"] as? Int ?? 0
        self.rate = dictionary["Cur_OfficialRate"] as? Double ?? 0
        self.name = dictionary["Cur_Name"] as? String ?? ""
        self.abbr = dictionary["Cur_Abbreviation"] as? String ?? ""
    }
    
    var resultRate: Double{
        return rate / Double(scale)
    }
}

