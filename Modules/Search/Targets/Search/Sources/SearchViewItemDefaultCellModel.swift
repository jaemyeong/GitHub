import UIKit
import Core

public final class SearchViewItemDefaultCellModel: ConfigurableReusableCell, Equatable, Hashable {
    
    public var identity: Int {
        self.id
    }
    
    public static func == (lhs: SearchViewItemDefaultCellModel, rhs: SearchViewItemDefaultCellModel) -> Bool {
        lhs.id == rhs.id &&
        lhs.owner == rhs.owner &&
        lhs.name == rhs.name &&
        lhs.description == rhs.description &&
        lhs.stargazersCount == rhs.stargazersCount &&
        lhs.isStarred == rhs.isStarred
    }
    
    public var id: Int
    
    public var owner: String?
    
    public var name: String
    
    public var description: String?
    
    public var stargazersCount: Int
    
    @Relay
    public var isStarred: Bool
    
    @Inject(context: .shared)
    public var searchController: SearchControllerProtocol?
    
    public init(repository: Repository) {
        logger.info("repository { \(repository) }")
        
        self.id = repository.id
        self.owner = repository.owner
        self.name = repository.name
        self.description = repository.description
        self.stargazersCount = repository.stargazersCount
        self.isStarred = false
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.owner)
        hasher.combine(self.name)
        hasher.combine(self.description)
        hasher.combine(self.stargazersCount)
        hasher.combine(self.isStarred)
    }
    
    public func configure(cell: UICollectionViewCell) {
        guard let cell = cell as? SearchViewItemDefaultCell else {
            return
        }
        cell.viewModel = self
        
        guard let searchController else {
            return
        }
        
        guard let owner else {
            return
        }
        
        searchController.isStarred(owner: owner, repository: self.name) { result in
            switch result {
            case .success:
                self.isStarred = true
            case .failure(let error):
                logger.info("\(error)")
                self.isStarred = false
            }
        }
    }
}
