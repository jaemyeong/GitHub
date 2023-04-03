import UIKit
import Core
import Search
import Profile
import Authorization

public final class SceneDelegate: UIResponder {
    
    public var window: UIWindow?
}

extension SceneDelegate: UIWindowSceneDelegate {
    
    public func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        assert(scene is UIWindowScene)
        let windowScene = scene as! UIWindowScene
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            self.buildSearchTabViewController(),
            self.buildProfileTabViewController(),
        ]
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    public func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        @Inject
        var authorizationSceneDelegate: AuthorizationSceneDelegate?
        
        if let authorizationSceneDelegate {
            authorizationSceneDelegate.scene(scene, openURLContexts: URLContexts)
        }
    }
}

extension SceneDelegate {
    
    private func buildSearchTabViewController() -> UIViewController {
        @Inject(name: String(describing: SearchViewController.self), context: .shared)
        var rootViewController: SearchViewController?
        
        guard let rootViewController else {
            fatalError()
        }
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        let navigationBar = navigationController.navigationBar
        navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
    
    private func buildProfileTabViewController() -> UIViewController {
        @Inject(name: String(describing: ProfileViewController.self), context: .shared)
        var rootViewController: ProfileViewController?
        
        guard let rootViewController else {
            fatalError()
        }
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        return navigationController
    }
}
