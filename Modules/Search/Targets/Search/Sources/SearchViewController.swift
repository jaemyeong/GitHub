import UIKit
import ErrorKit
import Core
import RxSwift
import RxCocoa
import RxDataSources
import Collections

public final class SearchViewController: ViewController<SearchView, SearchViewModel> {
    
    public override init(viewModel: SearchViewModel) {
        super.init(viewModel: viewModel)
        
        self.title = NSLocalizedString("검색", bundle: .module, comment: "검색")
        self.definesPresentationContext = true
        
        if let tabBarItem {
            tabBarItem.image = UIImage(systemName: "magnifyingglass")
        }
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        
        let searchBar = searchController.searchBar
        searchBar.delegate = self
        
        let navigationItem = self.navigationItem
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                title: NSLocalizedString("로그인", bundle: .module, comment: "로그인"),
                style: .plain,
                target: self, action: #selector(Self.signInButtonTapped(_:))
            ),
        ]
        
        let dataSource = RxCollectionViewSectionedAnimatedDataSource<AnimatableSectionModel<SearchViewSection, SearchViewItem>> { dataSource, collectionView, indexPath, item in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.reuseIdentifier, for: indexPath)
                
                item.configure(cell: cell)
                
                return cell
            } configureSupplementaryView: { dataSource, collectionView, elementKind, indexPath in
                let section = dataSource.sectionModels[indexPath.section].model
                
                let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: section.reuseIdentifier, for: indexPath)
                
                section.configure(supplementaryView: supplementaryView)
                
                return supplementaryView
            }
        
        
        self.viewModel
            .$items
            .withUnretained(self)
            .do { (object, element) in
                logger.info("\(element)")
                
                if element.values.allSatisfy(\.isEmpty) {
                    object.contentView.collectionView.collectionViewLayout = UICollectionViewLayout()
                    object.contentView.isEmpty = true
                } else {
                    object.contentView.collectionView.collectionViewLayout = object.buildCollectionViewLayout(items: element)
                    object.contentView.isEmpty = false
                }
            }
            .map { object, element in
                element.map(AnimatableSectionModel.init(model:items:))
            }
            .bind(to: self.contentView.collectionView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)
        
        self.contentView.collectionView.delegate = self
        self.contentView.collectionView.prefetchDataSource = self
        
        self.contentView.refreshControl.addTarget(self, action: #selector(Self.refreshControlValueChanged(_:)), for: .valueChanged)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.onWillAppear()
    }
}

extension SearchViewController {
    
    private func buildCollectionViewLayout(items: OrderedDictionary<SearchViewSection, [SearchViewItem]>) -> UICollectionViewLayout {
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { sectionIndex, layoutEnvironment in
            let section = items.elements[sectionIndex].key
            
            return section.collectionLayoutSection(layoutEnvironment: layoutEnvironment)
        }
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        
        let collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: configuration)
        
        return collectionViewLayout
    }
}

extension SearchViewController {
    
    @objc
    private func signInButtonTapped(_ sender: UIBarButtonItem) {
        @Inject(name: "SignInViewController")
        var rootViewController: UIViewController?
        
        guard let rootViewController else {
            return
        }
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        self.present(navigationController, animated: true)
    }
    
    @objc
    private func refreshControlValueChanged(_ sender: UIRefreshControl) {
        self.viewModel.onRefresh {
            sender.endRefreshing()
        }
    }
}

extension SearchViewController: UICollectionViewDelegate {
    
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
}

extension SearchViewController: UICollectionViewDataSourcePrefetching {
    
    public func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
    }
}

extension SearchViewController: UISearchResultsUpdating {
    
    public func updateSearchResults(for searchController: UISearchController) {
        logger.info("\(#function) { searchController: \(searchController), text: \(searchController.searchBar.text ?? "") }")
        
        // FIXME: 쓰로틀 걸어야 함
        // self.viewModel.onSearch(term: searchController.searchBar.text ?? "")
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        logger.info("\(#function) { searchBar: \(searchBar), text: \(searchBar.text ?? "") }")
        
        self.viewModel.onSearch(term: searchBar.text ?? "")
    }
}
