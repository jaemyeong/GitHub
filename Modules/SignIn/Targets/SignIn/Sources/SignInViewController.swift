import UIKit
import Core
import WebKit
import RxSwift
import RxCocoa

public final class SignInViewController: UIViewController {
    
    public var contentView: SignInView {
        assert(self.view is SignInView)
        
        return self.view as! SignInView
    }
    
    public let viewModel: SignInViewModel = SignInViewModel()
    
    public override func loadView() {
        self.view = SignInView()
    }
    
    public var disposeBag: DisposeBag = DisposeBag()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationItem = self.navigationItem
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: NSLocalizedString("닫기", bundle: .module, comment: "닫기"), style: .plain, target: self, action: #selector(Self.closeButtonTapped(_:)))
        ]
        
        self.contentView.webView.navigationDelegate = self
        
        self.viewModel
            .$signInURL
            .compactMap { $0 }
            .asDriver(onErrorDriveWith: .empty())
            .drive(with: self) { object, element in
                let request = URLRequest(url: element, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60.0)
                
                object.contentView.webView.load(request)
            }
            .disposed(by: self.disposeBag)
        
        self.viewModel
            .isFinished
            .asDriver(onErrorDriveWith: .empty())
            .drive(with: self) { object, element in
                object.dismiss(animated: true)
            }
            .disposed(by: self.disposeBag)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.onWillAppear()
    }
}

extension SignInViewController {
    
    @objc
    private func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}

extension SignInViewController: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        logger.info("\(#function): { webView: \(webView), navigationAction: \(navigationAction) }")
        
        guard let url = navigationAction.request.url else {
            decisionHandler(.cancel)
            return
        }
        
        if let scheme = url.scheme, scheme != "github" {
            decisionHandler(.allow)
            return
        }
        
        guard UIApplication.shared.canOpenURL(url) else {
            decisionHandler(.cancel)
            return
        }
        
        UIApplication.shared.open(url, options: [:]) { success in
            decisionHandler(.cancel)
        }
    }
}
