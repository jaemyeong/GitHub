import UIKit
import RxDataSources

public protocol ConfigurableReusableSupplementary: AnyObject, Identifiable, Equatable, Hashable {
    
    func configure(supplementaryView: UICollectionReusableView)
}
