import UIKit

class TaskCreatePeriodModel: TaskCreateModel {
    let title: String
    
    var type: TaskCreateCellType {
        return .repeatingPeriod
    }
    
    var period: Period?
    
    init(title: String) {
        self.title = title
    }
    
    enum Period {
        case everyDay
        case onWeekdays
        case monthly
        case everyYear
        case once
        case chooseDay
    }
}
