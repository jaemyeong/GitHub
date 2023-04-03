import UIKit
import OAuthSwift

public final class AuthorizationSceneDelegate {
    
    public init() {}
    
    public func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        
        guard url.scheme == "github" else {
            return
        }
        
        if #unavailable(iOS 16.0) {
            if url.host == "signin" {
                OAuthSwift.handle(url: url)
            }
        } else {
            if url.host(percentEncoded: false) == "signin" {
                OAuthSwift.handle(url: url)
            }
        }
    }
}
