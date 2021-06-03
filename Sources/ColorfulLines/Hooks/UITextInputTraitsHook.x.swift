import UIKit
import Orion

class UITextInputTraitsHook: ClassHook<NSObject> {
    
    static let targetName = "UITextInputTraits"
    
    func selectionBarColor() -> UIColor {
        if CL.enabled && CL.selectionBarColorEnabled {
            if CL.selectionBarColorFromIcon {
                return CL.iconColor
            } else {
                return UIColor(CL.selectionBarColor)
            }
        }
        return orig.selectionBarColor()
    }
    
    func selectionHighlightColor() -> UIColor {
        if CL.enabled && CL.highlightColorEnabled {
            if CL.highlightColorFromIcon {
                return CL.iconColor.withAlphaComponent(0.1)
            } else {
                return UIColor(CL.highlightColor)
            }
        }
        return orig.selectionHighlightColor()
    }
    
}
