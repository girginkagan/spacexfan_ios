//
//  SplashViewController.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import UIKit
import RxSwift
import RxCocoa

protocol SplashViewInputs: AnyObject {
    func prepareUI()
    func onError(err: BaseModelError)
}

protocol SplashViewOutputs: AnyObject {
    func viewDidLoad()
}

final class SplashViewController: UIViewController{
    
    internal var presenter: SplashViewOutputs?
    let _disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

extension SplashViewController: SplashViewInputs{
    
    func onError(err: BaseModelError) {
        AlertUtil.showStandardAlert(parentController: self, title: "Error", message: APIErrorGenerator().generateError(error: err))
    }
    
    func prepareUI() {
        view.backgroundColor = UIColor(named: "color_bg")
        
    }
}

extension SplashViewController: Viewable {}
