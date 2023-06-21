import RealmSwift
import UIKit


enum TaskStatus: String, PersistableEnum {
    case notStarted
    case inProgress
}

class Task: Object {
    
    @Persisted var name = ""
//    @objc dynamic var ellapsed: Int = 0
//    @objc dynamic var status: TaskStatus = .notStarted
    @Persisted var imageNameData: Data?
    @Persisted var addTimer: Bool?
    @Persisted var startTick: Int = 0 
}

var objectNotificationToken: NotificationToken?
