//
//  HomeView.swift
//  FreeFitness
//
//  Created by W.D. on 21/04/22.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - Private UI Properties
    
    private var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var userLabel: UILabel = {
        let label = UILabel()
        label.textColor = .greenMainColor
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var logOutButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "logOutIcon"), for: .normal)
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(onTapCLogOutAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Exercises"
        label.textColor = .greenMainColor
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: ExerciseTableViewCell.name)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Internal Properties
    
    var userLabelText: String? {
        get { userLabel.text}
        set { userLabel.text = newValue }
    }
    
    var onTapLogOutButtonObservable: Observable<Void> {
        onTapLogOutButton
    }
    
    // MARK: - Private Properties
    
    private var onTapLogOutButton = MutableObservable<Void>()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal Methods
    
    func setTableViewDelegates(_ delegate: UITableViewDelegate, _ datasource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = datasource
    }
    
    func reloadTableViewData() {
        tableView.reloadData()
    }
    
    // MARK: - Private Methods
    
    @objc
    private func onTapCLogOutAction(sender: UIButton!) {
        onTapLogOutButton.postValue(())
    }
    
    private func addSubViews() {
        addSubview(userLabel)
        
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(logOutButton)
        
        addSubview(tableView)

        addConstraints()
    }
    
    private func addConstraints() {
        // userLabel
        userLabel.topAnchor.constraint(equalTo: topAnchor, constant: 90).isActive = true
        userLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        userLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 15).isActive = true
        // containerStackView
        containerStackView.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 20).isActive = true
        containerStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        // titleLabel
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        // logOutButton
        logOutButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        logOutButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        logOutButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        // tableView
        tableView.topAnchor.constraint(equalTo: containerStackView.bottomAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
