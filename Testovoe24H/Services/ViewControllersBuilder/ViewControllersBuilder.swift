import UIKit

class ViewControllerBuilder: ViewControllerBuilderProtocol {
    func buildImageListController() -> ImageListViewController {
        let networkClient = NetworkClient(apiKey: Resources.API.unsplash)
        let imageListViewModel = ImageListViewModel(networkClient: networkClient)
        let imageListViewController = ImageListViewController(imageListViewModel: imageListViewModel)
        return imageListViewController
    }
}
