import SwiftUI
import NomaePreferences

struct CursorPreferences: View {
    @Preference("cursorColorEnabled", identifier: identifier) var cursorColorEnabled = true
    @Preference("cursorColorFromIcon", identifier: identifier) var cursorColorFromIcon = true
    @Preference("cursorColor", identifier: identifier) var cursorColor = "#0984ff:1.0"
    @Preference("cursorHidden", identifier: identifier) var cursorHidden = false
    @Preference("floatingCursorColorEnabled", identifier: identifier) var floatingCursorColorEnabled = true
    @Preference("floatingCursorColorFromIcon", identifier: identifier) var floatingCursorColorFromIcon = true
    @Preference("floatingCursorColor", identifier: identifier) var floatingCursorColor = "#0984ff:1.0"
    
    var body: some View {
        Form {
            Section(header: Text("Cursor")) {
                if !cursorHidden {
                    Toggle("Custom Cursor Color", isOn: $cursorColorEnabled)
                    if cursorColorEnabled {
                        Toggle("Color From App Icon", isOn: $cursorColorFromIcon)
                        if !cursorColorFromIcon {
                            ColorField("#0984ff:1.0", selection: $cursorColor)
                        }
                    }
                }
                Toggle("Hide Cursor", isOn: $cursorHidden)
            }
            if !cursorHidden {
                Section(header: Text("Floating Cursor")) {
                    Toggle("Custom Floating Cursor Color", isOn: $floatingCursorColorEnabled)
                    if floatingCursorColorEnabled {
                        Toggle("Color From App Icon", isOn: $floatingCursorColorFromIcon)
                        if !floatingCursorColorFromIcon {
                            ColorField("#0984ff:1.0", selection: $floatingCursorColor)
                        }
                    }
                }
            }
        }
        .padding(.vertical)
        .navigationBarTitle("Cursor")
        .environment(\.horizontalSizeClass, .regular)
    }
}
