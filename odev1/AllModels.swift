//
//  AllModels.swift
//  odev1
//
//  Created by Oğulcan Tamyürek on 25.09.2022.
//

import Foundation

struct UserModel {
    var profession: Profession?
    var name: String?
    var gender: Gender?
    var paymentMethod: PaymentMethods?
    var race: Race?
    var userBalance: Int?
}

struct ProductModel {
    var productName: String
    var productDetail: String
    var productPrice: Int
}

