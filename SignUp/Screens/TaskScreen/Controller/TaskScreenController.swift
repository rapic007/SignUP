import UIKit
import RealmSwift

class TaskScreenController: UIViewController {
    
    let tableView: UITableView = .init()
    var refreshControl = UIRefreshControl()
    var tasks: Results<Task>!
    var timerState = false
    var timer: Timer?
    var time = ""
    var tick = 0
    var updateLabel : [((String) -> Void)] = []
    
    private let numbersSections = DayController.getData(daysCount: 4)
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        
        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupScreen()
        refreshTable()
    }
    private func setupScreen() {
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(TaskScreenTableCell.self, forCellReuseIdentifier: "Cell")
        
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(DayCell.self, forCellWithReuseIdentifier: "\(DayCell.self)")
        
        
        let newTaskButton  = UIButton()
        newTaskButton.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
        newTaskButton.setImage(UIImage(named: "newTaskButton"), for: .normal)
        newTaskButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.addSubview(newTaskButton)
        newTaskButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 50),
            
            newTaskButton.heightAnchor.constraint(equalToConstant: 48),
            newTaskButton.widthAnchor.constraint(equalToConstant: 48),
            newTaskButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -97),
            newTaskButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
            
        ])
        tasks = realm.objects(Task.self)
    }
    func refreshTable() {
        tableView.addSubview(refreshControl)
        
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
    }
    
    @objc
    func buttonTapped() {
        let vc = TaskTypeController()
        vc.modalPresentationStyle = .pageSheet
        vc.sheetPresentationController?.prefersGrabberVisible = true
        self.present(vc, animated: true)
    }
    @objc
    func refresh(send: UIRefreshControl) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
            self.updateLabel = []
        }
    }
}

extension TaskScreenController: UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  numbersSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DayCell.self)", for: indexPath) as! DayCell
        let model = numbersSections[indexPath.item]
        cell.bindCell(model: model)
        
        return cell
    }
}
extension TaskScreenController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.isEmpty ? 0 : tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TaskScreenTableCell

        let task = tasks[indexPath.row]
      
        cell.nameLabel.text = task.name
        cell.image.image = UIImage(data: task.imageNameData!)
        
        if task.addTimer == "Yes" {
            cell.timerLabel.text = "Tap"
            let update: ((String) -> Void) = {value in
                cell.timerLabel.text = value
            }
            updateLabel.append(update)
        }
        
        return cell
    }
    
    
}

extension TaskScreenController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      guard let cell = tableView.cellForRow(at: indexPath) as? TaskScreenTableCell else {
        return
      }
        let task = tasks[indexPath.row]
        
        if task.addTimer == "Yes" {
            if timerState == false {
                cancelTimer()
                cell.timerLabel.text = "Go"
                timerState.toggle()
            }
            else {
                createTimer()
                timerState.toggle()
            }
        }
    }
}

extension TaskScreenController {
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let task = tasks[indexPath.row]
        let customDelete = UIContextualAction(style: .destructive, title: nil) {_,_,_ in
            StorageManager.deleteTask(task)
            tableView.deleteRows(at: [indexPath], with: .none)
        }
        
        let customEdit = UIContextualAction(style: .normal, title: nil) { _, _, _ in
            
        }
    
        customEdit.image = UIGraphicsImageRenderer(size: CGSize(width: 24, height: 24)).image { _ in
            UIImage(named: "edit")?.draw(in: CGRect(x: 0, y: 0, width: 24, height: 24))}
        customEdit.backgroundColor = UIColor(red: 0.82, green: 0.353, blue: 0.133, alpha: 1)
        
        customDelete.image = UIGraphicsImageRenderer(size: CGSize(width: 24, height: 24)).image { _ in
            UIImage(named: "trash")?.draw(in: CGRect(x: 0, y: 0, width: 24, height: 24))}
        customDelete.backgroundColor = UIColor(red: 0.82, green: 0.353, blue: 0.133, alpha: 1)
        
        let swipeAction = UISwipeActionsConfiguration(actions: [customEdit,customDelete])
        
        return swipeAction
    }
}
extension TaskScreenController {
    func cancelTimer() {
        timer?.invalidate()
    }
    
    func createTimer() {
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
        self.timer = timer
        RunLoop.current.add(timer, forMode: .common)
        timer.tolerance = 0.1
    }
    
    @objc func timerTick() {
        let time = secondsToHoursMinutesSeconds(seconds: tick)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        tick += 1
        updateLabel.forEach { update in
            update(timeString)
        }
        
        func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
            return ((seconds / 3600), ((seconds % 3600) / 60),((seconds % 3600) % 60))
        }
        
        func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String {
            var timeString = ""
            timeString += String(format: "%02d", hours)
            timeString += ":"
            timeString += String(format: "%02d", minutes)
            timeString += ":"
            timeString += String(format: "%02d", seconds)
            return timeString
        }
    }
}
