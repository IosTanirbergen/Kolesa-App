//
//  AuthorizationViewModel.swift
//  Kolesa
//
//  Created by Dinmukhamed on 14.03.2023.
//
import Foundation

enum AuthorizationCellEnum {
    case defaultState
    case newUser
    case defaultUser
    case none
    
}
final class AuthorizationViewModel {
    
    var state: AuthorizationCellEnum = .none
    
    var userNumber: String = ""
    
    var updateView: (() -> ())?
    
    init() {
        loadView()
    }
    
    func loadView() {
        state = .defaultState
        updateView?()
        
    }
    func updateState(state: AuthorizationCellEnum) {
        self.state = state
        updateView?()
    }
    func changeNumber(state: AuthorizationCellEnum, phoneNumber: String) {
        self.state = state
        self.userNumber = phoneNumber
        updateView?()
    }
    
}
