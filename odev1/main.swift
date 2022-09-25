//
//  main.swift
//  odev1
//
//  Created by Oğulcan Tamyürek on 25.09.2022.
//

import Foundation

let professionArray = Profession.allCases
let raceArray = Race.allCases
let genderArray = Gender.allCases
let paymentMethodArray = PaymentMethods.allCases
var user = UserModel()
var basketItem: ProductModel? = nil

print("""
      Orta Dünya Sepeti'ne Hoş Geldiniz!
      Alışverişe başlamak için kayıt olunuz!
      """)

getUserType()

func getUserType() {
    print("\nMesleğinizi seçiniz:")
    for (index, item) in professionArray.enumerated() {
        print("\(index + 1) - \(item.rawValue)", separator: "\n")
    }
    let professionInput = readLine()
    if let professionInt = Int(professionInput ?? "0"),
       professionInt <= professionArray.count,
       professionInt > 0 {
        user.profession = professionArray[professionInt - 1]
        switch professionArray[professionInt - 1] {
        case .savasci:
            user.userBalance = 500
        case .ciftci:
            user.userBalance = 300
        case .insaatci:
            user.userBalance = 500
        case .terzi:
            user.userBalance = 400
        case .saglikci:
            user.userBalance = 500
        }
        getUserName()
    } else {
        print("Please select a valid type!")
        getUserType()
    }
}

func getUserName() {
    print("\nİsminizi yazınız:")
    let name = readLine()
    if let validName = name, validName != "" {
        user.name = validName
        getUserRace()
    } else {
        getUserName()
    }
}

func getUserRace() {
    print("\nIrkınızı seçiniz:")
    for (index, item) in raceArray.enumerated() {
        print("\(index + 1) - \(item.rawValue)", separator: "\n")
    }
    let raceInput = readLine()
    if let raceInt = Int(raceInput ?? "0"),
       raceInt <= raceArray.count,
       raceInt > 0 {
        user.race = raceArray[raceInt - 1]
        getUserGender()
    } else {
        print("Please select a valid type!")
        getUserRace()
    }
}

func getUserGender() {
    print("\nCinsiyetinizi seçiniz:")
    for (index, item) in genderArray.enumerated() {
        print("\(index + 1) - \(item.rawValue)", separator: "\n")
    }
    let genderInput = readLine()
    if let genderInt = Int(genderInput ?? "0"),
       genderInt <= genderArray.count,
       genderInt > 0 {
        user.gender = genderArray[genderInt - 1]
        getProducts()
    } else {
        print("Please select a valid type!")
        getUserGender()
    }
}

func getProducts() {
    print("""

          Hoşgeldiniz sayın \(user.race!.rawValue) ırkından \(user.profession!.rawValue) \(user.name!).
          İşte sizin için önerdiğimiz ürünler:
          """)
    guard let userProductsModel = user.profession?.userProduct else { fatalError() }

    for (index, item) in userProductsModel.enumerated() {
        print("\(index + 1) - \(item.productName)", separator: "\n")
    }
    let selectedProduct = readLine()
    if let selectedInt = Int(selectedProduct ?? "0"),
       selectedInt <= userProductsModel.count,
       selectedInt > 0  {
        let selectedItem = userProductsModel[selectedInt - 1]
        basketItem = selectedItem
        print("""

Seçtiğiniz ürün \(selectedItem.productName): \(selectedItem.productDetail) ve fiyatı sadece \(selectedItem.productPrice) altın

Satın almak için 1,
Tüm ürünleri görmek için 2'yi tuşlayınız.
""")
        handleItemSelection()
    }
}

func handleItemSelection() {
    let userInput = readLine()
    if let intUserInput = Int(userInput ?? "0") {
        if intUserInput == 1 {
            getPaymentMethods()
        } else if intUserInput == 2 {
            getProducts()
        } else {
            handleItemSelection()
        }
    }
}

func getPaymentMethods() {
    print("\nSeçtiğiniz ürün \(basketItem?.productPrice ?? 0) altın")
    print("Kart bakiyeniz \(user.userBalance!) altın")
    print("Ödeme yöntemi seçiniz, satın almak istemiyorsanız 0'ı tuşlayınız")
    for (index, item) in paymentMethodArray.enumerated() {
        print("\(index + 1) - \(item.rawValue)", separator: "\n")
    }
    let selectedItem = readLine()
    if selectedItem == "0" {
        getProducts()
    }
    if let selectedInt = Int(selectedItem ?? "0"),
       selectedInt <= paymentMethodArray.count,
       selectedInt > 0  {
        let selectedMethod = paymentMethodArray[selectedInt - 1]
        switch selectedMethod {
        case .cashOnDelivery:
            print("\nSiparişiniz üç iş günü içinde kuryeye verilecektir, \(basketItem!.productPrice) altın ve +5 altın kapıda ödeme bedeli alınacaktır")
            getProducts()
        case .creditCard:
            if user.userBalance! < basketItem!.productPrice {
                print("\n**********************")
                print("BAKİYENİZ YETERSİZDİR!")
                print("**********************")
                getPaymentMethods()
            } else {
                user.userBalance! -= basketItem!.productPrice
                print("\nÖdeme başarıyla alınmıştır, siparişiniz üç iş günü içinde kuryeye verilecektir.")
                print("\nKalan bakiyeniz: \(user.userBalance!) altın")
                getProducts()
            }
        }
    }
}
