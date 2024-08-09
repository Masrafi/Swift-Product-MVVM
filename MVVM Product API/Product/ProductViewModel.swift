//
//  ProductViewModel.swift
//  MVVM Product API
//
//  Created by Masrafi Anam on 7/8/24.
//
import Foundation

@MainActor
final class ProductViewModel: ObservableObject {
    
    @Published var product: [ProductModel]?
    @Published var userError: UserError?
    @Published var shouldShowAlert = false
    @Published var isLoading = false
    
    func getUsers() async {
        isLoading = true
        do {
            self.product = try await WebService.getUsersData()
            self.isLoading = false
        } catch(let error) {
            userError = UserError.custom(error: error)
            shouldShowAlert = true
            isLoading = false
        }
    }
}
