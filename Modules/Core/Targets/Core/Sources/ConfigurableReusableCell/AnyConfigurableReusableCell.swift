import UIKit

public final class AnyConfigurableReusableCell: ConfigurableReusableCell {
    
    public static var `default`: AnyConfigurableReusableCell {
        AnyConfigurableReusableCell()
    }
    
    public static func == (lhs: AnyConfigurableReusableCell, rhs: AnyConfigurableReusableCell) -> Bool {
        lhs.wrappedValue.id == rhs.wrappedValue.id
    }
    
    public let wrappedValue: any ConfigurableReusableCell
    
    public init(_ wrappedValue: any ConfigurableReusableCell = DefaultConfigurableReusableCell()) {
        self.wrappedValue = wrappedValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.wrappedValue.id)
    }
    
    public func configure(cell: UICollectionViewCell) {
        self.wrappedValue.configure(cell: cell)
    }
}
