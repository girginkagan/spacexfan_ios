//
//  APIErrorGenerator.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import Foundation

public class APIErrorGenerator{
    func generateError(error: BaseModelError) -> String{
        var alertText = ""
        if error.errors != nil{
            for errorModel in error.errors!{
                alertText += errorModel.message!
            }
        }
        else if error.message != nil{
            alertText = error.message!
        }
        
        if alertText == ""{
            alertText = NSLocalizedString("unknownError", comment: "")
        }
        
        return alertText
    }
}
