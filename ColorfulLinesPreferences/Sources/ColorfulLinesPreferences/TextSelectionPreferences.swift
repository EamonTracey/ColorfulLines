import SwiftUI
import NomaePreferences

struct TextSelectionPreferences: View {
    @Preference("selectionBarColorEnabled", identifier: identifier) var selectionBarColorEnabled = true
    @Preference("selectionBarColorFromIcon", identifier: identifier) var selectionBarColorFromIcon = true
    @Preference("selectionBarColor", identifier: identifier) var selectionBarColor = "#0984ff:1.0"
    @Preference("highlightColorEnabled", identifier: identifier) var highlightColorEnabled = true
    @Preference("highlightColorFromIcon", identifier: identifier) var highlightColorFromIcon = true
    @Preference("highlightColor", identifier: identifier) var highlightColor = "#0984ff:0.1"
    
    var body: some View {
        Form {
            Section(header: Text("Selection Bar")) {
                Toggle("Custom Selection Bar Color", isOn: $selectionBarColorEnabled)
                if selectionBarColorEnabled {
                    Toggle("Color From App Icon", isOn: $selectionBarColorFromIcon)
                    if !selectionBarColorFromIcon {
                        ColorField("#0984ff:1.0", selection: $selectionBarColor)
                    }
                }
            }
            Section(header: Text("Highlight")) {
                Toggle("Custom Highlight Color", isOn: $highlightColorEnabled)
                if highlightColorEnabled {
                    Toggle("Color From App Icon", isOn: $highlightColorFromIcon)
                    if !highlightColorFromIcon {
                        ColorField("#0984ff:0.1", selection: $highlightColor)
                    }
                }
            }
        }
        .padding(.vertical)
        .navigationBarTitle("Text Selection")
        .environment(\.horizontalSizeClass, .regular)
    }
}
