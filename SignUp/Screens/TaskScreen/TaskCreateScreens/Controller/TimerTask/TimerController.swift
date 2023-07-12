import UIKit
import Realm

class TimerController: CreatingNewTask {
    
    let tableView: UITableView = .init()
    let createButton = CustomButton()
    
    let models: [TaskCreateModel] = [
        TaskCreateNameModel(title: "Название задачи"),
        TaskCreateTimerModel(title: "Длительность выполнения задачи"),
        TaskCreatePeriodModel(title: "Периодичность выполнения"),
        TaskCreateStartFinishModel(startTitle: "Начало выполнения", finishTitle: "Конец выполнения"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupTableView()
        setupButton()
    }
    func configureUI() {
        
        tableView.register(TaskCreateNameCell.self, forCellReuseIdentifier: TaskCreateCellType.taskName.rawValue)
        tableView.register(TaskCreatePeriodCell.self, forCellReuseIdentifier: TaskCreateCellType.repeatingPeriod.rawValue)
        tableView.register(TaskCreateStartFinishCell.self, forCellReuseIdentifier: TaskCreateCellType.start.rawValue)
        tableView.register(TaskCreateTimerCell.self, forCellReuseIdentifier: TaskCreateCellType.timer.rawValue)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
}

extension TimerController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = models[indexPath.row]
        let identifier = model.type.rawValue
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TaskCreateCell
        cell.configure(model: model)
        return cell as! UITableViewCell
    }
    
}

extension TimerController: UITableViewDelegate {
    
}

extension TimerController {
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    func setupButton() {
        createButton.setupButton()
        createButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        tableView.addSubview(createButton)
        
        
        NSLayoutConstraint.activate([
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            createButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            createButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    @objc
    func buttonPressed() {
        guard let nameModel = models[0] as? TaskCreateNameModel, let name = nameModel.taskName else {
            return
        }
        guard let timeModel = models[1] as? TaskCreateTimerModel, let time = timeModel.time else {
            return
        }
        
        let newTask = Task()
        newTask.name = name
        newTask.imageNameData = UIImage(named: "timer")?.pngData()
        newTask.addTimer = true
        newTask.startTick = 0
        newTask.taskInfo = time
        newTask.startTimerLabel = "00:00:00"
        
        StorageManager.saveTask(newTask)
        
        self.dismiss(animated: true)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"), object: nil)
    }
}
