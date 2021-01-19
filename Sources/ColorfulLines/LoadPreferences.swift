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
        CL.cursorColorEnabled ?= prefs["cursorColorEnabled"]
        CL.cursorColorFromIcon ?= prefs["cursorColorFromIcon"]
        CL.cursorColor ?= UIColor(hexString: prefs["cursorColor"] as? String)
        CL.cursorHidden ?= prefs["cursorHidden"]
        CL.floatingCursorColorEnabled ?= prefs["floatingCursorColorEnabled"]
        CL.floatingCursorColorFromIcon ?= prefs["floatingCursorColorFromIcon"]
        CL.floatingCursorColor ?= UIColor(hexString: prefs["floatingCursorColor"] as? String)
        CL.selectionBarColorEnabled ?= prefs["selectionBarColorEnabled"]
        CL.selectionBarColorFromIcon ?= prefs["selectionBarColorFromIcon"]
        CL.selectionBarColor ?= UIColor(hexString: prefs["selectionBarColor"] as? String)
        CL.highlightColorEnabled ?= prefs["highlightColorEnabled"]
        CL.highlightColorFromIcon ?= prefs["highlightColorFromIcon"]
        CL.highlightColor ?= UIColor(hexString: prefs["highlightColor"] as? String)
    }
}
