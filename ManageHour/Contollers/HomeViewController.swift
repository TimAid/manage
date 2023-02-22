//
//  HomeViewController.swift
//  ManageHour
//
//  Created by Timur Mannapov on 2023/2/11.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - TableView
    private let table: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.estimatedRowHeight = 50
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(table)
        
        table.delegate = self
        table.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        configureNavBar()
    }
    
    // MARK: ConfigureNavBar
    private func configureNavBar() {
        
        navigationItem.title = "ManageHour"
    
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .systemPink
//
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
        
        
        let historyButton = UIButton()
        let historyImage = UIImage(systemName: "list.dash", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .bold))
        historyButton.setImage(historyImage, for: .normal)
        historyButton.tintColor = .white
        historyButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
        historyButton.translatesAutoresizingMaskIntoConstraints = false
        historyButton.addTarget(self, action: #selector(historyBarButtonPressed), for: .touchUpInside)
        
        let magicButton = UIButton()
        let magicImage = UIImage(systemName: "wand.and.stars", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .bold))
        magicButton.setImage(magicImage, for: .normal)
        magicButton.translatesAutoresizingMaskIntoConstraints = false
        magicButton.addTarget(self, action: #selector(magicBatButtonPressed), for: .touchUpInside)
        
        guard let targetView = self.navigationController?.navigationBar else { return }
        
        navigationController?.navigationBar.addSubview(historyButton)
        navigationController?.navigationBar.addSubview(magicButton)
        
        let historyButtonConstraints = [
            historyButton.leadingAnchor.constraint(equalTo: targetView.trailingAnchor, constant: -100),
            historyButton.bottomAnchor.constraint(equalTo: targetView.bottomAnchor, constant: -12)
        ]
        
        let magicButtonConstraints = [
            magicButton.leadingAnchor.constraint(equalTo: targetView.trailingAnchor, constant: -50),
            magicButton.bottomAnchor.constraint(equalTo: targetView.bottomAnchor, constant: -12)
        ]
        
        NSLayoutConstraint.activate(historyButtonConstraints)
        NSLayoutConstraint.activate(magicButtonConstraints)
    }
    override func viewDidLayoutSubviews() {
        table.frame = view.frame
    }
    
    // MARK: objc methods
    @objc private func historyBarButtonPressed() {
        print("history")
    }
    
    @objc private func magicBatButtonPressed() {
        print("magic")
    }
}
// MARK: UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        
//        var content = cell.defaultContentConfiguration()
//        content.text = "test"
//        cell.contentConfiguration = content
        return cell
    }
}
