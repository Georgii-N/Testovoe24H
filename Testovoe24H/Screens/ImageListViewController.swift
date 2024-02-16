import UIKit

final class ImageListViewController: UIViewController {
    
    // MARK: - Dependencies:
    private let imageListViewModel: ImageListViewModelProtocol
    
    // MARK: - UI:
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.layoutMargins = UIEdgeInsets(top: 0, left: UIConstants.mediumInset, bottom: 0, right: -UIConstants.mediumInset)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageListCell.self)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .black
        return collectionView
    }()
 
    // MARK: - Lifecycle:
    init(imageListViewModel: ImageListViewModelProtocol) {
        self.imageListViewModel = imageListViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}
// MARK: - UICollectionViewDataSource:
extension ImageListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageListCell = collectionView.dequeueConfigurableCell(for: indexPath)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout:
extension ImageListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width - 2 * UIConstants.mediumInset, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

// MARK: - Setup Views:
private extension ImageListViewController {
    func setupViews() {
        view.addSubview(collectionView, constraints: [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
