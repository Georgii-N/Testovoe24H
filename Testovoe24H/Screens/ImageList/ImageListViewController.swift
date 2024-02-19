import UIKit

final class ImageListViewController: UIViewController {
    
    // MARK: - Dependencies:
    private let coordinator: AppCoordinatorProtocol?
    private let imageListViewModel: ImageListViewModelProtocol
    
    // MARK: - UI:
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.layoutMargins = UIEdgeInsets(top: 0, left: UIConstants.mediumInset, bottom: 0, right: -UIConstants.mediumInset)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageListCell.self)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = Colors.backgroundBlack.color
        return collectionView
    }()
    
    // MARK: - Lifecycle:
    init(coordinator: AppCoordinatorProtocol?, imageListViewModel: ImageListViewModelProtocol) {
        self.coordinator = coordinator
        self.imageListViewModel = imageListViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupUI()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Private Functions:
    private func bind() {
        imageListViewModel.observablePhotos.bind { [weak self] _ in
            guard let self else { return }
            collectionView.reloadData()
        }
        
        imageListViewModel.observableErrorDescription.bind { [weak self] errorDescription in
            guard
                let errorDescription,
                let self
            else { return }
            
            self.showAlert(error: errorDescription)
        }
    }
    
    private func showAlert(error: String) {
        let alertController = UIAlertController(title: L10n.Alert.Title.error,
                                                message: error,
                                                preferredStyle: .alert)
        
        let alertRepeatAction = UIAlertAction(title: L10n.Alert.Button.repeat, style: .default) { [weak self] _ in
            guard let self else { return }
            self.imageListViewModel.fetch()
        }
        
        let alertCancelAction =  UIAlertAction(title: L10n.Alert.Button.cancel, style: .destructive) { _ in
            alertController.dismiss(animated: true)
        }
        
        alertController.addAction(alertCancelAction)
        alertController.addAction(alertRepeatAction)
        present(alertController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource:
extension ImageListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageListViewModel.observablePhotos.wrappedValue.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageListCell = collectionView.dequeueConfigurableCell(for: indexPath)
        let photo = imageListViewModel.observablePhotos.wrappedValue[indexPath.row]
        cell.setCellUI(photosModel: photo)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout:
extension ImageListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let photo = imageListViewModel.observablePhotos.wrappedValue[indexPath.row]
        let ratio = CGFloat(photo.width) / CGFloat(photo.height)
        let width = view.bounds.width - 2 * UIConstants.mediumInset
        let height = width / ratio + UIConstants.Cell.heightLabel + UIConstants.Cell.heightStack + 2 * UIConstants.mediumInset
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        UIConstants.mediumInset
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = imageListViewModel.observablePhotos.wrappedValue[indexPath.row]
        let singlePhoto = SingleImageModel(imageUrl: photo.urls.regular, username: photo.user.username)
        
        self.coordinator?.goToSingleImageViewController(photo: singlePhoto)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row + 1 == imageListViewModel.observablePhotos.wrappedValue.count {
            imageListViewModel.fetch()
        }
    }
}

// MARK: - Setup Views:
private extension ImageListViewController {
    func setupUI() {
        view.backgroundColor = Colors.backgroundBlack.color
        navigationController?.navigationBar.backgroundColor = Colors.backgroundBlack.color
    }
    
    func setupViews() {
        view.addSubview(collectionView, constraints: [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.smallInset),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
