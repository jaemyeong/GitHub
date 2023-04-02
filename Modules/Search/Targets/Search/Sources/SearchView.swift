import UIKit
import ErrorKit

public final class SearchView: UIView {
    
    public let collectionView: UICollectionView
    
    public override init(frame: CGRect) {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        
        let collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            return nil
        }, configuration: configuration)
        
        self.collectionView = UICollectionView(frame: frame, collectionViewLayout: collectionViewLayout)
        
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
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
}

