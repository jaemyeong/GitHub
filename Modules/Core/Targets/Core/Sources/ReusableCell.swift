import UIKit
import Combine
import RxSwift
import ErrorKit

open class ReusableCell<ViewModel: AnyObject>: UICollectionViewCell {
    
    open var viewModel: ViewModel? {
        didSet {
            self.subscriptions = []
            self.disposeBag = DisposeBag()
        }
    }
    
    public var subscriptions: Set<AnyCancellable>
    
    public var disposeBag: DisposeBag
    
    public override init(frame: CGRect) {
        self.subscriptions = []
        self.disposeBag = DisposeBag()
        
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        
        self.viewModel = nil
    }
}
