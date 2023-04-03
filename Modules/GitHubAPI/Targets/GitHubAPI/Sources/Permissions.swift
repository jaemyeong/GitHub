import Foundation

public struct Permissions: Codable, Hashable {
    
    enum CodingKeys: String, CodingKey {
        
        case admin = "admin"
        
        case maintain = "maintain"
        
        case pull = "pull"
        
        case push = "push"
        
        case triage = "triage"
    }
    
    public var admin: Bool
    
    public var maintain: Bool?
    
    public var pull: Bool
    
    public var push: Bool
    
    public var triage: Bool?

    public init(
        admin: Bool,
        maintain: Bool?,
        pull: Bool,
        push: Bool,
        triage: Bool?
    ) {
        self.admin = admin
        self.maintain = maintain
        self.pull = pull
        self.push = push
        self.triage = triage
    }
}
