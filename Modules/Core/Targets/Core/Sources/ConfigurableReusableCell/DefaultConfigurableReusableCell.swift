import UIKit

public final class DefaultConfigurableReusableCell: ConfigurableReusableCell {
    
    public static func == (lhs: DefaultConfigurableReusableCell, rhs: DefaultConfigurableReusableCell) -> Bool {
        lhs.id == rhs.id
    }
    
    public init() {}
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    public func configure(cell: UICollectionViewCell) {}
}
