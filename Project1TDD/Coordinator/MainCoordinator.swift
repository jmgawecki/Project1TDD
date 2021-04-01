//
//  MainCoordinator.swift
//  Project1TDD
//
//  Created by Jakub Gawecki on 01/04/2021.
//

import Foundation
import UIKit

class MainCoordinator {
    var navigationController = UINavigationController()
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let viewController = storyboard.instantiateInitialViewController() as? ViewController else {
            fatalError("Missing initial view controller in Main.storybaord")
        }
        
        navigationController.pushViewController(viewController, animated: false)
    }
    
    
}
