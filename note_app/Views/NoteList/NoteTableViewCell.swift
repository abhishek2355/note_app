import UIKit

class NoteTableViewCell: UITableViewCell {
    // MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()

    private lazy var folderImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "folder.fill"))
        image.tintColor = .secondaryLabel
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var notesLabel: UILabel = {
        let time = UILabel()
        time.text = "Notes"
        time.textColor = .secondaryLabel
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()

    private lazy var createdTime: UILabel = {
        let time = UILabel()
        time.text = "8:38 AM"
        time.textColor = .secondaryLabel
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()

    private lazy var cellStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with note: Note) {
        titleLabel.text = note.title
        contentLabel.text = note.content
    }

    private func setupUI() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white

        cellStackView.addArrangedSubview(titleLabel)
        cellStackView.addArrangedSubview(contentLabel)

        contentView.addSubview(cellStackView)
        contentView.addSubview(folderImageView)
        contentView.addSubview(notesLabel)
        contentView.addSubview(createdTime)

        addConstraint()
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            cellStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),

            folderImageView.topAnchor.constraint(equalTo: cellStackView.bottomAnchor, constant: 10),
            folderImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            folderImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            notesLabel.topAnchor.constraint(equalTo: cellStackView.bottomAnchor, constant: 10),
            notesLabel.leadingAnchor.constraint(equalTo: folderImageView.trailingAnchor, constant: 8),
            notesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            createdTime.topAnchor.constraint(equalTo: cellStackView.bottomAnchor, constant: 10),
            createdTime.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            createdTime.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}
