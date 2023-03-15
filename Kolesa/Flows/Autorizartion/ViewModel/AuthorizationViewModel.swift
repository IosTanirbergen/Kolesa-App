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
    
    var row: [AuthorizationCellChildEnum] {
        switch self {
        case .newUser:
            return [.phoneNumber, .otp]
        case .defaultUser:
            return [.phoneNumber, .password]
        case .defaultState:
            return [.phoneNumber]
        case .none:
            return []
        }
    }
}

enum AuthorizationCellChildEnum {
    case phoneNumber, password, otp
}

final class AuthorizationViewModel {
    
    //private let builder = AuthorizationBuilder()
    
    var state: [AuthorizationCellEnum] = .init(arrayLiteral: .none)
    
    var updateView: (() -> ())?
    
   // var listOfDate = [KolesaLogoCellViewModel]()
    
    init() {
        loadView()
    }
    
    func loadView() {
        state = .init(arrayLiteral: .defaultState)
//        listOfDate.append(builder.makeLogoTableViewCell(with: .init(formatter: "", action: "", imageName: "kolesa.logo")))
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.updateView?()
        }
        
    }
}
