//
//  DetailViewControllerTests.swift
//  ViewControllerTests
//
//  Created by Jakub Gawecki on 30/03/2021.
//

import XCTest
@testable import Project1TDD

class DetailViewControllerTests: XCTestCase {

    func testDetailImageViewExists() {
        // Assert
        let sut = DetailViewController()
        
        
        // Act
        sut.loadViewIfNeeded()
        
        
        // Assert
        XCTAssertNotNil(sut.imageView)
    }
    
    
    func testDetailviewIsImageView() {
        // Arrange
        let sut = DetailViewController()
        
        
        // Act
        sut.loadViewIfNeeded()
        
        
        // Assert
        XCTAssertEqual(sut.view, sut.imageView)
    }
    
    
    func testDetailLoadsImage() {
        // Arrange
        let filenameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: filenameToTest, in: Bundle.main, compatibleWith: nil)
        
        let sut = DetailViewController()
        sut.selectedImage = filenameToTest
        
        // Act
        sut.loadViewIfNeeded()
        
        
        // Arrange
        XCTAssertEqual(sut.imageView.image, imageToLoad)
    }
    
    
    
    
}
