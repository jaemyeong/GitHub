import UIKit

public final class SceneDelegate: UIResponder {
    
    public var window: UIWindow?
}

extension SceneDelegate: UIWindowSceneDelegate {
    
    public func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        assert(scene is UIWindowScene)
        let windowScene = scene as! UIWindowScene
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
    }
}
