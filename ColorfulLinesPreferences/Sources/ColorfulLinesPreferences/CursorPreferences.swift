import SwiftUI
import NomaePreferences

struct CursorPreferences: View {
    @Preference("cursorColorEnabled", store: .colorfulLines) var cursorColorEnabled = true
    @Preference("cursorColorFromIcon", store: .colorfulLines) var cursorColorFromIcon = true
    @Preference("cursorColor", store: .colorfulLines) var cursorColor = "#0984ff:1.0"
    @Preference("cursorHidden", store: .colorfulLines) var cursorHidden = false
    @Preference("floatingCursorColorEnabled", store: .colorfulLines) var floatingCursorColorEnabled = true
    @Preference("floatingCursorColorFromIcon", store: .colorfulLines) var floatingCursorColorFromIcon = true
    @Preference("floatingCursorColor", store: .colorfulLines) var floatingCursorColor = "#0984ff:1.0"
    
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
