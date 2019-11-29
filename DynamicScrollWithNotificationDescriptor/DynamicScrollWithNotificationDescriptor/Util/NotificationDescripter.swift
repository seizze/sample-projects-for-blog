//
//  NotificationDescripter.swift
//  DynamicScroll
//
//  Created by Chaewan Park on 2019/11/29.
//  Copyright © 2019 seizze. All rights reserved.
//

import UIKit

struct NotificationDescriptor<T> {
    let name: Notification.Name
    let convert: (Notification) -> T
}

final class NotificationToken {
    let token: NSObjectProtocol
    let center: NotificationCenter
    
    init(token: NSObjectProtocol, center: NotificationCenter) {
        self.token = token
        self.center = center
    }
    
    deinit {
        center.removeObserver(token)
    }
}

extension NotificationCenter {
    func addObserver<T>(
        with descriptor: NotificationDescriptor<T>,
        using block: @escaping (T) -> ()) -> NotificationToken {
        let token = addObserver(forName: descriptor.name, object: nil, queue: nil) { (note) in
            block(descriptor.convert(note))
        }
        return NotificationToken(token: token, center: self)
    }
}

extension UIViewController {
    static let keyboardWillShow = NotificationDescriptor(
        name: UIResponder.keyboardWillShowNotification,
        convert: KeyboardPayload.init)
    static let keyboardWillHide = NotificationDescriptor(
        name: UIResponder.keyboardWillHideNotification,
        convert: KeyboardPayload.init)
}

