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
    static var caretColorEnabled: Bool = true
    static var caretColorFromIcon: Bool = true
    static var caretColor: UIColor = .init(red: 9.0, green: 132.0, blue: 255.0, alpha: 1.0)
    static var caretHidden: Bool = false
    static var floatingCaretColorEnabled: Bool = true
    static var floatingCaretColorFromIcon: Bool = true
    static var floatingCaretColor: UIColor = .init(red: 9.0, green: 132.0, blue: 255.0, alpha: 1.0)
    
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
        return CL.enabled && CL.caretHidden ? false : orig.visible()
    }

    func caretViewColor() -> UIColor {
        return CL.enabled && CL.caretColorEnabled ? CL.caretColorFromIcon ? CL.iconColor : CL.caretColor : orig.caretViewColor()
    }

    func floatingCaretViewColor() -> UIColor {
        return CL.enabled && CL.floatingCaretColorEnabled ? CL.floatingCaretColorFromIcon ? CL.iconColor : CL.floatingCaretColor : orig.floatingCaretViewColor()
    }

}
