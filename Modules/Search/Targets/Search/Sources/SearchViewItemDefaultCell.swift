import UIKit
import Core
import ErrorKit

public final class SearchViewItemDefaultCell: ReusableCell<SearchViewItemDefaultCellModel> {
    
    public let imageView: UIImageView
    
    public override init(frame: CGRect) {
        self.imageView = UIImageView()
        
        super.init(frame: frame)
        
        self.contentView.addSubview(self.imageView)
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addConstraints([
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20.0),
        ])
        
        self.backgroundColor = .systemBackground
        
        self.imageView.image = UIImage(systemName: "book.closed")
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
}
