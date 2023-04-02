import Foundation
import Core
import Search
import Profile

public struct ContainerConfiguration {
    
    static func configure() {
        Container.shared.register(SearchViewController.self, name: String(describing: SearchViewController.self)) { container in
            SearchViewController()
        }
        
        Container.shared.register(ProfileViewController.self, name: String(describing: ProfileViewController.self)) { container in
            ProfileViewController()
        }
    }
}
