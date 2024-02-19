import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController()
        let viewControllerBuilder = ViewControllerBuilder()
        
        let coordinator = AppCoordinator(navigationController: navigationController, viewControllerBuilder: viewControllerBuilder)
        
        viewControllerBuilder.coordinator = coordinator
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        coordinator.start()
        
        return true
    }
}
