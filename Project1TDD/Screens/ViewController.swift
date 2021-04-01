//
//  ViewController.swift
//  Project1TDD
//
//  Created by Jakub Gawecki on 30/03/2021.
//

import UIKit

class ViewController: UITableViewController {
    // MARK: - Declaration
    
    var pictures = [String]()
    var pictureSelectAction: ((String) -> Void)?
    
    
    // MARK: - Override and Initialise
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPictures()
        configureVC()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
    }
    
    
    private func configureVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Storm Viewer"
    }
    
    
    private func loadPictures() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pictureSelectAction?(pictures[indexPath.row])
    }
}
