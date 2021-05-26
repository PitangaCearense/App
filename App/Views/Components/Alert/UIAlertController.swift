//
//  UIAlertController.swift
//  App
//
//  Created by Pedro Sousa on 25/05/21.
//

import SwiftUI

extension UIAlertController {
    convenience init(alert: TextAlert) {
        self.init(title: alert.title, message: alert.message, preferredStyle: .alert)

        self.addTextField {
            $0.placeholder = alert.placeholder
            $0.keyboardType = alert.keyboardType
        }

        if let cancel = alert.cancelButtonText {
            self.addAction(UIAlertAction(title: cancel, style: .cancel, handler: { _ in
                alert.cancelHandler?()
            }))
        }

        let textField = self.textFields?.first
        self.addAction(UIAlertAction(title: alert.okButtonText, style: .default) { _ in
            alert.submitHandler(textField?.text)
        })

        self.overrideUserInterfaceStyle = .dark
    }
}
