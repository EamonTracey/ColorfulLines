import SwiftUI
import NomaePreferences

struct CursorPreferences: View {
    @Preference("cursorColorEnabled", identifier: identifier) private var cursorColorEnabled = true
    @Preference("cursorColorFromIcon", identifier: identifier) private var cursorColorFromIcon = true
    @Preference("cursorColor", identifier: identifier) private var cursorColor = Color(red: 0.04, green: 0.52, blue: 1.0, opacity: 1.0)
    @Preference("cursorHidden", identifier: identifier) private var cursorHidden = false
    @Preference("floatingCursorColorEnabled", identifier: identifier) private var floatingCursorColorEnabled = true
    @Preference("floatingCursorColorFromIcon", identifier: identifier) private var floatingCursorColorFromIcon = true
    @Preference("floatingCursorColor", identifier: identifier) private var floatingCursorColor = Color(red: 0.04, green: 0.52, blue: 1.0, opacity: 1.0)
    
    var body: some View {
        Form {
            Section(header: Text("Cursor")) {
                if !cursorHidden {
                    Toggle("Custom Cursor Color Enabled", isOn: $cursorColorEnabled)
                    if cursorColorEnabled {
                        Toggle("Color From App Icon", isOn: $cursorColorFromIcon)
                        if !cursorColorFromIcon {
                            ColorPicker("Custom Cursor Color", selection: $cursorColor)
                        }
                    }
                }
                Toggle("Hide Cursor", isOn: $cursorHidden)
            }
            if !cursorHidden {
                Section(header: Text("Floating Cursor")) {
                    Toggle("Custom Floating Cursor Color Enabled", isOn: $floatingCursorColorEnabled)
                    if floatingCursorColorEnabled {
                        Toggle("Color From App Icon", isOn: $floatingCursorColorFromIcon)
                        if !floatingCursorColorFromIcon {
                            ColorPicker("Custom Floating Cursor Color", selection: $floatingCursorColor)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Cursor")
    }
}
