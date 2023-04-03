import Foundation

public struct Repository {
    
    public var id: Int
    
    public var owner: String?
    
    public var name: String
    
    public var description: String?
    
    public var stargazersCount: Int
    
    public var starredAt: String?
    
    public var starredURL: String?
    
    public var stargazersURL: String
    
    public init(
        id: Int,
        owner: String? = nil,
        name: String,
        description: String? = nil,
        stargazersCount: Int,
        starredAt: String? = nil,
        starredURL: String? = nil,
        stargazersURL: String
    ) {
        self.id = id
        self.owner = owner
        self.name = name
        self.description = description
        self.stargazersCount = stargazersCount
        self.starredAt = starredAt
        self.starredURL = starredURL
        self.stargazersURL = stargazersURL
    }
}
