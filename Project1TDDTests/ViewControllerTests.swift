//
//  ViewControllerTests.swift
//  ViewControllerTests
//
//  Created by Jakub Gawecki on 30/03/2021.
//

import XCTest
@testable import Project1TDD

class ViewControllerTests: XCTestCase {
    func testLoadingImages() {
        // Arrange
        let sut = ViewController()
        
        
        // Act
        sut.loadViewIfNeeded()
        
        
        // Assert
        XCTAssertEqual(sut.pictures.count, 10, "There should be ten pictures.")
    }
    
    func testTableExists() {
        // Arrange
        let sut = ViewController()
        
        
        // Act
        sut.loadViewIfNeeded()
        
        
        // Assert
        XCTAssertNotNil(sut.tableView)
    }
    
    
    func testTableViewHasCorrectRowCount() {
        // Arrange
        let sut = ViewController()
        
        
        // Act
        sut.loadViewIfNeeded()
        let rowCount = sut.tableView.numberOfRows(inSection: 0)
        
        
        // Assert
        XCTAssertEqual(rowCount, 10)
    }
    
    
    func testEachCellHasTheCorrectText() {
        // Arrange
        let sut = ViewController()
        
        
        // Act
        sut.loadViewIfNeeded()
        
        
        // Assert
        for (index, picture) in sut.pictures.enumerated() {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)
            XCTAssertEqual(cell.textLabel?.text, picture)
        }
    }
    
    
    func testCellsHaveDisclosureIndicator() {
        // Arrange
        let sut = ViewController()
        
        
        // Act
        sut.loadViewIfNeeded()
        
        
        // Assert
        for index in sut.pictures.indices {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)
            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
    }
    
    
    func testViewControllerUsesLargeTitles() {
        // Arrange
        let sut = ViewController()
        _ = UINavigationController(rootViewController: sut)
        
        
        // Act
        sut.loadViewIfNeeded()
        
        
        // Assert
        XCTAssertTrue(sut.navigationController?.navigationBar.prefersLargeTitles ?? false)
    }
    
    
    func testViewControllerHasStormViewerTitle() {
        // Arrange
        let sut = ViewController()
        
        
        // Act
        sut.loadViewIfNeeded()
        
        
        // Assert
        XCTAssertEqual(sut.title, "Storm Viewer")
    }
    
    // Slightly appriopriate way when not using coordinators
//    func testSelectingImageShowsDetail() {
//        // Arrange
//        let sut = ViewController()
//        let navigationController = UINavigationController(rootViewController: sut)
//        let testIndexPath = IndexPath(row: 0, section: 0)
//
//
//        // Act
//        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
//
//
//        // Create an expectation...
//        let expectation = XCTestExpectation(description: "Selecteing a table view cell.")
//
//
//        // ...then fulfill it asynchronously
//        DispatchQueue.main.async {
//            expectation.fulfill()
//        }
//
//
//        // Assert
//        wait(for: [expectation], timeout: 1)
//        XCTAssertTrue(navigationController.topViewController is DetailViewController)
//    }
    
    
    func testSelectingImageShowsDetails() {
        // Arrange
        let sut = ViewController()
        var selectedImage: String?
        let testIndexPath = IndexPath(row: 0, section: 0)
        
        
        // Act
        sut.pictureSelectAction = {
            selectedImage = $0
        }
        
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        
        
        // Assert
        XCTAssertEqual(selectedImage, "nssl0049.jpg")
    }
    
    
    // That one is also allright when not using Coordinator
//    func testSelectingImageShowsDetailImage() {
//        // Arrange
//        let sut                     = ViewController()
//        let navigationController    = UINavigationController(rootViewController: sut)
//        let testIndexPath           = IndexPath(row: 0, section: 0)
//
//        let fileNameToTest          = "nssl0049.jpg"
//        let imageToLoad             = UIImage(named: fileNameToTest, in: Bundle.main, compatibleWith: nil)
//
//
//        // Act
//        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
//
//        let expectation = XCTestExpectation(description: "Selecting a table view cell.")
//
//        DispatchQueue.main.async { expectation.fulfill() }
//
//
//        // Assert
//        wait(for: [expectation], timeout: 1)
//
//        guard let detail = navigationController.topViewController as? DetailViewController else {
//            XCTFail("Didn't push to DetailViewController.")
//            return
//        }
//
//        detail.loadViewIfNeeded()
//
//        XCTAssertEqual(detail.imageView.image, imageToLoad)
//    }
    
    
    func testSelectingImageShowsDetailImage() {
        // Arrange
        let sut = ViewController()
        let testIndexPath = IndexPath(row: 0, section: 0)
        let fileNameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: fileNameToTest, in: Bundle.main, compatibleWith: nil)
        
        
        // Act
        sut.pictureSelectAction = {
            let detailVC = DetailViewController()
            detailVC.selectedImage = $0
            detailVC.loadViewIfNeeded()
            XCTAssertEqual(detailVC.imageView.image, imageToLoad)
        }
        
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
    }
    
    
    
}
