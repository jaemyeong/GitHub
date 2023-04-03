import UIKit

public final class DefaultConfigurableReusableSupplementary: ConfigurableReusableSupplementary {
    
    public static func == (lhs: DefaultConfigurableReusableSupplementary, rhs: DefaultConfigurableReusableSupplementary) -> Bool {
        lhs.id == rhs.id
    }
    
    public init() {}
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    public func configure(supplementaryView: UICollectionReusableView) {}
}
