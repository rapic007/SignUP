import UIKit
import RealmSwift

class TaskCreateController: UIViewController {
    
    let tableView: UITableView = .init()
    let createButton = UIButton()
    
    let models: [TaskCreateModel] = [
        TaskCreateNameModel(title: "Название задачи"),
        TaskCreatePeriodModel(title: "Периодичность выполнения"),
        TaskCreateStartFinishModel(startTitle: "Начало выполнения", finishTitle: "Конец выполнения"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupScreen()
        setupTableView()
        setupButton()
    }
    func configureUI() {
        
        tableView.register(TaskCreateNameCell.self, forCellReuseIdentifier: TaskCreateCellType.taskName.rawValue)
        tableView.register(TaskCreatePeriodCell.self, forCellReuseIdentifier: TaskCreateCellType.repeatingPeriod.rawValue)
        tableView.register(TaskCreateStartFinishCell.self, forCellReuseIdentifier: TaskCreateCellType.start.rawValue)
        
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
        tableView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    func setupButton() {
        createButton.setTitle("Создать задачу", for: .normal)
        createButton.titleLabel?.font = UIFont(name: "lato-regular", size: 15)
        createButton.setTitleColor(.white, for: .normal)
        createButton.setTitleColor(.lightGray, for: .highlighted)
        createButton.layer.backgroundColor = UIColor(red: 0.82, green: 0.353, blue: 0.133, alpha: 1).cgColor
        createButton.layer.cornerRadius = 22
        createButton.translatesAutoresizingMaskIntoConstraints = false
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
        let newTask = Task()
        newTask.name = name
        
        StorageManager.saveTask(newTask)
        
        self.dismiss(animated: true)
    }
}

