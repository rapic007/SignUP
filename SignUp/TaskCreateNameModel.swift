import UIKit

class TaskCreateNameModel: TaskCreateModel {
    let title: String
    var taskName: String?
    var image: Data?
    
    var type: TaskCreateCellType {
        return .taskName
    }
    
    init(title: String) {
        self.title = title
    }
}

