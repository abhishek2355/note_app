import UIKit

extension NoteListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = UIView()
        let headerTitle: UILabel = UILabel()
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.text = sectionTitles[section]
        headerTitle.font = UIFont.boldSystemFont(ofSize: 20)
        headerView.addSubview(headerTitle)
        
        NSLayoutConstraint.activate([
            headerTitle.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 14),
            headerTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = sections[indexPath.section][indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as? NoteTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .systemGray6
        cell.configure(with: note)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let note = sections[indexPath.section][indexPath.row]
        print("Selected: \(note.title)")
    }
}


// MARK: Temporary Data
private let sectionTitles = ["General Notes", "Work Notes", "General Notes", "Work Notes"]

private let sections: [[Note]] = [
    [
        Note(title: "Buy Milk", content: "Don't forget to buy milk on the way home."),
        Note(title: "Call Mom", content: "It's been a while, check in with her.")
    ],
    [
        Note(title: "Buy Milk", content: "Don't forget to buy milk on the way home."),
        Note(title: "Call Mom", content: "It's been a while, check in with her."),
        Note(title: "Meeting Notes", content: "Discussed the roadmap and release schedule."),
        Note(title: "Fix Bugs", content: "Fix the scroll issue on NoteDetailView.")
    ],
    [
        Note(title: "Buy Milk", content: "Don't forget to buy milk on the way home."),
        Note(title: "Call Mom", content: "It's been a while, check in with her.")
    ],
    [
        Note(title: "Buy Milk", content: "Don't forget to buy milk on the way home."),
        Note(title: "Call Mom", content: "It's been a while, check in with her."),
        Note(title: "Meeting Notes", content: "Discussed the roadmap and release schedule."),
        Note(title: "Fix Bugs", content: "Fix the scroll issue on NoteDetailView.")
    ]
]

