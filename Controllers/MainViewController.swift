
import UIKit

class MainViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        preferredDisplayMode = .allVisible
        delegate = self

        // Do any additional setup after loading the view.
    }
    public func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool{
        return true
    }
}
