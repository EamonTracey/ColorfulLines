import SwiftUI
import NomaePreferences

struct TextSelectionPreferences: View {
    @Preference("selectionBarColorEnabled", store: .colorfulLines) var selectionBarColorEnabled = true
    @Preference("selectionBarColorFromIcon", store: .colorfulLines) var selectionBarColorFromIcon = true
    @Preference("selectionBarColor", store: .colorfulLines) var selectionBarColor = "#0984ff:1.0"
    @Preference("highlightColorEnabled", store: .colorfulLines) var highlightColorEnabled = true
    @Preference("highlightColorFromIcon", store: .colorfulLines) var highlightColorFromIcon = true
    @Preference("highlightColor", store: .colorfulLines) var highlightColor = "#0984ff:0.1"
    
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
