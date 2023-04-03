import Foundation

public struct SearchResultTextMatch: Codable, Hashable {
    
    enum CodingKeys: String, CodingKey {
        
        case fragment = "fragment"
        
        case matches = "matches"
        
        case objectType = "object_type"
        
        case objectURL = "object_url"
        
        case property = "property"
    }
    
    public var fragment: String?
    
    public var matches: [Match]?
    
    public var objectType: String?
    
    public var objectURL: String?
    
    public var property: String?

    public init(
        fragment: String?,
        matches: [Match]?,
        objectType: String?,
        objectURL: String?,
        property: String?
    ) {
        self.fragment = fragment
        self.matches = matches
        self.objectType = objectType
        self.objectURL = objectURL
        self.property = property
    }
}
