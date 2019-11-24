//
//  SmackScreen.swift
//  Smack(10)UITests
//
//  Created by Maksim Egorov on 11/23/19.
//  Copyright © 2019 Max E. All rights reserved.
//

import XCTest

class SmackScreen: BaseScreen {

    private let smackBurgerButton: XCUIElement = app.buttons["smackBurger"]

    required init() {
        super.init()

        visible()
    }
    
    func tapSmackBurgerButton() -> ChannelsScreen {
        tap(smackBurgerButton)
        return ChannelsScreen()
    }
    
    

}

// MARK: - Visibility

extension SmackScreen {
    private func visible() {
        guard smackBurgerButton.waitForExistence(timeout: timeout) else {
            XCTFail("SmackScreen is not visible, cant find smackBurgerButton")
            return
        }
    }
}

