import UIKit
import Kingfisher

final class ImageListCell: UICollectionViewCell {
    
    // MARK: - UI:
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 2
        descriptionLabel.font = .captionMediumMedium
        descriptionLabel.textAlignment = .center
        descriptionLabel.clipsToBounds = true
        descriptionLabel.layer.cornerRadius = UIConstants.cornerRadius
        descriptionLabel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return descriptionLabel
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var likesStackView: UIStackView = {
        let likesStackView = UIStackView(arrangedSubviews: [likesImageView, likesLabel])
        likesStackView.axis = .horizontal
        return likesStackView
    }()
    
    private lazy var likesImageView: UIImageView = {
        let likesImageView = UIImageView()
        likesImageView.image = Resources.SystemIcons.heartSymbol
        likesImageView.tintColor = Colors.captionRed.color
        return likesImageView
    }()
    
    private lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.font = .captionMediumLarge
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
        descriptionLabel.text = photosModel.description ?? photosModel.altDescription
        
        let color = UIColor(hexString: photosModel.color)
        backgroundColor = color
        let textColor = color.isDarkColor() ? Colors.backgroundWhite.color : Colors.backgroundBlack.color
        
        descriptionLabel.textColor = textColor
        likesLabel.textColor = textColor
        
        let imageURL = URL(string: photosModel.urls.thumb)
        
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: imageURL, options: [
            .transition(.fade(1)),
            .cacheOriginalImage
        ])
        
        likesLabel.text = String(photosModel.likes)
    }
}

// MARK: - Setup Views:
private extension ImageListCell {
    func setupViews() {
        addSubview(descriptionLabel, constraints: [
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIConstants.mediumInset),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIConstants.mediumInset),
            descriptionLabel.heightAnchor.constraint(equalToConstant: UIConstants.Cell.heightLabel)
        ])
        
        addSubview(likesStackView, constraints: [
            likesStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            likesStackView.heightAnchor.constraint(equalToConstant: UIConstants.Cell.heightStack),
            likesStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIConstants.mediumInset)
        ])
        
        addSubview(imageView, constraints: [
            imageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: likesStackView.topAnchor, constant: -UIConstants.mediumInset)
        ])
    }
    
    func setupUI() {
        layer.cornerRadius = UIConstants.cornerRadius
    }
}
