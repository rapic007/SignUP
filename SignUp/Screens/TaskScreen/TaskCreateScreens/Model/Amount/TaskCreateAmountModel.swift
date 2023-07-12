import UIKit

class TaskCreateAmountModel: TaskCreateModel {
    let title: String
    var amount: String?
    var type: TaskCreateCellType {
        .amountIteration
    }
    init(title: String) {
        self.title = title
    }
}
