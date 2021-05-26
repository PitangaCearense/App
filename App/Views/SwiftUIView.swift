//
//  SwiftUIView.swift
//  App
//
//  Created by José João Silva Nunes Alves on 25/05/21.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var contents: [Content] = {
         let viewModel = ContentRepository()
//         viewModel.create()
         let result = viewModel.readAll()
//        let serv = CoredataService<Content>()
//        serv.deleteAll()
         return result!
     }()

    var body: some View {
        List {
            ForEach(contents) { content in
                VStack {
                    Text("Name: \(content.name!)")
                    Text("Resource: \(content.resource!)")
                    Text("Type: \(content.type)")
                    Text("Author: \(content.author!)")
                    Text("Date: \(content.date!)")
                    Text("Data: \(content.data!)")
                }
            }
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
