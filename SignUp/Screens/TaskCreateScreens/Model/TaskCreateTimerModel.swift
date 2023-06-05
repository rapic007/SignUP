import UIKit

class TaskCreateTimerModel: TaskCreateModel {
    let title: String
    
    
    var type: TaskCreateCellType {
        .timer
    }
    
    init(title: String) {
        self.title = title
    }

}
