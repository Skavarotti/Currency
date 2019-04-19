

import UIKit

class RatesTableViewCell: UITableViewCell {
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var abbrLabel: UILabel!
    @IBOutlet weak var scaleNameLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func updateWithCurreency(_ currency: Currency) {
        
        abbrLabel.text = currency.abbr
        scaleNameLabel.text = "\(currency.scale) \(currency.name)"
        rateLabel.text = "\(currency.rate)"
        flagLabel.text = Flag.flagByCurrencyAbbreviation(currency.abbr)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()//super вызов родительского метода
        flagLabel.text = nil//Удаляем значения при перезаписи строки
        abbrLabel.text = nil
        scaleNameLabel.text = nil
        rateLabel.text = nil
    }
    
}
