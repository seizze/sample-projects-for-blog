//
//  KeyboardPayload.swift
//  DynamicScroll
//
//  Created by Chaewan Park on 2019/11/29.
//  Copyright © 2019 seizze. All rights reserved.
//

import UIKit

struct KeyboardPayload {
    let beginFrame: CGRect
    let endFrame: CGRect
}

extension KeyboardPayload {
    init(note: Notification) {
        let userInfo = note.userInfo
        beginFrame = userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as! CGRect
        endFrame = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
    }
}
