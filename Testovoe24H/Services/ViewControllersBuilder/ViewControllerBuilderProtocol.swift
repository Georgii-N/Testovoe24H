import Foundation

protocol ViewControllerBuilderProtocol: AnyObject {
    
    func buildImageListController() -> ImageListViewController
    func buildSingleImageListController(photo: SingleImageModel) -> SingleImageViewController
}
