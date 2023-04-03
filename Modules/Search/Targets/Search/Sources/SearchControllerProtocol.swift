import Foundation

public protocol SearchControllerProtocol: AnyObject {
    
    func search(term: String, completionHandler: @escaping (Result<[Repository], Error>) -> Void)
}
