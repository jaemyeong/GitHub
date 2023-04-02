import Foundation

public struct Identifier: Hashable {
    
    public let id: ObjectIdentifier
    
    public let name: String?
    
    public init<T>(type: T.Type, name: String?) {
        self.id = ObjectIdentifier(type)
        self.name = name
    }
}
