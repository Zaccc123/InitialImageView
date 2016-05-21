//
//  InitialImageViewExampleTests.swift
//  InitialImageViewExampleTests
//
//  Created by Zac on 21/5/16.
//  Copyright © 2016 Zac. All rights reserved.
//

import XCTest
@testable import InitialImageViewExample

class InitialImageViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testImageIsSet() {
        
        let imageView = InitialImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        XCTAssertNil(imageView.image)
        imageView.setImageWithInitial("ZK", backgroundColor: UIColor.greenColor(), circle: true)
        XCTAssertNotNil(imageView.image)
    }
    
    func testDrawingPerformance() {
        // This is an example of a performance test case.
        let imageView = InitialImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        self.measureBlock {
            // Put the code you want to measure the time of here.
            for _ in 0...999 {
                imageView.setImageWithInitial("ZK", backgroundColor: UIColor.greenColor(), circle: true)
            }
        }
    }
    
}
