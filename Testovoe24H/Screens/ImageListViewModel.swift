import Foundation

final class ImageListViewModel: ImageListViewModelProtocol {
    
    // MARK: - Dependencies:
    private let networkClient: NetworkClientProtocol
    
    // MARK: - Observables:
    var observablePhotos: Observable<PhotosModel> {
        $photos
    }
    
    @Observable
    private var photos: PhotosModel = []
    
    // MARK: - Lifecycle:
    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func fetch() {
        networkClient.fetchGreeting { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
}
