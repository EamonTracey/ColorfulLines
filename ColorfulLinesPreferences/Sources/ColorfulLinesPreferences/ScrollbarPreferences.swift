import SwiftUI
import NomaePreferences

struct ScrollbarPreferences: View {
    @Preference("scrollColorEnabled", identifier: identifier) private var scrollColorEnabled = true
    @Preference("scrollColorFromIcon", identifier: identifier) private var scrollColorFromIcon = true
    @Preference("scrollColor", identifier: identifier) private var scrollColor = Color(UIColor.white.withAlphaComponent(0.5))
    @Preference("scrollHidden", identifier: identifier) private var scrollHidden = false
    
    var body: some View {
        Form {
            Section(header: Text("Scrollbar")) {
                if !scrollHidden {
                    Toggle("Custom Scrollbar Color Enabled", isOn: $scrollColorEnabled)
                    if scrollColorEnabled {
                        Toggle("Color From App Icon", isOn: $scrollColorFromIcon)
                        if !scrollColorFromIcon {
                            ColorPicker("Custom Scrollbar Color", selection: $scrollColor)
                        }
                    }
                }
                Toggle("Hide Scrollbar", isOn: $scrollHidden)
            }
        }
        .navigationBarTitle("Scrollbar")
    }
}
