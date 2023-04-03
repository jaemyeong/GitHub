import UIKit
import RxDataSources

public protocol ConfigurableReusableCell: AnyObject, Identifiable, Equatable, Hashable {
    
    func configure(cell: UICollectionViewCell)
}
