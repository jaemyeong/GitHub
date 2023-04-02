import Foundation

public struct Resolver: Hashable {
    
    public static func == (lhs: Resolver, rhs: Resolver) -> Bool {
        lhs.id == rhs.id
    }
    
    public let id: Identifier
    
    public let type: Any
    
    public let name: String?
    
    public let initializer: (Container) -> Any
    
    public init<T>(type: T.Type, name: String?, initializer: @escaping (Container) -> T) {
        self.id = Identifier(type: type, name: name)
        self.type = type
        self.name = name
        self.initializer = initializer
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
