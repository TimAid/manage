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
        
        view.backgroundColor = .systemPink
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: TaskViewController())
        let vc3 = UINavigationController(rootViewController: TimerViewController())
        let vc4 = UINavigationController(rootViewController: AnaliticsViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "clock")
        vc2.tabBarItem.image = UIImage(systemName: "note.text.badge.plus")
        vc3.tabBarItem.image = UIImage(systemName: "hourglass.badge.plus")
        vc4.tabBarItem.image = UIImage(systemName: "tortoise")
        
        tabBar.tintColor = .systemBlue
        tabBar.backgroundColor = .white
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
    


}

