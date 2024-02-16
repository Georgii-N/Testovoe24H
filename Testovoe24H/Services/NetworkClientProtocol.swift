import Foundation

protocol NetworkClientProtocol {
    func fetchGreeting(completion: @escaping (Result<PhotosModel, Error>) -> Void)
}
