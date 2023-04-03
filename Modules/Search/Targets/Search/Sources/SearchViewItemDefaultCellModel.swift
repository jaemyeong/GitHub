import UIKit
import Core

public final class SearchViewItemDefaultCellModel: ConfigurableReusableCell, Equatable, Hashable {
    
    public var identity: ObjectIdentifier {
        self.id
    }
    
    public static func == (lhs: SearchViewItemDefaultCellModel, rhs: SearchViewItemDefaultCellModel) -> Bool {
        lhs.id == rhs.id
    }
    
    public init(repository: Repository) {
        
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    public func configure(cell: UICollectionViewCell) {
        guard let cell = cell as? SearchViewItemDefaultCell else {
            return
        }
        cell.viewModel = self
    }
}
