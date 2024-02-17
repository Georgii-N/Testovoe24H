import Foundation

protocol ImageListViewModelProtocol {
    var observablePhotos: Observable<PhotosModel> { get }
    
    func fetch()
}
