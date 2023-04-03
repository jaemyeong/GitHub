import Foundation
import RxSwift
import RxRelay

@propertyWrapper
public struct Relay<T> {
    
    public var wrappedValue: T {
        get {
            self.projectedValue.value
        }
        set {
            self.projectedValue.accept(newValue)
        }
    }
    
    public let projectedValue: BehaviorRelay<T>
    
    public init(wrappedValue defaultValue: T) {
        self.projectedValue = BehaviorRelay(value: defaultValue)
    }
}
