import Foundation

public struct Match: Codable, Hashable {
    
    enum CodingKeys: String, CodingKey {
        case indices = "indices"
        case text = "text"
    }
    
    public var indices: [Int]?
    
    public var text: String?

    public init(indices: [Int]?, text: String?) {
        self.indices = indices
        self.text = text
    }
}
