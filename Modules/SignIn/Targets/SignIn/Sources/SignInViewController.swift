import UIKit
import ErrorKit

public final class SignInViewController: UIViewController {
    
    public override func loadView() {
        self.view = SignInView()
    }
}
