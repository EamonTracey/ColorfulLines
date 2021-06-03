import UIKit
import Orion

class UITextSelectionViewHook: ClassHook<UIView> {
    
    static let targetName = "UITextSelectionView"
    
    func visible() -> Bool {
        return CL.enabled && CL.cursorHidden ? false : orig.visible()
    }
    
    func caretViewColor() -> UIColor {
        if CL.enabled && CL.cursorColorEnabled {
            if CL.cursorColorFromIcon {
                return CL.iconColor
            } else {
                return UIColor(CL.cursorColor)
            }
        }
        return orig.caretViewColor()
    }
    
    func floatingCaretViewColor() -> UIColor {
        if CL.enabled && CL.floatingCursorColorEnabled {
            if CL.floatingCursorColorFromIcon {
                return CL.iconColor
            } else {
                return UIColor(CL.floatingCursorColor)
            }
        }
        return orig.floatingCaretViewColor()
    }
    
}
