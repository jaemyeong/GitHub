import UIKit
import ErrorKit

public final class SearchView: UIView {
    
    var isEmpty: Bool {
        didSet {
            self.collectionView.backgroundView = self.isEmpty
            ? SearchEmptyView()
            : nil
        }
    }
    
    public let collectionView: UICollectionView
    
    public let refreshControl: UIRefreshControl
    
    public override init(frame: CGRect) {
        self.isEmpty = true
        
        self.collectionView = UICollectionView(frame: frame, collectionViewLayout: UICollectionViewLayout())
        self.refreshControl = UIRefreshControl()
        
        super.init(frame: frame)
        
        self.addSubview(self.collectionView)
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
            self.trailingAnchor.constraint(equalTo: self.collectionView.trailingAnchor, constant: 0.0),
            self.bottomAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 0.0),
        ])
        
        self.backgroundColor = .systemBackground
        
        self.collectionView.backgroundColor = .systemBackground
        self.collectionView.backgroundView = SearchEmptyView()
        self.collectionView.refreshControl = self.refreshControl
        
        SearchViewSection.register(collectionView: self.collectionView)
        SearchViewItem.register(collectionView: self.collectionView)
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
}

