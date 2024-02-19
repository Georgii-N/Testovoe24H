import UIKit

class ViewControllerBuilder: ViewControllerBuilderProtocol {
    
    // MARK: - Dependencies:
    weak var coordinator: AppCoordinator?
    
    // MARK: - Public Functions:
    func buildImageListController() -> ImageListViewController {
        let networkClient = NetworkClient(apiKey: Resources.API.unsplash)
        let imageListViewModel = ImageListViewModel(networkClient: networkClient)
        let imageListViewController = ImageListViewController(coordinator: coordinator, imageListViewModel: imageListViewModel)
        return imageListViewController
    }
    
    func buildSingleImageListController(photo: SingleImageModel) -> SingleImageViewController {
        let singleImageViewModel = SingleImageViewModel(photo: photo)
        let singleImageViewController = SingleImageViewController(coordinator: coordinator, singleImageViewModel: singleImageViewModel)
        return singleImageViewController
    }
}
