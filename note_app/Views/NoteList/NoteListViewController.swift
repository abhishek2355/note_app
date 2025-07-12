import Foundation
import UIKit

class NoteListViewController: UIViewController, UISearchBarDelegate {
    // MARK: Properties
    
    // Navigation bar
    private lazy var allCloude: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "All iCloud"
        title.font = UIFont.boldSystemFont(ofSize: 30)
        return title
    }()

    private lazy var backButtonNavigationBar: UIBarButtonItem = {
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitle(" Folders", for: .normal)
        backButton.tintColor = AppColors.buttonBackground
        backButton.setTitleColor(AppColors.buttonBackground, for: .normal)
        let backItem = UIBarButtonItem(customView: backButton)
        return backItem
    }()

    private lazy var moreButtonNavigationBar: UIBarButtonItem = {
        let moreButton = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis.circle"),
            style: .plain,
            target: self,
            action: #selector(moreTapped)
        )
        moreButton.tintColor = AppColors.buttonBackground
        return moreButton
    }()
    
    // Search bar
    private lazy var topSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Search"
        searchBar.tintColor = AppColors.buttonBackground
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    // Table view
    private lazy var noteTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray6
        return tableView
    }()
    
    // bottom view
    private lazy var totalNotesNumber: UIView = {
        let label = UILabel()
        label.text = "58 Notes"
        return label
    }()
    
    // MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationItem.leftBarButtonItem = backButtonNavigationBar
        navigationItem.rightBarButtonItem = moreButtonNavigationBar
        
        view.addSubview(allCloude)
        view.addSubview(topSearchBar)
        
        registerTableView()
        view.addSubview(noteTableView)
        
        // Constraints for the views
        addConstraint()
    }
    
    // MARK: Methods
    
    private func registerTableView() {
        noteTableView.dataSource = self
        noteTableView.delegate = self
        noteTableView.register(NoteTableViewCell.self, forCellReuseIdentifier: "NoteTableViewCell")
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            allCloude.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            allCloude.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            allCloude.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            topSearchBar.topAnchor.constraint(equalTo: allCloude.bottomAnchor, constant: 8),
            topSearchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            topSearchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            noteTableView.topAnchor.constraint(equalTo: topSearchBar.bottomAnchor, constant: 15),
            noteTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            noteTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            noteTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    // MARK: - Actions
    @objc private func moreTapped() {
        let alert = UIAlertController(title: "More Options", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Share", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
