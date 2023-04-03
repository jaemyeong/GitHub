import Foundation

public struct LicenseSimple: Codable, Hashable {
    
    enum CodingKeys: String, CodingKey {
        
        case htmlURL = "html_url"
        
        case key = "key"
        
        case name = "name"
        
        case nodeID = "node_id"
        
        case spdxID = "spdx_id"
        
        case url = "url"
    }
    
    public var htmlURL: String?
    
    public var key: String
    
    public var name: String
    
    public var nodeID: String
    
    public var spdxID: String?
    
    public var url: String?

    public init(
        htmlURL: String?,
        key: String,
        name: String,
        nodeID: String,
        spdxID: String?,
        url: String?
    ) {
        self.htmlURL = htmlURL
        self.key = key
        self.name = name
        self.nodeID = nodeID
        self.spdxID = spdxID
        self.url = url
    }
}
