import UIKit

class TaskTypeController: UIViewController {

    var taskCell = TasksType.fillSell()
    let tableView: UITableView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        tableView.register(TaskTypeCell.self, forCellReuseIdentifier: "TaskTypeCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }

}

extension TaskTypeController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskCell.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTypeCell", for: indexPath) as? TaskTypeCell
        else { fatalError() }
        
        cell.configure(taskCell: taskCell[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let viewForLabel = UIView(frame: CGRect(x: 0, y: 0, width: 172, height: 22))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 172, height: 22))
        label.text = "Выберите тип задачи"
        label.font = UIFont(name: "lato-regular", size: 17)
        viewForLabel.addSubview(label)
        
        view.addSubview(viewForLabel)
        
        
        viewForLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewForLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            viewForLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
        ])
        
        return viewForLabel
    }
}

extension TaskTypeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = TaskCreateController()
        let ui = UINavigationController(rootViewController: vc)
        ui.modalPresentationStyle = .fullScreen
        present(ui, animated: true)
        
    }
}

extension TaskTypeController {
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
 
        
        ])
    }
}
