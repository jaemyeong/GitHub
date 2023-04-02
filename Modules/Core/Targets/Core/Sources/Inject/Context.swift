import Foundation

public final class Context: CustomStringConvertible {
    
    public static let shared: Context = Context()
    
    private var storage: [Identifier: Any]
    
    public init(storage: [Identifier: Any] = [:]) {
        self.storage = storage
    }
    
    public subscript<T>(id: Identifier) -> T? {
        set {
            self.storage[id] = newValue
        }
        get {
            self.storage[id] as? T
        }
    }
    
    @discardableResult
    public func updateValue<T>(_ value: T, forKey key: Identifier) -> T? {
        self.storage.updateValue(value, forKey: key) as? T
    }
    
    @discardableResult
    public func removeValue(forKey key: Identifier) -> Any? {
        self.storage.removeValue(forKey: key)
    }
    
    public var description: String {
        "\(type(of: self)) { storage: \(self.storage) })"
    }
}
