import Foundation
import Core
import Authorization
import SignIn
import Search
import Profile
import GitHubAPI
import ErrorKit

public struct ContainerConfiguration {
    
    static func configure() {
        Container.shared.register(SignInViewModel.self) { container in
            SignInViewModel()
        }
        
        Container.shared.register(SignInViewController.self, name: String(describing: SignInViewController.self)) { container in
            @Inject
            var viewModel: SignInViewModel?
            
            guard let viewModel else {
                fatalError(String(describing: InstantiateError()))
            }
            
            return SignInViewController(viewModel: viewModel)
        }
        
        Container.shared.register(SearchViewModel.self) { container in
            SearchViewModel()
        }
        
        Container.shared.register(SearchViewController.self, name: String(describing: SearchViewController.self)) { container in
            @Inject
            var viewModel: SearchViewModel?
            
            guard let viewModel else {
                fatalError(String(describing: InstantiateError()))
            }
            
            return SearchViewController(viewModel: viewModel)
        }
        
        Container.shared.register(ProfileViewController.self, name: String(describing: ProfileViewController.self)) { container in
            ProfileViewController()
        }
        
        Container.shared.register(AuthorizationController.self) { container in
            AuthorizationController()
        }
        
        Container.shared.register(AuthorizationSceneDelegate.self) { container in
            AuthorizationSceneDelegate()
        }
        
        Container.shared.register(GitHubAPIProvider.self) { container in
            GitHubAPIProvider()
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
    
    public func signIn(completionHandler: @escaping (Result<Void, Swift.Error>) -> Void) {
        self.authorize(completionHandler: completionHandler)
    }
}

extension AuthorizationController: GitHubAPIControllerProtocol {
    
    public var accessToken: String? {
        self.credential?.accessToken
    }
}

extension GitHubAPIProvider: SearchControllerProtocol {
    
    public func search(term: String, completionHandler: @escaping (Result<[Repository], Swift.Error>) -> Void) {
        self.request(target: .searchRepositories(term: term)) { result in
            logger.info("\(result)")
        }
    }
}
