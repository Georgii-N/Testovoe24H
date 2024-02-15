import UIKit

extension UICollectionView {
    func register<C: UICollectionViewCell>(_ cellClass: C.Type) {
        register(cellClass, forCellWithReuseIdentifier: C.identifier)
    }

    func dequeueConfigurableCell<C: UICollectionViewCell>(for indexPath: IndexPath) -> C {
        guard let cell = dequeueReusableCell(withReuseIdentifier: C.identifier, for: indexPath) as? C else {
            preconditionFailure("Cell with \(C.identifier) was not registered!")
        }
        return cell
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
