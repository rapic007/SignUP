import UIKit

class TaskCreateAmountIterationModel: TaskCreateModel {
    let title: String
    
    var type: TaskCreateCellType {
        .amountIteration
    }
    init(title: String) {
        self.title = title
    }
}
