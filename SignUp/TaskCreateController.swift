import UIKit
import RealmSwift

class TaskCreateController: UIViewController {
    
    let tableView: UITableView = .init()
    var task: Results<Task>!
    
    let models: [TaskCreateModel] = [
        TaskCreateNameModel(title: "Название задачи"),
        TaskCreatePeriodModel(title: "Периодичность выполнения"),
        TaskCreateStartModel(title: "Начало выполнения", titleTwo: "Конец выполнения"),
        TaskCreateButtonModel(title: "Кнопка")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupScreen()
        setupTableView()
    
        
        
    }
    func configureUI() {
        
        tableView.register(TaskCreateNameCell.self, forCellReuseIdentifier: TaskCreateCellType.taskName.rawValue)
        tableView.register(TaskCreatePeriodCell.self, forCellReuseIdentifier: TaskCreateCellType.repeatingPeriod.rawValue)
        tableView.register(TaskCreateStartCell.self, forCellReuseIdentifier: TaskCreateCellType.start.rawValue)
        tableView.register(TaskCreateButtonCell.self, forCellReuseIdentifier: TaskCreateCellType.createTask.rawValue)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    
    func setupScreen() {
        
        title = "Создание новой задачи"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"chevron.backward"),
                                                           style:.plain,
                                                           target: self,
                                                           action: #selector(buttonTapped))
        navigationController?.navigationBar.tintColor = .black
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor(red: 0.208, green: 0.208, blue: 0.208, alpha: 1)]
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
    }
    
    @objc
    func buttonTapped() {
        dismiss(animated: true)
    }
    
}

extension TaskCreateController: UITableViewDataSource {
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

extension TaskCreateController: UITableViewDelegate {
    
}

extension TaskCreateController {
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
// Добавить сюда кнопку
