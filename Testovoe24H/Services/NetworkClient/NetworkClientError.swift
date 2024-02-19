import Foundation

enum NetworkClientError: Error {
    case httpStatusCode(Int)
    case urlRequestError(Error)
    case urlSessionError
    case parsingError
    
    // MARK: - Public Methods:
    func toString() -> String {
        switch self {
        case .httpStatusCode(let statusCode):
            switch statusCode {
            case 400:
                return L10n.NetworkError.StatusCode.badRequest
            case 401:
                return L10n.NetworkError.StatusCode.unauthorized
            case 403:
                return L10n.NetworkError.StatusCode.forbidden
            case 404:
                return L10n.NetworkError.StatusCode.notFound
            default:
                return  L10n.NetworkError.StatusCode.default
                
            }
        case .urlRequestError(let error):
            return L10n.NetworkError.urlRequest + error.localizedDescription
        case .urlSessionError:
            return L10n.NetworkError.urlSession
        case .parsingError:
            return L10n.NetworkError.parsing
        }
    }
}
