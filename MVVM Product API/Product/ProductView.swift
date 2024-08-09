//
//  ContentView.swift
//  MVVM Product API
//
//  Created by Md Khorshed Alam on 7/8/24.
//

import SwiftUI

struct ProductView: View {
    @ObservedObject var viewModel = ProductViewModel()
    var body: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
        ScrollView{
            VStack {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.product ?? [], id: \.id) { user in
                        VStack{
                            AsyncImage(url: URL(string: user.image ?? "")){ image in
                                image.resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .clipShape(Circle())
                            } placeholder: {
                                Color.red
                            }.frame(width: 80, height: 80)
                                .clipShape(.rect(cornerRadius: 25))
                            Text(String(format: "Rating: %.2f", user.rating.rate ?? 0.0))
                                .font(.system(size: 12))
                                .font(.system(size: 14))
                            Text(user.category ?? "Not Found").font(.system(size: 16)).fontWeight(.bold)
                            Text(user.title ?? "Not Found").font(.system(size: 14))
                        }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                if viewModel.isLoading {
                                LoaderView()
                            }
            }.onAppear{
                Task{
                    await viewModel.getUsers()
                }
            }.padding(EdgeInsets(top: 50, leading: 15, bottom: 0, trailing: 15)).alert(isPresented: $viewModel.shouldShowAlert) {
                return Alert(
                    title: Text("Error"),
                    message: Text(viewModel.userError?.errorDescription ?? "")
                )
            }
        }
    }
}

#Preview {
    ProductView()
}
