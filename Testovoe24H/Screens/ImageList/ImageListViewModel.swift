import Foundation

final class ImageListViewModel: ImageListViewModelProtocol {
    
    // MARK: - Dependencies:
    private let networkClient: NetworkClientProtocol
    private var pageForFetch = 1
    
    // MARK: - Observables:
    var observablePhotos: Observable<PhotosModel> {
        $photos
    }
    
    @Observable
    private var photos: PhotosModel = []
    
    var observableErrorDescription: Observable<String?> {
        $errorDescription
    }
    
    @Observable
    private(set) var errorDescription: String?
    
    // MARK: - Lifecycle:
    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
        fetch()
    }
    
    // MARK: - Public Functions:
    func fetch() {
        networkClient.fetchGreeting(page: pageForFetch) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let result):
                self.photos.append(contentsOf: result)
                pageForFetch += 1
            case .failure(let error):
                self.errorDescription = error.toString()
            }
        }
    }
}
