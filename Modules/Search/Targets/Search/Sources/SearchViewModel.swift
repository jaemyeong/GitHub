import UIKit
import Collections
import Core

public final class SearchViewModel {
    
    @Relay
    public var items: OrderedDictionary<SearchViewSection, [SearchViewItem]>
    
    @Inject(context: .shared)
    public var searchController: SearchControllerProtocol?
    
    public init() {
        self.items = [:]
    }
    
    public func onRefresh(completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    public func onWillAppear() {}
    
    public func onSearch(term: String) {
        logger.info("\(term)")
        
        guard let searchController else {
            return
        }
        
        searchController.search(term: term) { [weak self] result in
            guard let self else {
                return
            }
            
            switch result {
            case .success(let value):
                logger.error("\(value)")
                
                self.items = [
                    .default(): value.map { .default(viewModel: AnyConfigurableReusableCell(SearchViewItemDefaultCellModel(repository: $0))) }
                ]
            case .failure(let error):
                logger.error("\(error)")
                
                self.items = [:]
            }
        }
    }
}
