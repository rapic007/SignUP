import UIKit

class CreatingTaskController: UIViewController {
    
    let tableView: UITableView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        setupTableView()
    
        tableView.register(CreatingTaskCell.self, forCellReuseIdentifier: "FirstCellCreatingTask")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func setupScreen() {
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
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

extension CreatingTaskController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCellCreatingTask",
                                                       for: indexPath) as? CreatingTaskCell else { fatalError()}
        return cell
    }
    
}

extension CreatingTaskController: UITableViewDelegate {
    
}

extension CreatingTaskController {
    
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
