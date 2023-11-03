//
//  CarDatas.swift
//  CarRentalApp
//
//  Created by Ayan on 01.11.23.
//

import Foundation
import CoreData

class CarDatas {
    
    let coreData = CoreData(context: AppDelegate().persistentContainer.viewContext)
    let coreDataForCategory = CoredataForCategory(context: AppDelegate().persistentContainer.viewContext)
    
    func loadData() {
        
        //categories
         let category1 = CategoryModel (
            name: "Prestige",
            image: "car1",
            size: "3")
        coreDataForCategory.saveData(categoryModel: category1)
        
        let category2 = CategoryModel (
            name: "Econom",
            image: "car2",
            size: "3")
        coreDataForCategory.saveData(categoryModel: category2)
        
        let category3 = CategoryModel (
            name: "SUV",
            image: "car3",
            size: "3")
        coreDataForCategory.saveData(categoryModel: category3)
        
        let category4 = CategoryModel (
            name: "Standart",
            image: "car1",
            size: "2")
        coreDataForCategory.saveData(categoryModel: category4)
        
        
        //cars
        let car1 = CarModel(
        image: "car1",
        price: "20000",
        name: "Toyota 1",
        engine: "2 CYL 1.5 L",
        category: category1)
        coreData.saveData(carModel: car1)
        
        let car2 = CarModel(
            image: "car2",
            price: "30000",
            name: "Toyota 2",
            engine: "1 CYL 1.5 L",
            category: category1)
        coreData.saveData(carModel: car2)
        
        let car3 = CarModel(
            image: "car3",
            price: "40000",
            name: "Toyota 3",
            engine: "2 CYL 1 L",
            category: category1)
        coreData.saveData(carModel: car3)
        
        let car4 = CarModel(
            image: "car1",
            price: "50000",
            name: "Toyota 4",
            engine: "2 CYL 3.5 L",
            category: category2)
        coreData.saveData(carModel: car4)
        
        let car5 = CarModel(
            image: "car2",
            price: "55000",
            name: "Toyota 5",
            engine: "4 CYL 1.5 L",
            category: category2)
        coreData.saveData(carModel: car5)
        
        let car6 = CarModel(
            image: "car3",
            price: "60000",
            name: "Toyota 6",
            engine: "2 CYL 4 L",
            category: category2)
        coreData.saveData(carModel: car6)
        
        let car7 = CarModel(
            image: "car1",
            price: "70000",
            name: "Toyota 7",
            engine: "5 CYL 1.5 L",
            category: category3)
        coreData.saveData(carModel: car7)
        
        let car8 = CarModel(
            image: "car2",
            price: "80000",
            name: "Toyota 8",
            engine: "6 CYL 3.5 L",
            category: category3)
        coreData.saveData(carModel: car8)
        
        let car9 = CarModel(
            image: "car3",
            price: "90000",
            name: "Toyota 9",
            engine: "5 CYL 1.5 L",
            category: category3)
        coreData.saveData(carModel: car9)
        
        let car10 = CarModel(
            image: "car1",
            price: "100000",
            name: "Toyota 10",
            engine: "6 CYL 4.5 L",
            category: category4)
        coreData.saveData(carModel: car10)
        
        let car11 = CarModel(
            image: "car2",
            price: "150000",
            name: "Toyota 11",
            engine: "2 CYL 1.5 L",
            category: category4)
        coreData.saveData(carModel: car11)
    }
}

