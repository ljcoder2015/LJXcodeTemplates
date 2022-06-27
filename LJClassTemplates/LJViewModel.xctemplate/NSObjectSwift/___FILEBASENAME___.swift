//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//  GitHub: https://github.com/ljcoder2015
//

import UIKit
import RxSwift
import RxCocoa
import Moya

class ___FILEBASENAMEASIDENTIFIER___: LJBaseViewModel {
    // MARK: output
    lazy var listDriver: Driver<[<#Model#>]> = self.listPublishRelay.asDriver(onErrorJustReturn:[])
    lazy var moreDriver: Driver<Bool> = self.morePublishRelay.asDriver(onErrorJustReturn: false)

    // MARK: Variable
    private var listPublishRelay = PublishRelay<[<#Model#>]>()
    private var morePublishRelay = PublishRelay<Bool>()
    
}

// MARK: Action
extension ___FILEBASENAMEASIDENTIFIER___ {
    func fetchList() {
        Api.request(<#API#>)
            .asObservable()
            .mapObject(<#Model#>.self)
            .filterHUDError()
            .subscribe(onNext: { (result) in
                self.listPublishRelay.accept(result)
                // 分页是否到最后一页判断
                if result.data?.currentPage ?? 0 < result.data?.lastPage ?? 0 {
                    self.morePublishRelay.accept(true)
                }
                else {
                    self.morePublishRelay.accept(false)
                }
            })
            .disposed(by: disposeBag)
    }
}
