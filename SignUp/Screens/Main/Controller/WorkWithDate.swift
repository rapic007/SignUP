import UIKit

struct WorkWithDate {
    
    static func getData(daysCount: Int) -> [DayCellModel] {
        var result = [DayCellModel]()
    
        
        let calendar = Calendar.current
        let today = Date()
    
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "E"
        
        let CurrentDay = calendar.date(byAdding: .day, value: 0, to: today)
        let dayInWeek = dateFormatter.string(from: CurrentDay!)

        let components = calendar.dateComponents([.day], from: CurrentDay!)
        let model = DayCellModel(dayName: dayInWeek, dayNumber: components.day ?? -1, status: .today)
        result.append(model)
        
    
        for step in 1...daysCount {
            
            let newDatePlusDay = calendar.date(byAdding: .day, value: step, to: today)!
            let componentsPlus = calendar.dateComponents([.day], from: newDatePlusDay)
            let dayInWeek = dateFormatter.string(from: newDatePlusDay)
            let modelPLus = DayCellModel(dayName: dayInWeek,
                                         dayNumber: componentsPlus.day ?? -1,
                                         status: .future)
            result.append(modelPLus)
            
            let newDateMinusDay = calendar.date(byAdding: .day, value: -step, to: today)!
            let componentsMinus = calendar.dateComponents([.day], from: newDateMinusDay)
            let dayInWeekMinus = dateFormatter.string(from: newDateMinusDay)
            
            let randomStatus: DayCellModel.DayStatus = Bool.random() ? .failed : .success
            
            
            let minusModel = DayCellModel(dayName: dayInWeekMinus,
                                          dayNumber: componentsMinus.day ?? -1,
                                          status: randomStatus)
            
            result.insert(minusModel, at: 0)
        }
        
        return result
    }
}
