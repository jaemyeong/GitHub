import UIKit
import WebKit
import Core
import RxSwift
import RxRelay

public final class SignInViewModel {
    
    @Relay
    public var signInURL: URL?
    
    public let isFinished: PublishRelay<Result<Void, Error>>
    
    @Inject(context: .shared)
    public var signInController: SignInControllerProtocol?
    
    public init() {
        self.signInURL = nil
        self.isFinished = PublishRelay()
        
        if let signInController {
            signInController.urlHandler = { [weak self] url in
                guard let self else {
                    return
                }
                self.signInURL = url
            }
        }
    }
    
    public func onWillAppear() {
        guard let signInController else {
            return
        }
        
        signInController.signIn { [weak self] result in
            logger.info("\(result)")
            
            guard let self else {
                return
            }
            
            self.isFinished.accept(result)
        }
    }
}
