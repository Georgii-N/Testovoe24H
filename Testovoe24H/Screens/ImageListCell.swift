import UIKit

final class ImageListCell: UICollectionViewCell {
    
    // MARK: - Constants and Variables:
    enum UILocalConstants {
        static let heightLabel: CGFloat = 18
    }
    
    // MARK: - UI:
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.backgroundColor = Colors.backgroundColorBlack.color
        return descriptionLabel
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private lazy var likesStackView: UIStackView = {
        let likesStackView = UIStackView(arrangedSubviews: [likesImageView, likesLabel])
        likesStackView.axis = .horizontal
        likesStackView.backgroundColor = Colors.backgroundColorWhite.color
        return likesStackView
    }()
    
    private lazy var likesImageView: UIImageView = {
        let likesImageView = UIImageView()
        likesImageView.contentMode = .scaleAspectFill
        likesImageView.backgroundColor = Colors.backgroundColorBlack.color
        return likesImageView
    }()
    
    private lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.backgroundColor = Colors.backgroundColorBlack.color
        return likesLabel
    }()
    
    // MARK: - Lifecycle:
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions:
    func setCellUI(photosModel: PhotosModelElement) {
        descriptionLabel.text = photosModel.description
        
    }
}

// MARK: - Setup Views:
private extension ImageListCell {
    func setupViews() {
        addSubview(descriptionLabel, constraints: [
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.mediumInset),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        addSubview(imageView, constraints: [
            imageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: UIConstants.smallInset),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        addSubview(likesStackView, constraints: [
            likesStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: UIConstants.smallInset),
            likesStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            likesStackView.heightAnchor.constraint(equalToConstant: UILocalConstants.heightLabel),
            likesStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIConstants.mediumInset)
        ])
    }
    
    func setupUI() {
        layer.cornerRadius = UIConstants.cornerRadius
        backgroundColor = Colors.backgroundColorGray.color
    }
}
