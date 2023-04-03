import Foundation
import Moya
import RxMoya
import Core

public enum GitHubAPI: TargetType {
    
    case searchRepositories(term: String)
    
    case userRepositories(username: String)
    
    case user(username: String)
    
    case star(owner: String, repository: String)
    
    case unstar(owner: String, repository: String)
    
    case isStarred(owner: String, repository: String)
    
    public var baseURL: URL {
        URL(string: "https://api.github.com")!
    }
    
    public var path: String {
        switch self {
        case .searchRepositories:
            return "/search/repositories"
        case .userRepositories(let username):
            return "/users/\(username)/repos"
        case .user(let username):
            return "/users/\(username)"
        case .star(let owner, let repository):
            return "/user/starred/\(owner)/\(repository)"
        case .unstar(let owner, let repository):
            return "/user/starred/\(owner)/\(repository)"
        case .isStarred(let owner, let repository):
            return "/user/starred/\(owner)/\(repository)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .searchRepositories:
            return .get
        case .userRepositories:
            return .get
        case .user:
            return .get
        case .star:
            return .put
        case .unstar:
            return .delete
        case .isStarred:
            return .get
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .searchRepositories(let term):
            return .requestParameters(
                parameters: [
                    "q": term
                ],
                encoding: URLEncoding.default
            )
        case .userRepositories:
            return .requestPlain
        case .user:
            return .requestPlain
        case .star:
            return .requestPlain
        case .unstar:
            return .requestPlain
        case .isStarred:
            return .requestPlain
        }
    }
    
    public var headers: [String: String]? {
        @Inject(context: .shared)
        var gitHubAPIController: GitHubAPIControllerProtocol?
        
        if let accessToken = gitHubAPIController?.accessToken {
            return [
                "Accept": "application/vnd.github+json",
                "Authorization": "Bearer \(accessToken)",
                "X-GitHub-Api-Version": "2022-11-28",
            ]
        } else {
            return [
                "Accept": "application/vnd.github+json",
                "X-GitHub-Api-Version": "2022-11-28",
            ]
        }
    }
}
