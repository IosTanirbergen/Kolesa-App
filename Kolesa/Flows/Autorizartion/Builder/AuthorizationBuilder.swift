//
//  AuthorizationBuilder.swift
//  Kolesa
//
//  Created by Dinmukhamed on 14.03.2023.
//

import UIKit

final class AuthorizationBuilder {
    func makeLogoTableViewCell(with model: AuthorizationModel) -> KolesaLogoCellViewModel {
        return .init(imageName: "kolesa.logo")
    }
}

