import UIKit

class TaskCreateStartModel: TaskCreateModel {
    let title: String
    let titleTwo: String
    
    var type: TaskCreateCellType {
        return .start
    }
    
    init(title: String, titleTwo: String) {
        self.title = title
        self.titleTwo = titleTwo
    }
}
