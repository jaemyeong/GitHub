import Foundation

public struct SearchResponse: Codable, Hashable {
    
    enum CodingKeys: String, CodingKey {
        
        case incompleteResults = "incomplete_results"
        
        case items = "items"
        
        case totalCount = "total_count"
    }
    
    public var incompleteResults: Bool
    
    public var items: [RepoSearchResultItem]
    
    public var totalCount: Int

    public init(
        incompleteResults: Bool,
        items: [RepoSearchResultItem],
        totalCount: Int
    ) {
        self.incompleteResults = incompleteResults
        self.items = items
        self.totalCount = totalCount
    }
}
