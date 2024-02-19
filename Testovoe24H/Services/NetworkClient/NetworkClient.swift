import Foundation

final class NetworkClient: NetworkClientProtocol {
    
    // MARK: - Constants and Variables:
    private var apiKey: String
    
    // MARK: - LifeCycle:
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    // MARK: - Public Methods:
    func fetchGreeting(page: Int, completion: @escaping (Result<PhotosModel, NetworkClientError>) -> Void) {
        guard var urlComponents = URLComponents(string: Resources.Urls.photos) else {
            print("Invalid urlComponents")
            return }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: apiKey),
            URLQueryItem(name: "page", value: String(page))
        ]
        
        guard let url = urlComponents.url else { 
            print("Invalid URL")
            return }
        
        var request = URLRequest(url: url)
        request.timeoutInterval = 10

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkClientError.urlSessionError))
                return
            }
            
            guard 200 ..< 300 ~= response.statusCode else {
                completion(.failure(NetworkClientError.httpStatusCode(response.statusCode)))
                return
            }
            
            if let error = error {
                completion(.failure(NetworkClientError.urlRequestError(error)))
                return
            }
            
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(PhotosModel.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(NetworkClientError.parsingError))
                }
            }
        }
        task.resume()
    }
}
