//
//  Services.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import Alamofire
import AlamofireMapper

class Services{
    let baseUrl = "https://api.themoviedb.org/3/"
    
    //MARK: get
    /*public func get(page: String, successCompletion: @escaping ((_ json : BaseModel<ResponseModel>) -> Void), errorCompletion: @escaping ((_ message : BaseModelError) -> Void)){
        Alamofire.request(baseUrl + "", method: .get, parameters: nil).responseObject { (response : DataResponse<BaseModel<ResponseModel>>) in
            switch response.result {
            case .success(let json):
                if response.response!.statusCode == APIStatusCodes.Success.rawValue{
                    successCompletion(json)
                }
                else{
                    print(response.result)
                    errorCompletion(BaseModelError(errorCode: response.response!.statusCode, message: "An unknown error occured.", errors: nil))
                }
                break
            case .failure(let error):
                errorCompletion(BaseModelError(errorCode: nil, message: nil, errors: [ErrorData(field: APIErrors.Alamofire.rawValue, message: error.localizedDescription)]))
                break
            }
        }
    }*/
}
