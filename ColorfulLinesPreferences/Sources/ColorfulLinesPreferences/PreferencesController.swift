import SwiftUI
import NomaePreferences

extension Bundle: ObservableObject {}

class PreferencesController: NomaePreferencesController {
    
    override var suiView: AnyView {
        get { AnyView(RootPreferences()) }
        set { super.suiView = newValue }
    }
    
}
