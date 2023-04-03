import Foundation
import RxSwift
import RxRelay
import OAuthSwift
import ULID
import Core

public final class AuthorizationController: CustomStringConvertible {
    
    @Relay
    public var isAuthenticated: Bool
    
    @Relay
    public var credential: Credential? {
        didSet {
            self.isAuthenticated = self.credential != nil
        }
    }
    
    private let consumerKey: String
    
    private let consumerSecret: String
    
    private let oauthswift: OAuth2Swift
    
    public var authorizeURLHandler: (URL) -> Void {
        get {
            self.oauthswift.authorizeURLHandler.handle(_:)
        }
        set {
            class AuthorizeURLHandler: OAuthSwiftURLHandlerType {
                
                let urlHandler: (URL) -> Void
                
                init(urlHandler: @escaping (URL) -> Void) {
                    self.urlHandler = urlHandler
                }
                
                func handle(_ url: URL) {
                    self.urlHandler(url)
                }
            }
            
            self.oauthswift.authorizeURLHandler = AuthorizeURLHandler(urlHandler: newValue)
        }
    }
    
    public init(consumerKey: String? = nil, consumerSecret: String? = nil) {
        let consumerKey = consumerKey ?? Bundle.module.infoDictionary?["GITHUB_CONSUMER_KEY"] as? String ?? ""
        let consumerSecret = consumerSecret ?? Bundle.module.infoDictionary?["GITHUB_CONSUMER_SECRET"] as? String ?? ""
        
        self.oauthswift = OAuth2Swift(
            consumerKey: consumerKey,
            consumerSecret: consumerSecret,
            authorizeUrl: "https://github.com/login/oauth/authorize",
            accessTokenUrl: "https://github.com/login/oauth/access_token",
            responseType: "code",
            contentType: "application/json"
        )
        
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
        
        self.isAuthenticated = false
        self.credential = nil
    }
    
    public var description: String {
        "\(type(of: self)) { consumerKey: \(self.consumerKey), consumerSecret: \(self.consumerSecret) }"
    }
    
    public func authorize(completionHandler: @escaping (Result<Void, Error>) -> Void) {
        assert(!self.consumerKey.isEmpty)
        assert(!self.consumerSecret.isEmpty)
        
        self.oauthswift.authorize(withCallbackURL: "github://signin/oauth/callback",
                             scope: "repo",
                             state: ULID().ulidString) { [weak self] result in
            guard let self else {
                return
            }
            
            switch result {
            case .success(let value):
                let (credential, response, parameters) = value
                logger.info("credential: \(credential), response: \(String(describing: response)), parameters: \(parameters)")
                logger.info("credential { oauthToken: \(credential.oauthToken) }")
                
                self.credential = Credential(accessToken: credential.oauthToken)
                
                completionHandler(.success(Void()))
            case .failure(let error):
                logger.info("\(error)")
                
                completionHandler(.failure(error))
            }
        }
    }
    
    public func signOut() {
        
    }
}
