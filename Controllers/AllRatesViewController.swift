

import UIKit

class AllRatesViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadRates()
        setupCalculatorController()
    }
    
    let ratesLoader: IReatsLoader = NBRatesLoader()
    var calculatorController: RateCalculatorViewController? = nil
    private var rates = [Currency]()
    
    private func setupCalculatorController(){
        if let splitController = splitViewController{
            let controller = splitController.viewControllers
            calculatorController = (controller[controller.count-1]) as? RateCalculatorViewController
        }
    }
    
    private func loadRates(){
        ratesLoader.loadReats{[weak self] (rates) in//Загрузка
            self?.rates = rates//Окончание загрузки
            DispatchQueue.main.async {//Вызов блока в главном потоке (недолжно быть сложных вычислений)
                let usdCode = 145
                if let usdIndex = self?.rates.firstIndex(where: {(currency) -> Bool in return currency.code == usdCode}) {//Поиск элемента по индексу
                    self?.calculatorController?.currency = self?.rates[usdIndex]
                }
                self?.tableView.reloadData()//Перезагрузка таблицы
            }
        }
    }
    
    private func setupTableView(){
        tableView.register(UINib(nibName: "RatesTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "RatesCell")
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatesCell", for: indexPath)
        if let rateCell = cell as? RatesTableViewCell{
            rateCell.updateWithCurreency(rates[indexPath.row])
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        calculatorController?.currency = rates[indexPath.row]
        if let splitController = splitViewController,
            let calculatorController = calculatorController{
            splitViewController?.showDetailViewController(calculatorController, sender: nil)
        }
    }
}
