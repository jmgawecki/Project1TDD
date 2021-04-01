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
        
        // That assings a new closure to the pictureSelectAction property on our ViewController()
        viewController.pictureSelectAction = { [weak self] in
            guard let self = self else { return }
            self.showDetail(for: $0)
        }
        
        navigationController.pushViewController(viewController, animated: false)
    }
    
    
    func showDetail(for filename: String) {
        let destVC              = DetailViewController()
        destVC.selectedImage    = filename
        navigationController.pushViewController(destVC, animated: true)
    }
    
    
}
