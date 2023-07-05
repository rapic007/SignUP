import RealmSwift
import UIKit


enum TaskStatus: String, PersistableEnum {
    case isPause
    case inProgress
}

class Task: Object {
    
    @Persisted var name = ""
    @Persisted var status: TaskStatus = .isPause
    @Persisted var imageNameData: Data?
    @Persisted var addTimer: Bool?
    @Persisted var startTick: Int = 0
    @Persisted var time: String = ""
    @Persisted var startTimerLabel: String = ""
}
