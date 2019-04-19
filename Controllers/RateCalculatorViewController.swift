
import UIKit

class RateCalculatorViewController: UIViewController, UITextFieldDelegate {
    public var currency: Currency?{
        didSet{
            onCurrencyUpdated()
            
        }
    }
    
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var sourceTextField: UITextField!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var destinationTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sourceLabel.text = "🇧🇾"
        destinationLabel.text = nil
        sourceTextField.delegate = self
        destinationTextField.delegate = self
        title = "Calculator"
    }
    private func onCurrencyUpdated(){
        guard let currency = currency else{
            return
        }
        destinationLabel.text = Flag.flagByCurrencyAbbreviation(currency.abbr)
        sourceTextField.text = "1.0"
        updateDestignationValue(sourceValueString: "1.0")//Передаем по умолчанию
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == destinationTextField{
            if let initialText = textField.text{
                let sourceText = (initialText as NSString).replacingCharacters(in: range, with: string)
                updateSourceValue(destinationValueString: sourceText)
            }
        }
        if textField == sourceTextField{
            if let initialText = textField.text{
                let sourceText = (initialText as NSString).replacingCharacters(in: range, with: string)
                updateDestignationValue(sourceValueString: sourceText)
            }
        }
        return true
    }
    
    private func updateSourceValue(destinationValueString: String){
        if let destinationValue = Double(destinationValueString), let currency = currency{
            let sourceValue = destinationValue * currency.resultRate
            sourceTextField.text = String(format: "%.4f", sourceValue)
        }
    }
    
    private func updateDestignationValue(sourceValueString: String){
        if let sourceValue = Double(sourceValueString), let currency =  currency {
           let destinationValue = sourceValue / currency.resultRate
            destinationTextField.text = String(format: "%.4f", destinationValue)
        }
    }
}
