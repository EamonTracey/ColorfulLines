import UIKit

infix operator ?=
private func ?=<T>(lhs: inout T, rhs: Any?) {
    if let newValue = rhs as? T {
        lhs = newValue
    }
}

func loadPreferences(_ center: CFNotificationCenter?, _ sender: UnsafeMutableRawPointer?, _ name: CFNotificationName?, _ object: UnsafeRawPointer?, _ userInfo: CFDictionary?) {
    if let prefs = CL.prefs {
        CL.enabled ?= prefs["enabled"]
        CL.scrollColorEnabled ?= prefs["scrollColorEnabled"]
        CL.scrollColorFromIcon ?= prefs["scrollColorFromIcon"]
        CL.scrollColor ?= UIColor(hexString: prefs["scrollColor"] as? String)
        CL.scrollHidden ?= prefs["scrollHidden"]
        CL.caretColorEnabled ?= prefs["caretColorEnabled"]
        CL.caretColorFromIcon ?= prefs["caretColorFromIcon"]
        CL.caretColor ?= UIColor(hexString: prefs["caretColor"] as? String)
        CL.caretHidden ?= prefs["caretHidden"]
        CL.floatingCaretColorEnabled ?= prefs["floatingCaretColorEnabled"]
        CL.floatingCaretColorFromIcon ?= prefs["floatingCaretColorFromIcon"]
        CL.floatingCaretColor ?= UIColor(hexString: prefs["floatingCaretColor"] as? String)
    }
}
