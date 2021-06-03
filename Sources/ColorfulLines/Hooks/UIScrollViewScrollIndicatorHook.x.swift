import UIKit
import Orion

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
            } else {
                return UIColor(CL.scrollColor)
            }
        }
        return orig._colorForStyle(style)
    }
    
}
