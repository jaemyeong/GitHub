import Foundation
import Core
import Authorization
import SignIn
import Search
import Profile

public struct ContainerConfiguration {
    
    static func configure() {
        Container.shared.register(SignInViewController.self, name: String(describing: SignInViewController.self)) { container in
            SignInViewController()
        }
        
        Container.shared.register(SearchViewController.self, name: String(describing: SearchViewController.self)) { container in
            SearchViewController()
        }
        
        Container.shared.register(ProfileViewController.self, name: String(describing: ProfileViewController.self)) { container in
            ProfileViewController()
        }
        
        Container.shared.register(SignInControllerProtocol.self) { container in
            AuthorizationController()
        }
        
        Container.shared.register(AuthorizationSceneDelegate.self) { container in
            AuthorizationSceneDelegate()
        }
    }
}

extension AuthorizationController: SignInControllerProtocol {
    
    public var urlHandler: ((URL) -> Void)? {
        get {
            self.authorizeURLHandler
        }
        set {
            guard let newValue else {
                return
            }
            self.authorizeURLHandler = newValue
        }
    }
    
    public func signIn(completionHandler: @escaping (Result<Void, Error>) -> Void) {
        self.authorize(completionHandler: completionHandler)
    }
}
