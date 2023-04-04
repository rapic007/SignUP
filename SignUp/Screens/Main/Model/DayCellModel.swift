import UIKit

struct DayCellModel {
    
    enum DayStatus {
        case failed, success, today, future
    }
    
    let dayName: String
    let dayNumber: Int
    let status: DayStatus
}
