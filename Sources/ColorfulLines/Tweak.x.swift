import UIKit
import Orion
import NomaePreferences

typealias CL = ColorfulLines

struct ColorfulLines: Tweak {
    
    // Preferences
    @Preference("enabled", store: .colorfulLines) static var enabled = true
    @Preference("scrollColorEnabled", store: .colorfulLines) static var scrollColorEnabled = true
    @Preference("scrollColorFromIcon", store: .colorfulLines) static var scrollColorFromIcon = true
    @Preference("scrollColor", store: .colorfulLines) static var scrollColor = "#ffffff:0.5"
    @Preference("scrollHidden", store: .colorfulLines) static var scrollHidden = false
    @Preference("cursorColorEnabled", store: .colorfulLines) static var cursorColorEnabled = true
    @Preference("cursorColorFromIcon", store: .colorfulLines) static var cursorColorFromIcon = true
    @Preference("cursorColor", store: .colorfulLines) static var cursorColor = "#0984ff:1.0"
    @Preference("cursorHidden", store: .colorfulLines) static var cursorHidden = false
    @Preference("floatingCursorColorEnabled", store: .colorfulLines) static var floatingCursorColorEnabled = true
    @Preference("floatingCursorColorFromIcon", store: .colorfulLines) static var floatingCursorColorFromIcon = true
    @Preference("floatingCursorColor", store: .colorfulLines) static var floatingCursorColor = "#0984ff:1.0"
    @Preference("selectionBarColorEnabled", store: .colorfulLines) static var selectionBarColorEnabled = true
    @Preference("selectionBarColorFromIcon", store: .colorfulLines) static var selectionBarColorFromIcon = true
    @Preference("selectionBarColor", store: .colorfulLines) static var selectionBarColor = "#0984ff:1.0"
    @Preference("highlightColorEnabled", store: .colorfulLines) static var highlightColorEnabled = true
    @Preference("highlightColorFromIcon", store: .colorfulLines) static var highlightColorFromIcon = true
    @Preference("highlightColor", store: .colorfulLines) static var highlightColor = "#0984ff:0.1"
    
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
