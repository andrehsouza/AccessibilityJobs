//
//  JobModel.swift
//  ConcreteJobs
//
//  Created by andre.luiz.de.souza on 12/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import UIKit

enum JobIcon: String, CaseIterable {
    
    case android = "android"
    case ios = "ios"
    case design = "design"
    case qa = "qa"
    case sm = "agile"
    case net = ".net"
    case java = "java"
    case devops = "devops"
    case front = "front-end"
    case product = "product"
    
    var icon: UIImage {
        switch self {
        case .android:
            return Asset.Images.icAndroid.image
        case .ios:
            return Asset.Images.iciOS.image
        case .design:
            return Asset.Images.icDesign.image
        case .qa:
            return Asset.Images.icQA.image
        case .sm:
            return Asset.Images.icSM.image
        case .net: fallthrough
        case .java:
            return Asset.Images.icJavaNet.image
        case .devops:
            return Asset.Images.icDevops.image
        case .front:
            return Asset.Images.icFront.image
        case .product:
            return Asset.Images.icProduct.image
        }
    }
    
}

struct JobModel: Codable {
    
    let title: String
    let location: String
    let date: String
    let applyLink: String
    let jobDescription: String
    let companyDescription: String
    
    private let jobColors: [JobColor] = [JobColor(mainColor: Asset.Colors.weirdGreen.color, contrastColor: .black),
                                          JobColor(mainColor: Asset.Colors.skyBlue.color, contrastColor: .black),
                                          JobColor(mainColor: Asset.Colors.brightBlue.color, contrastColor: .white),
                                          JobColor(mainColor: Asset.Colors.bluePurple.color, contrastColor: .white),
                                          JobColor(mainColor: Asset.Colors.blueBerry.color, contrastColor: .white),
                                          JobColor(mainColor: Asset.Colors.spaceGray.color, contrastColor: .white)]
    
    
    var icon: UIImage {
        let result = JobIcon.allCases.filter({ title.lowercased().contains($0.rawValue) }).first
        return result?.icon ?? Asset.Images.icDefault.image
    }
    
    func color(at index: Int) -> JobColor {
        return jobColors[index % jobColors.count]
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case location = "joblocation"
        case date = "pubDate"
        case applyLink = "jobFinalLink"
        case jobDescription = "quals"
        case companyDescription = "description"
    }
    
}
