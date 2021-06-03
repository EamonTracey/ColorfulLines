import SwiftUI
import NomaePreferences

class PreferencesController: NomaePreferencesController {
    override var suiView: AnyView {
        get { AnyView(RootPreferences()) }
        set { super.suiView = newValue }
    }
}
