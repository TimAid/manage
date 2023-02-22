//
//  ViewController.swift
//  ManageHour
//
//  Created by Timur Mannapov on 2023/2/11.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
        let navView1 = UINavigationController(rootViewController: HomeViewController())
        let navView2 = UINavigationController(rootViewController: TaskViewController())
        let navView3 = UINavigationController(rootViewController: TimerViewController())
        let navView4 = UINavigationController(rootViewController: AnaliticsViewController())
        
        navView1.tabBarItem.image = UIImage(systemName: "clock")
        navView2.tabBarItem.image = UIImage(systemName: "note.text.badge.plus")
        navView3.tabBarItem.image = UIImage(systemName: "hourglass.badge.plus")
        navView4.tabBarItem.image = UIImage(systemName: "tortoise")
        
        tabBar.tintColor = .systemBlue
        tabBar.backgroundColor = .white
        setViewControllers([navView1, navView2, navView3, navView4], animated: true)
    }
}
