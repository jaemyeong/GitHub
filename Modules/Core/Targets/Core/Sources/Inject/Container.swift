import Foundation

public class Container {
    
    public static let shared: Container = Container()
    
    private var registry: Set<Resolver> = []
    
    @discardableResult
    public func register<T>(_ type: T.Type, name: String? = nil, initializer: @escaping (Container) -> T) -> (registered: Bool, memberAfterRegister: Resolver) {
        let (inserted, memberAfterInsert) = self.registry.insert(Resolver(type: type, name: name, initializer: initializer))
        
        assert(inserted)
        
        return (inserted, memberAfterInsert)
    }
    
    @discardableResult
    public func register(_ resolver: Resolver) -> (registered: Bool, memberAfterRegister: Resolver) {
        let (inserted, memberAfterInsert) = self.registry.insert(resolver)
        
        assert(inserted)
        
        return (inserted, memberAfterInsert)
    }
    
    @discardableResult
    public func unregister<T>(_ type: T.Type, name: String?) -> Resolver? {
        let identifier = Identifier(type: type, name: name)
        
        func isEqualToIdentifier(_ resolver: Resolver) -> Bool {
            resolver.id == identifier
        }
        
        guard let index = self.registry.firstIndex(where: isEqualToIdentifier) else {
            return nil
        }
        
        return self.registry.remove(at: index)
    }
    
    @discardableResult
    public func unregister(_ resolver: Resolver) -> Resolver? {
        self.registry.remove(resolver)
    }
    
    public func resolve<T>(_ type: T.Type, name: String?) -> T? {
        let identifier = Identifier(type: type, name: name)
        
        func isEqualToIdentifier(_ resolver: Resolver) -> Bool {
            resolver.id == identifier
        }
        
        if let index = self.registry.firstIndex(where: isEqualToIdentifier) {
            let resolver = self.registry[index]
            
            return resolver.initializer(self) as? T
        } else {
            let resolver = self.registry.first { element in
                guard element.type is T || element.type is T.Type else {
                    return false
                }

                guard element.id.name == name else {
                    return false
                }

                return true
            }
            
            return resolver?.initializer(self) as? T
        }
    }
}
