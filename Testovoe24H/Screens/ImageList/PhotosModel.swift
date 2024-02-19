import Foundation

// MARK: - PhotosModelElement
struct PhotosModelElement: Decodable {
    let width, height: Int
    let color: String
    let description: String?
    let altDescription: String
    let urls: Urls
    let likes: Int
    let user: User

    enum CodingKeys: String, CodingKey {
        case width, height, color
        case description
        case altDescription = "alt_description"
        case urls, likes
        case user
    }
}

// MARK: - User
struct User: Decodable {
    let username: String
}

// MARK: - Urls
struct Urls: Decodable {
    let regular, thumb: String
}

typealias PhotosModel = [PhotosModelElement]
