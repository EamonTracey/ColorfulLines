import SwiftUI
import NomaePreferences

let identifier = "com.eamontracey.colorfullines"

struct RootPreferences: View {
    @Preference("enabled", identifier: identifier) private var enabled = true

    var body: some View {
        Form {
            Header("Colorful Lines", icon: Image.colorfulLines, subtitle: "Developed by Eamon Tracey")
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
                    GitHubLogo()
                        .frame(maxWidth: 29, maxHeight: 29)
                    Button("Source Code  ❤️  Leave a  ⭐️") {
                        UIApplication.shared.open(URL(string: "https://github.com/EamonTracey/ColorfulLines")!, options: .init(), completionHandler: .none)
                    }
                }
            }
        }
        .navigationBarTitle("Colorful Lines")
    }
}

private extension Image {
    init?(contentsOfFile path: String) {
        guard let uiImage = UIImage(contentsOfFile: path) else { return nil }
        self.init(uiImage: uiImage)
    }
    
    static var colorfulLines: some View {
        (Image(contentsOfFile: "/Library/PreferenceBundles/ColorfulLinesPreferences.bundle/icon@3x.png") ?? Image(systemName: "paintbrush"))
            .resizable()
            .frame(width: 64, height: 64)
    }
}
