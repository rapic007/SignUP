import RealmSwift
import UIKit


enum TaskStatus: String, PersistableEnum {
    case notStarted
    case inProgress
}

class Task: Object {
    
    @objc dynamic var name = ""
//    @objc dynamic var ellapsed: Int = 0
//    @objc dynamic var status: TaskStatus = .notStarted
    @objc dynamic var imageNameData: Data?
    @objc dynamic var addTimer = ""
}


