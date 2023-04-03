import Foundation

public protocol SignInControllerProtocol: AnyObject {
    
    var urlHandler: ((URL) -> Void)? { get set }
    
    func signIn(completionHandler: @escaping (Result<Void, Error>) -> Void)
}
