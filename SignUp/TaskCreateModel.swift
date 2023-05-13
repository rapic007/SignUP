import RealmSwift
import UIKit

class Task: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var imageData: Data?
    @objc dynamic var type: String?
}

