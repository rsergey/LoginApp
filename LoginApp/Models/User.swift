//
//  User.swift
//  LoginApp
//
//  Created by Sergey on 18.07.2021.
//

import Foundation

struct User {
    let userName: String
    let password: String
    let email: String
    let person: Person
    
    static func getUser() -> User {
        User(
            userName: "Sergey",
            password: "qwerty",
            email: "rumyantsev.serge@yandex.ru",
            person: Person(
                firstName: "Sergey",
                secondName: "Rumyantsev",
                gender: .male,
                dateOfBirth: DateComponents(
                    calendar: .current,
                    year: 1986,
                    month: 7,
                    day: 10
                ),
                placeOfLiving: "Saint-Petersburg",
                photoFileName: "myPhoto"
            )
        )
    }
}

struct Person {
    let firstName: String
    let secondName: String
    let gender: Gender
    let dateOfBirth: DateComponents
    let placeOfLiving: String
    let photoFileName: String
}

enum Gender: String {
    case male = "👨"
    case female = "👩"
    case unknown = "🙂"
}
