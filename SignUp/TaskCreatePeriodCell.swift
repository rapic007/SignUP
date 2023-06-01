import UIKit

class TaskCreatePeriodCell: UITableViewCell, TaskCreateCell {
    let repeatingPeriodLabel = CustomLabel()
    let everyDayView = CustomView()
    let onWeekdaysView = CustomView()
    let monthlyView = CustomView()
    let everyYearView = CustomView()
    let onceView = CustomView()
    let chooseDayView = CustomView()
    
    var model: TaskCreatePeriodModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: TaskCreateModel) {
        guard let model = model as? TaskCreatePeriodModel else {
            return
        }
        self.model = model
        configureUI()
    }
    
    func configureUI() {
        repeatingPeriodLabel.text = model?.title
    }
    
    func setupCell() {
        contentView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        repeatingPeriodLabel.setupLabel(size: 13)
        
        everyDayView.labelAndButtonView(text: "Ежедневно")
        onWeekdaysView.labelAndButtonView(text: "По будням")
        monthlyView.labelAndButtonView(text: "Ежемесячно")
        everyYearView.labelAndButtonView(text: "Ежегодно")
        onceView.labelAndButtonView(text: "Один раз")
        chooseDayView.labelAndButtonView(text: "Выбрать дни недели")


        [repeatingPeriodLabel, everyDayView, onWeekdaysView, monthlyView, everyYearView, onceView, chooseDayView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
          
//            На каждую вюху повесить обработчик нажатий.
//            + тег на каждую вьюшку
//            В обработчике идет проверка нажатия кнопки. Кнопку узнаем по тегу
//            
            
        }
        
        NSLayoutConstraint.activate([
            
            repeatingPeriodLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            repeatingPeriodLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            repeatingPeriodLabel.widthAnchor.constraint(equalToConstant: 295),
                        
            everyDayView.topAnchor.constraint(equalTo: repeatingPeriodLabel.bottomAnchor, constant: 13),
            everyDayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            everyDayView.heightAnchor.constraint(equalToConstant: 35),
            everyDayView.widthAnchor.constraint(equalToConstant: 128),
            
            onWeekdaysView.leadingAnchor.constraint(equalTo: everyDayView.trailingAnchor, constant: 12),
            onWeekdaysView.centerYAnchor.constraint(equalTo: everyDayView.centerYAnchor),
            onWeekdaysView.heightAnchor.constraint(equalToConstant: 35),
            onWeekdaysView.widthAnchor.constraint(equalToConstant: 124),

            monthlyView.topAnchor.constraint(equalTo: everyDayView.bottomAnchor, constant: 9),
            monthlyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            monthlyView.widthAnchor.constraint(equalToConstant: 135),
            monthlyView.heightAnchor.constraint(equalToConstant: 35),

            everyYearView.centerYAnchor.constraint(equalTo: monthlyView.centerYAnchor),
            everyYearView.centerXAnchor.constraint(equalTo: onWeekdaysView.centerXAnchor),
            everyYearView.widthAnchor.constraint(equalToConstant: 118),
            everyYearView.heightAnchor.constraint(equalToConstant: 35),

            onceView.topAnchor.constraint(equalTo: monthlyView.bottomAnchor, constant: 9),
            onceView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            onceView.widthAnchor.constraint(equalToConstant: 114),
            onceView.heightAnchor.constraint(equalToConstant: 35),

            chooseDayView.leadingAnchor.constraint(equalTo: onceView.trailingAnchor, constant: 12),
            chooseDayView.centerYAnchor.constraint(equalTo: onceView.centerYAnchor),
            chooseDayView.widthAnchor.constraint(equalToConstant: 194),
            chooseDayView.heightAnchor.constraint(equalToConstant: 35),
            chooseDayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32)
        ])
    }
}
