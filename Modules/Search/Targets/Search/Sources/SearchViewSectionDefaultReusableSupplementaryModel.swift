import UIKit
import Core

public final class SearchViewSectionDefaultReusableSupplementaryModel: ConfigurableReusableSupplementary, Equatable, Hashable {
    
    public var identity: ObjectIdentifier {
        self.id
    }
    
    public static func == (lhs: SearchViewSectionDefaultReusableSupplementaryModel, rhs: SearchViewSectionDefaultReusableSupplementaryModel) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    public func configure(supplementaryView: UICollectionReusableView) {}
}
