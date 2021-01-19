import Preferences

class RootListController: IOListController {

    override var specifiers: NSMutableArray? {
        get {
            if let specifiers = value(forKey: "_specifiers") as? NSMutableArray {
                return specifiers
            } else {
                let specifiers = loadSpecifiers(fromPlistName: "Root", target: self)
                setValue(specifiers, forKey: "_specifiers")
                return specifiers
            }
        }
        set {
            super.specifiers = newValue
        }
    }
    
    @objc func openGithub() {
        UIApplication.shared.open(URL(string: "https://github.com/EamonTracey/ColorfulLines")!, options: .init(), completionHandler: .none)
    }

}
