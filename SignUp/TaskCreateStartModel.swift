import UIKit

class TaskCreateStartModel: TaskCreateModel {
    let startTitle: String
    let finishTitle: String
    
    var type: TaskCreateCellType {
        return .start
    }
    
    init(startTitle: String, finishTitle: String) {
        self.startTitle = startTitle
        self.finishTitle = finishTitle
    }
}
