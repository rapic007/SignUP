import UIKit

class TaskCreateStartModel: TaskCreateModel {
    let title: String
    
    var type: TaskCreateCellType {
        return .start
    }
    
    init(title: String) {
        self.title = title
    }
}
