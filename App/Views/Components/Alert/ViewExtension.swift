//
//  ViewExtension.swift
//  App
//
//  Created by Pedro Sousa on 25/05/21.
//

import SwiftUI

extension View {
    public func alert(isPresented: Binding<Bool>, _ alert: TextAlert) -> some View {
        AlertWrapper(isPresented: isPresented, alert: alert, content: self)
    }
}
