import UIKit
import RealmSwift

class TaskScreen: UIViewController {
    
    let tableView: UITableView = .init()
    var refreshControl = UIRefreshControl()
    var tasks: Results<Task>!
    
    
    private let numbersSections = WorkWithDate.getData(daysCount: 4)
    
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
        tasks = realm.objects(Task.self)
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
        }
    }
}

extension TaskScreen: UICollectionViewDataSource  {
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
extension TaskScreen: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.isEmpty ? 0 : tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TaskScreenTableCell

        let task = tasks[indexPath.row]
        cell.nameLabel.text = task.name
        return cell
    }
    
    
}

extension TaskScreen: UITableViewDelegate {
    
}

extension TaskScreen {
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
        let contextItem = UIContextualAction(style: .destructive, title: "Delete") {_,_,_ in
            StorageManager.deleteTask(task)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let swipeAction = UISwipeActionsConfiguration(actions: [contextItem])
        
        return swipeAction
    }
}
