import UIKit
import RxSwift
import Combine
import ErrorKit

open class ViewController<View: UIView, ViewModel: AnyObject>: UIViewController {
    
    public let viewModel: ViewModel
    
    public var subscriptions: Set<AnyCancellable>
    
    public var disposeBag: DisposeBag
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.subscriptions = []
        self.disposeBag = DisposeBag()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
    
    public var contentView: View {
        assert(self.view is View)
        return self.view as! View
    }
    
    public override func loadView() {
        self.view = View()
    }
}
