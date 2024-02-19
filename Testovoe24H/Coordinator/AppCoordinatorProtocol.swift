import UIKit

protocol AppCoordinatorProtocol: AnyObject {
    func start()
    func goToSingleImageViewController(photo: SingleImageModel)
}
