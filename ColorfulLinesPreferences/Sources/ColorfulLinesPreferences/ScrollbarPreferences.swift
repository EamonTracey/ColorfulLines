import SwiftUI
import NomaePreferences

struct ScrollbarPreferences: View {
    @Preference("scrollColorEnabled", identifier: identifier) var scrollColorEnabled = true
    @Preference("scrollColorFromIcon", identifier: identifier) var scrollColorFromIcon = true
    @Preference("scrollColor", identifier: identifier) var scrollColor = "#ffffff:0.5"
    @Preference("scrollHidden", identifier: identifier) var scrollHidden = false
    
    var body: some View {
        Form {
            Section(header: Text("Scrollbar")) {
                if !scrollHidden {
                    Toggle("Custom Scrollbar Color", isOn: $scrollColorEnabled)
                    if scrollColorEnabled {
                        Toggle("Color From App Icon", isOn: $scrollColorFromIcon)
                        if !scrollColorFromIcon {
                            ColorField("#ffffff:0.5", selection: $scrollColor)
                        }
                    }
                }
                Toggle("Hide Scrollbar", isOn: $scrollHidden)
            }
        }
        .padding(.vertical)
        .navigationBarTitle("Scrollbar")
        .environment(\.horizontalSizeClass, .regular)
    }
}
