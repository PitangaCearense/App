//
//  SwiftUIView.swift
//  App
//
//  Created by José João Silva Nunes Alves on 25/05/21.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var contents: [Content] = {
         let viewModel = CategoryRepository()
//         viewModel.create()
//         let result = viewModel.readAll()
//        let serv = CoredataService<Category>()
//        viewModel.addCategory(categoryId: 5)
//        viewModel.addCategory(categoryId: 6)
//        viewModel.addCategory(categoryId: 7)
//        viewModel.addCategory(categoryId: 1)
//        viewModel.addCategory(categoryId: 3)
        viewModel.removeCategory(categoryId: 6)
        let retorno = viewModel.readAll()
    
//        serv.deleteAll()
         return []
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
