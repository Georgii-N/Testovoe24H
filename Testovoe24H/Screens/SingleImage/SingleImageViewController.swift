import UIKit
import Kingfisher

final class SingleImageViewController: UIViewController {
    
    // MARK: - Dependencies:
    private let coordinator: AppCoordinatorProtocol?
    private let singleImageViewModel: SingleImageViewModelProtocol
    
    // MARK: - UI:
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Lifecycle:
    init(coordinator: AppCoordinatorProtocol?, singleImageViewModel: SingleImageViewModelProtocol) {
        self.coordinator = coordinator
        self.singleImageViewModel = singleImageViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupUI()
    }
}

// MARK: - Setup Views:
private extension SingleImageViewController {
    func setupViews() {
        view.addSubview(imageView, constraints: [
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupUI() {
        view.backgroundColor = Colors.backgroundBlack.color
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.captionRed.color]
        
        let photo = singleImageViewModel.getPhoto()
        
        let imageURL = URL(string: photo.imageUrl)
        imageView.kf.setImage(with: imageURL)
        
        title = photo.username
    }
}
