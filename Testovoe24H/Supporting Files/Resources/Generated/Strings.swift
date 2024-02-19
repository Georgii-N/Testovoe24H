// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Alert {
    internal enum Button {
      /// Отменить
      internal static let cancel = L10n.tr("Localizable", "Alert.Button.Cancel", fallback: "Отменить")
      /// Повторить
      internal static let `repeat` = L10n.tr("Localizable", "Alert.Button.Repeat", fallback: "Повторить")
    }
    internal enum Title {
      /// Ошибка
      internal static let error = L10n.tr("Localizable", "Alert.Title.Error", fallback: "Ошибка")
    }
  }
  internal enum NetworkError {
    /// Parsing Error
    internal static let parsing = L10n.tr("Localizable", "NetworkError.Parsing", fallback: "Parsing Error")
    /// URL Request Error: 
    internal static let urlRequest = L10n.tr("Localizable", "NetworkError.UrlRequest", fallback: "URL Request Error: ")
    /// URL Session Error
    internal static let urlSession = L10n.tr("Localizable", "NetworkError.UrlSession", fallback: "URL Session Error")
    internal enum StatusCode {
      /// The request was unacceptable
      internal static let badRequest = L10n.tr("Localizable", "NetworkError.StatusCode.BadRequest", fallback: "The request was unacceptable")
      /// Something went wrong:(
      internal static let `default` = L10n.tr("Localizable", "NetworkError.StatusCode.Default", fallback: "Something went wrong:(")
      /// Forbidden. Missing permissions to perform request
      internal static let forbidden = L10n.tr("Localizable", "NetworkError.StatusCode.Forbidden", fallback: "Forbidden. Missing permissions to perform request")
      /// The requested resource doesn’t exist
      internal static let notFound = L10n.tr("Localizable", "NetworkError.StatusCode.Not Found", fallback: "The requested resource doesn’t exist")
      /// Unauthorized. Invalid Access Token
      internal static let unauthorized = L10n.tr("Localizable", "NetworkError.StatusCode.Unauthorized", fallback: "Unauthorized. Invalid Access Token")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
