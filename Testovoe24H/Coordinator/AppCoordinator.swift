import UIKit

final class AppCoordinator: AppCoordinatorProtocol {
    
    // MARK: - Constants and Variables:
    private let navigationController: UINavigationController
    
    // MARK: - LifeCycle:
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public Methods:
    func start() {
        navigationController.pushViewController(ViewController(), animated: true)
    }
}
