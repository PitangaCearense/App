//
//  AlertWrapper.swift
//  App
//
//  Created by Pedro Sousa on 25/05/21.
//

import SwiftUI

struct AlertWrapper<Content: View>: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let alert: TextAlert
    let content: Content

    func makeUIViewController(context: UIViewControllerRepresentableContext<AlertWrapper>)
    -> UIHostingController<Content> {
        UIHostingController(rootView: content)
    }

    final class Coordinator {
        var alertController: UIAlertController?

        init(_ controller: UIAlertController? = nil) {
            self.alertController = controller
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    func updateUIViewController(_ uiViewController: UIHostingController<Content>,
                                context: UIViewControllerRepresentableContext<AlertWrapper>) {
        uiViewController.rootView = content
        if isPresented && uiViewController.presentedViewController == nil {
            var alert = self.alert
            alert.submitHandler = {
                self.isPresented = false
                self.alert.submitHandler($0)
            }
            context.coordinator.alertController = UIAlertController(alert: alert)
            uiViewController.present(context.coordinator.alertController!, animated: true)
        }

        if !isPresented && uiViewController.presentedViewController == context.coordinator.alertController {
            uiViewController.dismiss(animated: true)
        }
    }
}
