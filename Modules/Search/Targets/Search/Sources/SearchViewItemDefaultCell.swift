import UIKit
import Core
import ErrorKit

public final class SearchViewItemDefaultCell: ReusableCell<SearchViewItemDefaultCellModel> {
    
    public override var viewModel: SearchViewItemDefaultCellModel? {
        didSet {
            guard let viewModel else {
                self.titleLabel.text = NSLocalizedString("", bundle: .module, comment: "")
                self.descriptionLabel.text = NSLocalizedString("", bundle: .module, comment: "")
                self.stargazersCountLabel.text = .localizedStringWithFormat(NSLocalizedString("%d", bundle: .module, comment: "%d"), 0)
                self.starImageView.image = UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(textStyle: .body))
                return
            }
            
            if let owner = viewModel.owner {
                self.titleLabel.text = .localizedStringWithFormat(NSLocalizedString("%@/%@", bundle: .module, comment: "%@/%@"), owner, viewModel.name)
            } else {
                self.titleLabel.text = .localizedStringWithFormat(NSLocalizedString("%@", bundle: .module, comment: "%@"), viewModel.name)
            }
            
            self.descriptionLabel.text = .localizedStringWithFormat(NSLocalizedString("%@", bundle: .module, comment: "%@"), viewModel.description ?? "")
            self.stargazersCountLabel.text = .localizedStringWithFormat(NSLocalizedString("%d", bundle: .module, comment: "%d"), viewModel.stargazersCount)
            
            viewModel
                .$isStarred
                .asDriver()
                .drive(with: self) { object, element in
                    object.starImageView.image = UIImage(systemName: element ? "star.fill" : "star", withConfiguration: UIImage.SymbolConfiguration(textStyle: .body))
                }
                .disposed(by: self.disposeBag)
        }
    }
    
    public let imageView: UIImageView
    
    public let titleLabel: UILabel
    
    public let descriptionLabel: UILabel
    
    public let stargazersImageView: UIImageView
    
    public let stargazersCountLabel: UILabel
    
    public let starImageView: UIImageView
    
    public override init(frame: CGRect) {
        self.imageView = UIImageView()
        self.titleLabel = UILabel()
        self.descriptionLabel = UILabel()
        self.stargazersImageView = UIImageView()
        self.stargazersCountLabel = UILabel()
        self.starImageView = UIImageView()
        
        super.init(frame: frame)
        
        self.configureViewHierarchies()
        self.configureLayoutConstraints()
        self.configureView()
        self.configureImageView()
        self.configureTitleLabel()
        self.configureDescriptionLabel()
        self.configureStargazersImageView()
        self.configureStargazersCountLabel()
        self.configureStarImageView()
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
}

extension SearchViewItemDefaultCell {
    
    private func configureViewHierarchies() {
        self.contentView.addSubview(self.imageView)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.descriptionLabel)
        self.contentView.addSubview(self.stargazersImageView)
        self.contentView.addSubview(self.stargazersCountLabel)
        self.contentView.addSubview(self.starImageView)
    }
    
    private func configureLayoutConstraints() {
        self.imageView.setContentHuggingPriority(.defaultLow + 11, for: .horizontal)
        self.imageView.setContentHuggingPriority(.defaultLow + 11, for: .vertical)
        self.imageView.setContentCompressionResistancePriority(.defaultHigh + 11, for: .horizontal)
        self.imageView.setContentCompressionResistancePriority(.defaultHigh + 11, for: .vertical)
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addConstraints([
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20.0),
            self.contentView.bottomAnchor.constraint(greaterThanOrEqualTo: self.imageView.bottomAnchor, constant: 8.0),
        ])
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addConstraints([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 8.0),
            self.starImageView.leadingAnchor.constraint(greaterThanOrEqualTo: self.titleLabel.trailingAnchor, constant: 8.0),
        ])
        
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addConstraints([
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8.0),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor, constant: 0.0),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.descriptionLabel.trailingAnchor, constant: 0.0),
        ])
        
        self.stargazersImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addConstraints([
            self.stargazersImageView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 8.0),
            self.stargazersImageView.leadingAnchor.constraint(equalTo: self.descriptionLabel.leadingAnchor, constant: 0.0),
            self.contentView.bottomAnchor.constraint(greaterThanOrEqualTo: self.stargazersImageView.bottomAnchor, constant: 8.0),
        ])
        
        self.stargazersCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addConstraints([
            self.stargazersCountLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 8.0),
            self.stargazersCountLabel.leadingAnchor.constraint(equalTo: self.stargazersImageView.trailingAnchor, constant: 8.0),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.stargazersCountLabel.trailingAnchor, constant: 8.0),
            self.contentView.bottomAnchor.constraint(greaterThanOrEqualTo: self.stargazersCountLabel.bottomAnchor, constant: 8.0),
        ])
        
        self.starImageView.setContentHuggingPriority(.defaultLow + 10, for: .horizontal)
        self.starImageView.setContentHuggingPriority(.defaultLow + 10, for: .vertical)
        self.starImageView.setContentCompressionResistancePriority(.defaultHigh + 10, for: .horizontal)
        self.starImageView.setContentCompressionResistancePriority(.defaultHigh + 10, for: .vertical)
        
        self.starImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addConstraints([
            self.starImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.starImageView.leadingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: 8.0),
            self.contentView.trailingAnchor.constraint(equalTo: self.starImageView.trailingAnchor, constant: 20.0),
            self.contentView.bottomAnchor.constraint(greaterThanOrEqualTo: self.starImageView.bottomAnchor, constant: 8.0),
        ])
    }
    
    private func configureView() {
        self.backgroundColor = .systemBackground
    }
    
    private func configureImageView() {
        self.imageView.image = UIImage(systemName: "book.closed")
    }
    
    private func configureTitleLabel() {
        self.titleLabel.numberOfLines = 0
        self.titleLabel.font = .preferredFont(forTextStyle: .headline)
        self.titleLabel.textColor = .link
    }
    
    private func configureDescriptionLabel() {
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = .preferredFont(forTextStyle: .footnote)
    }
    
    private func configureStargazersImageView() {
        self.stargazersImageView.image = UIImage(systemName: "star.fill", withConfiguration: UIImage.SymbolConfiguration(textStyle: .footnote))
        self.stargazersImageView.tintColor = .secondaryLabel
    }
    
    private func configureStargazersCountLabel() {
        self.stargazersCountLabel.text = .localizedStringWithFormat(NSLocalizedString("%d", bundle: .module, comment: "%d"), 0)
        self.stargazersCountLabel.font = .preferredFont(forTextStyle: .footnote)
        self.stargazersCountLabel.textColor = .secondaryLabel
        self.stargazersCountLabel.numberOfLines = 0
    }
    
    private func configureStarImageView() {
        self.starImageView.image = UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(textStyle: .body))
        self.starImageView.tintColor = .yellow
    }
}
