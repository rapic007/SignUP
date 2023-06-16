import UIKit

enum TaskCreateCellType: String {
    case taskName
    case repeatingPeriod
    case start
    case createTask
    case timer
}

protocol TaskCreateModel {
    var type: TaskCreateCellType { get }
}

protocol TaskCreateCell {
    func configure(model: TaskCreateModel)
}
