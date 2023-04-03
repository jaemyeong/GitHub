import UIKit

public final class AnyConfigurableReusableSupplementary: ConfigurableReusableSupplementary {
    
    public static var `default`: AnyConfigurableReusableSupplementary {
        AnyConfigurableReusableSupplementary()
    }
    
    public static func == (lhs: AnyConfigurableReusableSupplementary, rhs: AnyConfigurableReusableSupplementary) -> Bool {
        lhs.wrappedValue.id == rhs.wrappedValue.id
    }
    
    public let wrappedValue: any ConfigurableReusableSupplementary
    
    public init(_ wrappedValue: any ConfigurableReusableSupplementary = DefaultConfigurableReusableSupplementary()) {
        self.wrappedValue = wrappedValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.wrappedValue.id)
    }
    
    public func configure(supplementaryView: UICollectionReusableView) {
        self.wrappedValue.configure(supplementaryView: supplementaryView)
    }
}
