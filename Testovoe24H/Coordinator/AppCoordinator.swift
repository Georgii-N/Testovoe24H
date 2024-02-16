import UIKit

final class AppCoordinator: AppCoordinatorProtocol {
    
    // MARK: - Constants and Variables:
    private let navigationController: UINavigationController
    private let viewControllerBuilder: ViewControllerBuilderProtocol
    
    // MARK: - LifeCycle:
    init(navigationController: UINavigationController, viewControllerBuilder: ViewControllerBuilderProtocol) {
        self.navigationController = navigationController
        self.viewControllerBuilder = viewControllerBuilder
    }
    
    // MARK: - Public Methods:
    func start() {
        let imageListViewController = viewControllerBuilder.buildImageListController()
        navigationController.pushViewController(imageListViewController, animated: true)
    }
}
