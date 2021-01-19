import UIKit
import Orion

typealias CL = ColorfulLines

struct ColorfulLines: Tweak {
    
    static var prefs: NSDictionary? { NSDictionary(contentsOfFile: "/User/Library/Preferences/com.eamontracey.colorfullinespreferences.plist") }
    
    // Preferences
    static var enabled: Bool = true
    static var scrollColorEnabled: Bool = true
    static var scrollColorFromIcon: Bool = true
    static var scrollColor: UIColor = .init(white: 1.0, alpha: 0.5)
    static var scrollHidden: Bool = false
    static var cursorColorEnabled: Bool = true
    static var cursorColorFromIcon: Bool = true
    static var cursorColor: UIColor = .init(red: 9.0, green: 132.0, blue: 255.0, alpha: 1.0)
    static var cursorHidden: Bool = false
    static var floatingCursorColorEnabled: Bool = true
    static var floatingCursorColorFromIcon: Bool = true
    static var floatingCursorColor: UIColor = .init(red: 9.0, green: 132.0, blue: 255.0, alpha: 1.0)
    static var selectionBarColorEnabled: Bool = true
    static var selectionBarColorFromIcon: Bool = true
    static var selectionBarColor: UIColor = .init(red: 9.0, green: 132.0, blue: 255.0, alpha: 1.0)
    static var highlightColorEnabled: Bool = true
    static var highlightColorFromIcon: Bool = true
    static var highlightColor: UIColor = .init(red: 9.0, green: 132.0, blue: 255.0, alpha: 0.1)
    
    // Globals
    static var iconColor = Bundle.main.icon?.averageColor ?? .white
    
    // Initializer
    init() {
        loadPreferences(nil, nil, nil, nil, nil)
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), nil, loadPreferences, "com.eamontracey.colorfullinespreferences/update" as CFString, nil, .coalesce)
    }

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
        return CL.enabled && CL.scrollColorEnabled ? CL.scrollColorFromIcon ? CL.iconColor.withAlphaComponent(0.5) : CL.scrollColor : orig._colorForStyle(style)
    }

}

class UITextSelectionViewHook: ClassHook<UIView> {

    static let targetName = "UITextSelectionView"

    func visible() -> Bool {
        return CL.enabled && CL.cursorHidden ? false : orig.visible()
    }

    func caretViewColor() -> UIColor {
        return CL.enabled && CL.cursorColorEnabled ? CL.cursorColorFromIcon ? CL.iconColor : CL.cursorColor : orig.caretViewColor()
    }

    func floatingCaretViewColor() -> UIColor {
        return CL.enabled && CL.floatingCursorColorEnabled ? CL.floatingCursorColorFromIcon ? CL.iconColor : CL.floatingCursorColor : orig.floatingCaretViewColor()
    }

}

class UITextInputTraitsHook: ClassHook<NSObject> {
    
    static let targetName = "UITextInputTraits"
    
    func selectionBarColor() -> UIColor {
        return CL.enabled && CL.selectionBarColorEnabled ? CL.selectionBarColorFromIcon ? CL.iconColor : CL.selectionBarColor : orig.selectionBarColor()
    }
    
    func selectionHighlightColor() -> UIColor {
        return CL.enabled && CL.highlightColorEnabled ? CL.highlightColorFromIcon ? CL.iconColor.withAlphaComponent(0.1) : CL.highlightColor : orig.selectionHighlightColor()
    }
    
}
