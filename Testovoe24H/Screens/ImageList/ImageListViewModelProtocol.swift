import Foundation

protocol ImageListViewModelProtocol {
    var observablePhotos: Observable<PhotosModel> { get }
    var observableErrorDescription: Observable<String?> { get }
    
    func fetch()
}
