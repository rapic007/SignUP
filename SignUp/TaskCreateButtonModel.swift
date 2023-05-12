import UIKit

class TaskCreateButtonModel: TaskCreateModel {
    let title: String
    
    var type: TaskCreateCellType {
        .createTask
    }
    init(title: String) {
        self.title = title
    }
}
