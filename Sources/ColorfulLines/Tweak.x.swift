import UIKit
import Orion
import NomaePreferences

typealias CL = ColorfulLines

struct ColorfulLines: Tweak {
    
    static let identifier = "com.eamontracey.colorfullines"
    
    // Preferences
    @Preference("enabled", identifier: identifier) static var enabled = true
    @Preference("scrollColorEnabled", identifier: identifier) static var scrollColorEnabled = true
    @Preference("scrollColorFromIcon", identifier: identifier) static var scrollColorFromIcon = true
    @Preference("scrollColor", identifier: identifier) static var scrollColor = "#ffffff:0.5"
    @Preference("scrollHidden", identifier: identifier) static var scrollHidden = false
    @Preference("cursorColorEnabled", identifier: identifier) static var cursorColorEnabled = true
    @Preference("cursorColorFromIcon", identifier: identifier) static var cursorColorFromIcon = true
    @Preference("cursorColor", identifier: identifier) static var cursorColor = "#0984ff:1.0"
    @Preference("cursorHidden", identifier: identifier) static var cursorHidden = false
    @Preference("floatingCursorColorEnabled", identifier: identifier) static var floatingCursorColorEnabled = true
    @Preference("floatingCursorColorFromIcon", identifier: identifier) static var floatingCursorColorFromIcon = true
    @Preference("floatingCursorColor", identifier: identifier) static var floatingCursorColor = "#0984ff:1.0"
    @Preference("selectionBarColorEnabled", identifier: identifier) static var selectionBarColorEnabled = true
    @Preference("selectionBarColorFromIcon", identifier: identifier) static var selectionBarColorFromIcon = true
    @Preference("selectionBarColor", identifier: identifier) static var selectionBarColor = "#0984ff:1.0"
    @Preference("highlightColorEnabled", identifier: identifier) static var highlightColorEnabled = true
    @Preference("highlightColorFromIcon", identifier: identifier) static var highlightColorFromIcon = true
    @Preference("highlightColor", identifier: identifier) static var highlightColor = "#0984ff:0.1"
    
    // Globals
    static var iconColor = Bundle.main.icon?.averageColor ?? .white

}

class UIScrollViewScrollIndicatorHook: ClassHook<UIView> {

    static let targetName = "_UIScrollViewScrollIndicator"

    func didMoveToWindow() {
        orig.didMoveToWindow()
        if CL.enabled && CL.scrollHidden {
            target.isHidden = true
        }
    }

    func _colorForStyle(_ style: UInt64) -> UIColor {
        if CL.enabled && CL.scrollColorEnabled {
            if CL.scrollColorFromIcon {
                return CL.iconColor.withAlphaComponent(0.5)
            } else if let scrollColor = UIColor(hexString: CL.scrollColor) {
                return scrollColor
            }
        }
        return orig._colorForStyle(style)
    }

}

class UITextSelectionViewHook: ClassHook<UIView> {

    static let targetName = "UITextSelectionView"

    func visible() -> Bool {
        return CL.enabled && CL.cursorHidden ? false : orig.visible()
    }

    func caretViewColor() -> UIColor {
        if CL.enabled && CL.cursorColorEnabled {
            if CL.cursorColorFromIcon {
                return CL.iconColor
            } else if let cursorColor = UIColor(hexString: CL.cursorColor) {
                return cursorColor
            }
        }
        return orig.caretViewColor()
    }

    func floatingCaretViewColor() -> UIColor {
        if CL.enabled && CL.floatingCursorColorEnabled {
            if CL.floatingCursorColorFromIcon {
                return CL.iconColor
            } else if let floatingCursorColor = UIColor(hexString: CL.floatingCursorColor) {
                return floatingCursorColor
            }
        }
        return orig.floatingCaretViewColor()
    }

}

class UITextInputTraitsHook: ClassHook<NSObject> {
    
    static let targetName = "UITextInputTraits"
    
    func selectionBarColor() -> UIColor {
        if CL.enabled && CL.selectionBarColorEnabled {
            if CL.selectionBarColorFromIcon {
                return CL.iconColor
            } else if let selectionBarColor = UIColor(hexString: CL.selectionBarColor) {
                return selectionBarColor
            }
        }
        return orig.selectionBarColor()
    }
    
    func selectionHighlightColor() -> UIColor {
        if CL.enabled && CL.highlightColorEnabled {
            if CL.highlightColorFromIcon {
                return CL.iconColor.withAlphaComponent(0.1)
            } else if let highlightColor = UIColor(hexString: CL.highlightColor) {
                return highlightColor
            }
        }
        return orig.selectionHighlightColor()
    }
    
}
