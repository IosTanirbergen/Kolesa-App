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
    
    var userMail: String = ""
    
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
    func changeNumber(state: AuthorizationCellEnum, mail: String) {
        self.state = state
        self.userMail = mail
        updateView?()
    }
    
}
