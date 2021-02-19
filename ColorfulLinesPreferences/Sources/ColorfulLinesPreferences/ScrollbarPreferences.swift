import SwiftUI
import NomaePreferences

struct ScrollbarPreferences: View {
    @Preference("scrollColorEnabled", store: .colorfulLines) var scrollColorEnabled = true
    @Preference("scrollColorFromIcon", store: .colorfulLines) var scrollColorFromIcon = true
    @Preference("scrollColor", store: .colorfulLines) var scrollColor = "#ffffff:0.5"
    @Preference("scrollHidden", store: .colorfulLines) var scrollHidden = false
    
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
