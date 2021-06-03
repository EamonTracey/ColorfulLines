import SwiftUI
import UIKit
import NomaePreferences
import Orion

typealias CL = ColorfulLines

struct ColorfulLines: Tweak {
    
    static let identifier = "com.eamontracey.colorfullines"
    
    // Preferences
    @Preference("enabled", identifier: identifier) static var enabled = true
    @Preference("scrollColorEnabled", identifier: identifier) static var scrollColorEnabled = true
    @Preference("scrollColorFromIcon", identifier: identifier) static var scrollColorFromIcon = true
    @Preference("scrollColor", identifier: identifier) static var scrollColor = Color(UIColor.white.withAlphaComponent(0.5))
    @Preference("scrollHidden", identifier: identifier) static var scrollHidden = false
    @Preference("cursorColorEnabled", identifier: identifier) static var cursorColorEnabled = true
    @Preference("cursorColorFromIcon", identifier: identifier) static var cursorColorFromIcon = true
    @Preference("cursorColor", identifier: identifier) static var cursorColor = Color(red: 0.04, green: 0.52, blue: 1.0, opacity: 1.0)
    @Preference("cursorHidden", identifier: identifier) static var cursorHidden = false
    @Preference("floatingCursorColorEnabled", identifier: identifier) static var floatingCursorColorEnabled = true
    @Preference("floatingCursorColorFromIcon", identifier: identifier) static var floatingCursorColorFromIcon = true
    @Preference("floatingCursorColor", identifier: identifier) static var floatingCursorColor = Color(red: 0.04, green: 0.52, blue: 1.0, opacity: 1.0)
    @Preference("selectionBarColorEnabled", identifier: identifier) static var selectionBarColorEnabled = true
    @Preference("selectionBarColorFromIcon", identifier: identifier) static var selectionBarColorFromIcon = true
    @Preference("selectionBarColor", identifier: identifier) static var selectionBarColor = Color(red: 0.04, green: 0.52, blue: 1.0, opacity: 1.0)
    @Preference("highlightColorEnabled", identifier: identifier) static var highlightColorEnabled = true
    @Preference("highlightColorFromIcon", identifier: identifier) static var highlightColorFromIcon = true
    @Preference("highlightColor", identifier: identifier) static var highlightColor = Color(UIColor(red: 0.04, green: 0.52, blue: 1.0, alpha: 1.0))
    
    // Globals
    static var iconColor = Bundle.main.icon?.averageColor ?? .white
    
}
