import UIKit
import Core
import RxDataSources

public enum SearchViewSection: Equatable, Hashable {
    
    case `default`(viewModel: AnyConfigurableReusableSupplementary = .default)
    
    public static func register(collectionView: UICollectionView) {
        collectionView.register(SearchViewSectionDefaultReusableSupplementary.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: SearchViewSectionDefaultReusableSupplementary.self))
    }
    
    public var reuseIdentifier: String {
        switch self {
        case .default:
            return String(describing: SearchViewSectionDefaultReusableSupplementary.self)
        }
    }
    
    public func configure(supplementaryView: UICollectionReusableView) {
        switch self {
        case .default(let viewModel):
            viewModel.configure(supplementaryView: supplementaryView)
        }
    }
    
    public func collectionLayoutSection(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch self {
        case .default:
            let layoutItem = SearchViewItem.collectionLayoutItem(section: self, layoutEnvironment: layoutEnvironment)
            
            let groupLayoutSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(44.0)
            )
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupLayoutSize,
                subitems: [
                    layoutItem,
                ]
            )
            
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [
                NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .estimated(44.0)
                    ),
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
            ]
            
            return section
        }
    }
}

extension SearchViewSection: IdentifiableType {
    
    public var identity: some Hashable {
        self
    }
}
