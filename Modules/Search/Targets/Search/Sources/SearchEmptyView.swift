import UIKit
import ErrorKit

public final class SearchEmptyView: UIView {
    
    private let textLabel: UILabel
    
    public override init(frame: CGRect) {
        self.textLabel = UILabel()
        
        super.init(frame: frame)
        
        self.configureViewHierarchies()
        self.configureLayoutConstraints()
        self.configureView()
        self.configureTextLabel()
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
}

extension SearchEmptyView {
    
    private func configureViewHierarchies() {
        self.addSubview(self.textLabel)
    }
    
    private func configureLayoutConstraints() {
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.textLabel.centerXAnchor),
            self.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: self.textLabel.centerYAnchor),
            self.safeAreaLayoutGuide.widthAnchor.constraint(greaterThanOrEqualTo: self.textLabel.widthAnchor, constant: 40.0)
        ].map { layoutConstraint in
            layoutConstraint.priority = .defaultHigh + 1
            return layoutConstraint
        })
    }
    
    private func configureView() {
        self.backgroundColor = .systemBackground
    }
    
    private func configureTextLabel() {
        self.textLabel.text = NSLocalizedString("검색 내역이 없습니다.", bundle: .module, comment: "검색 내역이 없습니다.")
        self.textLabel.textColor = .secondaryLabel
        self.textLabel.textAlignment = .center
        self.textLabel.font = .preferredFont(forTextStyle: .headline)
        self.textLabel.numberOfLines = 0
    }
}
