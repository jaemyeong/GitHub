import UIKit
import WebKit
import ErrorKit

public final class SignInView: UIView {
    
    public let webView: WKWebView
    
    public override init(frame: CGRect) {
        let configuration = WKWebViewConfiguration()
        
        self.webView = WKWebView(frame: frame, configuration: configuration)
        
        super.init(frame: frame)
        
        self.addSubview(self.webView)
        
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.webView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0),
            self.webView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
            self.trailingAnchor.constraint(equalTo: self.webView.trailingAnchor, constant: 0.0),
            self.bottomAnchor.constraint(equalTo: self.webView.bottomAnchor, constant: 0.0),
        ])
        
        self.backgroundColor = .systemBackground
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
}
