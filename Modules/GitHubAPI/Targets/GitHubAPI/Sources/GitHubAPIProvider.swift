import Foundation
import ErrorKit
import RxSwift
import Moya
import RxMoya

public final class GitHubAPIProvider {
    
    private static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        
        return decoder
    }()
    
    public static let shared: GitHubAPIProvider = GitHubAPIProvider()
    
    private let provider: MoyaProvider<GitHubAPI>
    
    public init(provider: MoyaProvider<GitHubAPI> = MoyaProvider()) {
        self.provider = provider
    }
    
    @discardableResult
    public func request<T: Decodable>(target: GitHubAPI, mappableType: T.Type, completionHandler: @escaping (Result<T, Swift.Error>) -> Void) -> Disposable {
        self.request(target: target, mappableType: mappableType)
            .subscribe { value in
                completionHandler(.success(value))
            } onFailure: { error in
                completionHandler(.failure(error))
            }
    }
    
    public func request<T: Decodable>(target: GitHubAPI, mappableType: T.Type) -> Single<T> {
        self.provider
            .rx
            .request(target)
            .map(mappableType, using: Self.decoder)
    }
    
    @discardableResult
    public func request(target: GitHubAPI, completionHandler: @escaping (Result<Any, Swift.Error>) -> Void) -> Disposable {
        self.request(target: target)
            .subscribe { value in
                completionHandler(.success(value))
            } onFailure: { error in
                completionHandler(.failure(error))
            }
    }
    
    public func request(target: GitHubAPI) -> Single<Any> {
        self.provider
            .rx
            .request(target)
            .mapJSON()
    }
    
    @discardableResult
    public func download(url: URL, completionHandler: @escaping (Result<URL, Swift.Error>) -> Void) -> Disposable {
        self.download(url: url).subscribe { url in
            completionHandler(.success(url))
        } onFailure: { error in
            completionHandler(.failure(error))
        }
    }
    
    public func download(url: URL) -> Single<URL> {
        Single.create { single in
            let request = URLRequest(url: url)
            
            let downloadTask = URLSession.shared.downloadTask(with: request) { url, response, error in
                if let error = error {
                    single(.failure(error))
                    return
                }
                
                guard let url = url else {
                    single(.failure(NilError()))
                    return
                }
                
                single(.success(url))
            }
            
            downloadTask.resume()
            
            return Disposables.create {
                downloadTask.cancel()
            }
        }
    }
}
