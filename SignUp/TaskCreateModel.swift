import RealmSwift
import UIKit

class Task: Object {
    
    @objc dynamic var name = ""
    
    convenience init(name: String = "") {
        self.init()
        self.name = name
    }
}

