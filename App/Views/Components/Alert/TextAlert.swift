//
//  TextAlert.swift
//  App
//
//  Created by Pedro Sousa on 25/05/21.
//

import SwiftUI

public struct TextAlert {
    public var title: String
    public var message: String?
    public var placeholder: String
    public var okButtonText: String
    public var cancelButtonText: String?
    public var keyboardType: UIKeyboardType
    public var submitHandler: (String?) -> Void
    public var cancelHandler: (() -> Void)?

    init(title: String, message: String? = nil, placeholder: String = "",
         okButtonText: String = "Ok", cancelButtonText: String? = nil,
         keyboardType: UIKeyboardType = .default,
         submitHandler: @escaping (String?) -> Void, cancelHandler: (() -> Void)? = nil) {
        self.title = title
        self.message = message
        self.placeholder = placeholder
        self.okButtonText = okButtonText
        self.cancelButtonText = cancelButtonText
        self.keyboardType = keyboardType
        self.submitHandler = submitHandler
        self.cancelHandler = cancelHandler
    }
}
