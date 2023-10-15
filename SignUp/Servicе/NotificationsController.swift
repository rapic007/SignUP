import UIKit
import UserNotifications

class NotificationsController {
    
    func checkForPermission() {
       
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                self.sendNotification()
            case .denied:
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow {
                        self.sendNotification()
                    }
                }
            default:
                return
            }
        }
    }
    
    func sendNotification() {
        let title = "Задачи"
        let body = "Время выполнять задачи! "
       
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let date = Date(timeIntervalSinceNow: 2)
        let triggerHours = Calendar.current.dateComponents([.hour], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerHours, repeats: true)

        let request = UNNotificationRequest(identifier: "identifier", content: content, trigger: trigger)
        
        notificationCenter.add(request)
    }
}
