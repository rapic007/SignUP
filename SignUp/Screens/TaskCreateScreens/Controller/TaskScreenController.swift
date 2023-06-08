import UIKit
import RealmSwift

class TaskScreenController: UIViewController {
    
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
        if cell.image.image?.pngData() == UIImage(named: "timer")?.pngData() {
            cell.timerLabel.text = "aa"
        }
        else {
            cell.timerLabel.text = nil
        }
        return cell
    }
    
    
}

extension TaskScreenController: UITableViewDelegate {
    
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
