import UIKit
import Core
import RxDataSources

public enum SearchViewItem: Equatable, Hashable {
    
    case `default`(viewModel: AnyConfigurableReusableCell = .default)
    
    public static func register(collectionView: UICollectionView) {
        collectionView.register(SearchViewItemDefaultCell.self, forCellWithReuseIdentifier: String(describing: SearchViewItemDefaultCell.self))
    }
    
    public var reuseIdentifier: String {
        switch self {
        case .default:
            return String(describing: SearchViewItemDefaultCell.self)
        }
    }
    
    public func configure(cell: UICollectionViewCell) {
        switch self {
        case .default(let viewModel):
            viewModel.configure(cell: cell)
        }
    }
    
    public static func collectionLayoutItem(section: SearchViewSection, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutItem {
        switch section {
        case .default:
            let layoutSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(44.0)
            )
            
            return NSCollectionLayoutItem(layoutSize: layoutSize)
        }
    }
}

extension SearchViewItem: IdentifiableType {
    
    public var identity: some Hashable {
        self
    }
}
