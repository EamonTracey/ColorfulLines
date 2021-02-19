import SwiftUI
import NomaePreferences

let identifier = "com.eamontracey.colorfullines"

struct RootPreferences: View {
    @Preference("enabled", identifier: identifier) var enabled = true

    var body: some View {
        Form {
            Header("Colorful Lines", icon: (Image(contentsOfFile: "/Library/PreferenceBundles/ColorfulLinesPreferences.bundle/icon@3x.png") ?? Image(systemName: "paintbrush")).resizable().frame(width: 50, height: 50), subtitle: "Developed by Eamon Tracey")
            Section(header: Text("Enable/Disable")) {
                Toggle("Enable", isOn: $enabled)
            }
            if enabled {
                Section(header: Text("Preferences")) {
                    NavigationLink("Scrollbar", destination: ScrollbarPreferences())
                    NavigationLink("Cursor", destination: CursorPreferences())
                    NavigationLink("Text Selection", destination: TextSelectionPreferences())
                }
            }
            Section(footer: Text("© Eamon Tracey 2021")) {
                HStack {
                    Image(contentsOfFile: "/Library/PreferenceBundles/ColorfulLinesPreferences.bundle/github@3x.png")
                    Button("Source Code ❤️") {
                        UIApplication.shared.open(URL(string: "https://github.com/EamonTracey/ColorfulLines")!, options: .init(), completionHandler: .none)
                    }
                }
            }
        }
        .navigationBarTitle("Colorful Lines")
        .environment(\.horizontalSizeClass, .regular)
    }
}

private extension Image {
    init?(contentsOfFile path: String) {
        guard let uiImage = UIImage(contentsOfFile: path) else { return nil }
        self.init(uiImage: uiImage)
    }
}
