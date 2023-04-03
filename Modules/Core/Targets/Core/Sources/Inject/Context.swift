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
            if let object = self.storage[id] as? T {
                return object
            } else {
                let object = self.storage.first { key, value in
                    guard value is T || value is T.Type else {
                        return false
                    }
                    
                    guard key.name == id.name else {
                        return false
                    }
                    
                    return true
                }
                
                return object?.value as? T
            }
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
