import SwiftUI
import NomaePreferences

struct TextSelectionPreferences: View {
    @Preference("selectionBarColorEnabled", identifier: identifier) private var selectionBarColorEnabled = true
    @Preference("selectionBarColorFromIcon", identifier: identifier) private var selectionBarColorFromIcon = true
    @Preference("selectionBarColor", identifier: identifier) private var selectionBarColor = Color(red: 0.04, green: 0.52, blue: 1.0, opacity: 1.0)
    @Preference("highlightColorEnabled", identifier: identifier) private var highlightColorEnabled = true
    @Preference("highlightColorFromIcon", identifier: identifier) private var highlightColorFromIcon = true
    @Preference("highlightColor", identifier: identifier) private var highlightColor = Color(UIColor(red: 0.04, green: 0.52, blue: 1.0, alpha: 1.0))
    
    var body: some View {
        Form {
            Section(header: Text("Selection Bar")) {
                Toggle("Custom Selection Bar Color Enabled", isOn: $selectionBarColorEnabled)
                if selectionBarColorEnabled {
                    Toggle("Color From App Icon", isOn: $selectionBarColorFromIcon)
                    if !selectionBarColorFromIcon {
                        ColorPicker("Custom Selection Bar Color", selection: $selectionBarColor)
                    }
                }
            }
            Section(header: Text("Highlight")) {
                Toggle("Custom Highlight Color Enabled", isOn: $highlightColorEnabled)
                if highlightColorEnabled {
                    Toggle("Color From App Icon", isOn: $highlightColorFromIcon)
                    if !highlightColorFromIcon {
                        ColorPicker("Custom Highlight Colorr", selection: $highlightColor)
                    }
                }
            }
        }
        .navigationBarTitle("Text Selection")
    }
}
