import Foundation

@propertyWrapper
public struct Inject<T> {
    
    public let id: Identifier
    
    public let defaultValue: T?
    
    public var wrappedValue: T? {
        set {
            self.projectedValue?[self.id] = newValue
        }
        get {
            if let projectedValue {
                if let value: T = projectedValue[self.id] {
                    return value
                }
                
                let value = Container.shared.resolve(self.type, name: self.name) ?? self.defaultValue
                
                projectedValue[self.id] = value
                
                return value
            } else {
                return Container.shared.resolve(self.type, name: self.name) ?? self.defaultValue
            }
        }
    }
    
    public var projectedValue: Context? {
        willSet {
            guard let projectedValue else {
                return
            }
            projectedValue.removeValue(forKey: self.id)
        }
    }
    
    public let type: T.Type
    
    public let name: String?
    
    public init(wrappedValue defaultValue: T? = nil, type: T.Type = T.self, name: String? = nil, context: Context? = nil) {
        self.id = Identifier(type: type, name: name)
        self.defaultValue = defaultValue
        self.type = type
        self.name = name
        self.projectedValue = context
    }
}
