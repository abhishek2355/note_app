import UIKit

enum AppColors {
    
    // MARK: - Brand Colors
    static let primary = UIColor(named: "PrimaryColor") ?? UIColor.systemOrange
    static let accent = UIColor(named: "AccentColor") ?? UIColor.systemBlue
    
    // MARK: - Backgrounds
    static let background = UIColor.systemBackground
    static let cardBackground = UIColor.secondarySystemBackground
    
    // MARK: - Text Colors
    static let primaryText = UIColor.label
    static let secondaryText = UIColor.secondaryLabel
    static let placeholderText = UIColor.placeholderText
    
    // MARK: - Button Colors
    static let buttonText = UIColor.white
    static let buttonBackground = UIColor.orange
    
    // MARK: - Border and Separator
    static let border = UIColor.systemGray4
    static let separator = UIColor.separator
    
    // MARK: - Alerts & Errors
    static let error = UIColor.systemRed
    static let warning = UIColor.systemYellow
    static let success = UIColor.systemGreen
}
