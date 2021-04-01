//
//  DetailViewController.swift
//  Project1TDD
//
//  Created by Jakub Gawecki on 30/03/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    let imageView = UIImageView()
    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        
    }
    
    
    override func loadView() {
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        view = imageView
    }
    
    
    private func loadImage() {
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
