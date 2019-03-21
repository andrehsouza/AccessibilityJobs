// swiftlint:disable all
// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum L10n {
  /// Double tap for more details.
  public static let jobCellHint = L10n.tr("Localizable", "jobCellHint")
  /// Job Detail
  public static let jobDetailScreenTitle = L10n.tr("Localizable", "jobDetailScreenTitle")
  /// Loading job list, please wait.
  public static let jobListLoading = L10n.tr("Localizable", "jobListLoading")
  /// Job list loading complete.
  public static let jobListLoadingComplete = L10n.tr("Localizable", "jobListLoadingComplete")
  /// Jobs
  public static let jobListScreenTitle = L10n.tr("Localizable", "jobListScreenTitle")
  /// Location
  public static let jobLocation = L10n.tr("Localizable", "jobLocation")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
