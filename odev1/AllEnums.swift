//
//  AllEnums.swift.swift
//  odev1
//
//  Created by Oğulcan Tamyürek on 25.09.2022.
//

import Foundation

enum Profession: String, CaseIterable {
    case savasci = "Savaşçı"
    case ciftci = "Çiftçi"
    case insaatci = "İnşaatçı"
    case terzi = "Terzi"
    case saglikci = "Sağlıkçı"

    var userProduct: [ProductModel] {
        switch self {
        case .savasci:
            return [ProductModel(productName: "Uzun Kılıç",
                                 productDetail: "Çift elle tutulabilen kılıç",
                                 productPrice: 200),
                    ProductModel(productName: "Kısa Kılıç",
                                 productDetail: "Tek elle kullanmaya uygun kılıç",
                                 productPrice: 150),
                    ProductModel(productName: "Yay",
                                 productDetail: "Uzun menzilli yay",
                                 productPrice: 100),
                    ProductModel(productName: "Oklar",
                                 productDetail: "100'lü, keskin, demir uçlu ok seti",
                                 productPrice: 50),
                    ProductModel(productName: "Kalkan",
                                 productDetail: "Demir ile güçlendirilmiş meşe kalkan",
                                 productPrice: 100),
                    ProductModel(productName: "Mızrak",
                                 productDetail: "Tüy kadar hafif, yakın ve uzak dövüş mızrağı",
                                 productPrice: 150)]
        case .ciftci:
            return [ProductModel(productName: "Orak",
                                 productDetail: "Ürün hasadı için keskin orak",
                                 productPrice: 75),
                    ProductModel(productName: "Kazma",
                                 productDetail: "Ahşap saplı demir kazma",
                                 productPrice: 75),
                    ProductModel(productName: "Gübre",
                                 productDetail: "20kg yüksek verimli gübre",
                                 productPrice: 100)]
        case .insaatci:
            return [ProductModel(productName: "Tuğla",
                                 productDetail: "250'li ateşte pişmiş taş tuğla",
                                 productPrice: 250),
                    ProductModel(productName: "Çekiç",
                                 productDetail: "Ahşap saplı demir çekiç",
                                 productPrice: 50),
                    ProductModel(productName: "Beton Harcı",
                                 productDetail: "50kg 1. sınıf beton harcı",
                                 productPrice: 200)]
        case .terzi:
            return [ProductModel(productName: "Kumaş",
                                 productDetail: "1 top ipek kumaş",
                                 productPrice: 150),
                    ProductModel(productName: "Makas",
                                 productDetail: "El yapımı demir makas",
                                 productPrice: 50),
                    ProductModel(productName: "Mezura",
                                 productDetail: "150cm uzunluğunda",
                                 productPrice: 30)]
        case .saglikci:
            return [ProductModel(productName: "Alkol",
                                 productDetail: "1lt yüksek saflıkta alkol",
                                 productPrice: 50),
                    ProductModel(productName: "Sargı Bezi",
                                 productDetail: "20mt sargı bezi",
                                 productPrice: 20),
                    ProductModel(productName: "Ağrı Kesici",
                                 productDetail: "50 tablet",
                                 productPrice: 25)]
        }
    }
}

enum Gender: String, CaseIterable {
    case male = "Erkek"
    case female = "Kadın"
}

enum PaymentMethods: String, CaseIterable {
    case cashOnDelivery = "Kapıda Ödeme"
    case creditCard = "Kredi Kartı ile Online Ödeme"
}

enum Race: String, CaseIterable {
    case insan = "İnsan"
    case elf = "Elf"
    case cuce = "Cüce"
}

