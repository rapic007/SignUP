import UIKit

struct TaskCell {
    let imageName: UIImage?
    let taskName: String
    let taskDescription: String
    enum Id {
        case onetimeTask, countRepeat, timer, text, geolocation
    }
    let id: Id
}

struct TasksType {
    
    static func fillSell() -> [TaskCell] {
        [
            .init(imageName: UIImage(named: "onetimeTask"),
                  taskName: "Разовое выполнение задачи",
                  taskDescription: "с помощью чек-бокса один раз отметьте выполнение задачи ",
                  id: .onetimeTask),
            
            .init(imageName: UIImage(named: "countRepeat"),
                  taskName: "Подсчет повторений",
                  taskDescription: "укажите количество выполнений и отметьте выполнение задачи необходимым количеством нажатий",
                  id: .countRepeat),
            
            .init(imageName: UIImage(named: "timer"),
                  taskName: "Taймер",
                  taskDescription: "укажите время, необходимое для выполнения задания, и запустите таймер для его выполнения",
                  id: .timer),
            
            .init(imageName: UIImage(named: "text"),
                      taskName: "Teкст",
                  taskDescription: "чтобы выполнить задание, напишите текст заданной заранее длины",
                  id: .text),
            
            .init(imageName: UIImage(named: "geolocation"),
                  taskName: "Геолокация",
                  taskDescription: "чтобы выполнить задание, нужно отметиться в заданной локации",
                  id: .geolocation)
        ]
    }
}
