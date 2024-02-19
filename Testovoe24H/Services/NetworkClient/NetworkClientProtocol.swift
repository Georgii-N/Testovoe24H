import Foundation

protocol NetworkClientProtocol {
    func fetchGreeting(page: Int, completion: @escaping (Result<PhotosModel, NetworkClientError>) -> Void)
}
