//
//  Services.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import Alamofire
import AlamofireMapper

class Services{
    let baseUrl = "https://api.spacexdata.com/v4/"
    
    //MARK: getAllRockets
    public func getAllRockets(successCompletion: @escaping ((_ json : RocketsResponseModel) -> Void), errorCompletion: @escaping ((_ message : BaseModelError) -> Void)){
        Alamofire.request(baseUrl + "rockets", method: .get, parameters: nil).responseObject { (response : DataResponse<RocketsResponseModel>) in
            switch response.result {
            case .success(let json):
                if response.response!.statusCode == APIStatusCodes.Success.rawValue{
                    successCompletion(json)
                }
                else{
                    print(response.result)
                    errorCompletion(BaseModelError(errorCode: response.response!.statusCode, message: NSLocalizedString("unknownError", comment: ""), errors: nil))
                }
                break
            case .failure(let error):
                errorCompletion(BaseModelError(errorCode: nil, message: nil, errors: [ErrorData(field: APIErrors.Alamofire.rawValue, message: error.localizedDescription)]))
                break
            }
        }
    }
    
    //MARK: getUpcomings
    public func getUpcomings(successCompletion: @escaping ((_ json : UpcomingsResponseModel) -> Void), errorCompletion: @escaping ((_ message : BaseModelError) -> Void)){
        Alamofire.request(baseUrl + "launches/upcoming", method: .get, parameters: nil).responseObject { (response : DataResponse<UpcomingsResponseModel>) in
            switch response.result {
            case .success(let json):
                if response.response!.statusCode == APIStatusCodes.Success.rawValue{
                    successCompletion(json)
                }
                else{
                    print(response.result)
                    errorCompletion(BaseModelError(errorCode: response.response!.statusCode, message: NSLocalizedString("unknownError", comment: ""), errors: nil))
                }
                break
            case .failure(let error):
                errorCompletion(BaseModelError(errorCode: nil, message: nil, errors: [ErrorData(field: APIErrors.Alamofire.rawValue, message: error.localizedDescription)]))
                break
            }
        }
    }
}
