import UIKit

extension UIColor {

    // Used to load libsparkcolourpicker preferences
    convenience init?(hexString: String?) {
        guard var hexString = hexString else { return nil }
        hexString.removeFirst()
        let split = hexString.split(separator: ":")
        var rgb: UInt64 = 0
        Scanner(string: String(split.first!)).scanHexInt64(&rgb)
        let alpha = String(split.last!)
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(Double(alpha)!)
        )
    }

}
