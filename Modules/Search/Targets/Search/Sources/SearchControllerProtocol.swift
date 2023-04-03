import Foundation

public protocol SearchControllerProtocol: AnyObject {
    
    func search(term: String, completionHandler: @escaping (Result<[Repository], Error>) -> Void)
    
    func isStarred(owner: String, repository: String, completionHandler: @escaping (Result<Void, Error>) -> Void)
}
