//
//  NY_Times_Most_Popular_ArticlesUITestsLaunchTests.swift
//  NY-Times-Most-Popular-ArticlesUITests
//
//  Created by Mouayyad Taja on 20/01/2022.
//

import XCTest

class NY_Times_Most_Popular_ArticlesUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
