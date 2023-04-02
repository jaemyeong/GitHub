import UIKit
import ErrorKit
import Core

public final class SearchViewController: UIViewController {
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.title = NSLocalizedString("검색", bundle: .module, comment: "검색")
        
        if let tabBarItem {
            tabBarItem.image = UIImage(systemName: "magnifyingglass")
        }
        
        let navigationItem = self.navigationItem
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                title: NSLocalizedString("로그인", bundle: .module, comment: "로그인"),
                style: .plain,
                target: self, action: #selector(Self.signInButtonTapped(_:))
            ),
        ]
        navigationItem.searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
    
    public override func loadView() {
        self.view = SearchView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
    }
}

extension SearchViewController {
    
    @objc
    private func signInButtonTapped(_ sender: UIBarButtonItem) {}
}
