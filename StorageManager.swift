import UIKit
import RealmSwift


let realm = try! Realm()
class StorageManager {

    static func saveTask(_ task: Task) {
        try! realm.write{
            realm.add(task)
        }
    }
}

