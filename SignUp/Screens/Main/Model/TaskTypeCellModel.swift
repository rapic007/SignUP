import UIKit

struct TaskCell {
    let imageName: UIImage?
    let taskName: String
    let taskDescription: String
}

struct TasksType {
    
    static func fillSell() -> [TaskCell] {
        [
            .init(imageName: UIImage(named: "onetimeTask"),
                  taskName: "Разовое выполнение задачи",
                  taskDescription: "с помощью чек-бокса один раз отметьте выполнение задачи "),
            
            .init(imageName: UIImage(named: "countRepeat"),
                  taskName: "Подсчет повторений",
                  taskDescription: "укажите количество выполнений и отметьте выполнение задачи необходимым количеством нажатий"),
            
            .init(imageName: UIImage(named: "timer"),
                  taskName: "Taймер",
                  taskDescription: "укажите время, необходимое для выполнения задания, и запустите таймер для его выполнения"),
            
            .init(imageName: UIImage(named: "text"),
                      taskName: "Teкст",
                      taskDescription: "чтобы выполнить задание, напишите текст заданной заранее длины"),
            
            .init(imageName: UIImage(named: "geolocation"),
                  taskName: "Геолокация",
                  taskDescription: "чтобы выполнить задание, нужно отметиться в заданной локации")
        ]
    }
}
