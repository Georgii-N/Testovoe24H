import Foundation

final class SingleImageViewModel: SingleImageViewModelProtocol {
    
    // MARK: - Constants and Variables:
    private var photo: SingleImageModel
    
    // MARK: - Lifecycle:
    init(photo: SingleImageModel) {
        self.photo = photo
    }
    
    // MARK: - Public Functions:
    func getPhoto() -> SingleImageModel {
        photo
    }
}
