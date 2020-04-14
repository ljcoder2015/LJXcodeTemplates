//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//  GitHub: https://github.com/ljcoder2015
//

import UIKit
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif
import Moya

class ___FILEBASENAMEASIDENTIFIER___: LJBaseViewModel {
    // MARK: output
    lazy var listDriver: Driver<LJResponse<<#Model#>>> = self.listPublishRelay.asDriver(onErrorJustReturn: LJResponse.Failed(LJError.RequestError))
    lazy var moreDriver: Driver<Bool> = self.morePublishRelay.asDriver(onErrorJustReturn: false)

    // MARK: Variable
    fileprivate var listPublishRelay = PublishRelay<LJResponse<<#Model#>>>()
    fileprivate var morePublishRelay = PublishRelay<Bool>()
    
}

// MARK: Action
extension ___FILEBASENAMEASIDENTIFIER___ {
    func fetchList() {
        <#Provider#>.rx.request(<#API#>)
            .asObservable()
            .mapObject(<#Model#>.self)
            .subscribe(onNext: { (result) in
                self.listPublishRelay.accept(result)
                // 分页是否到最后一页判断
                if result.data?.currentPage ?? 0 < result.data?.lastPage ?? 0 {
                    self.morePublishRelay.accept(true)
                }
                else {
                    self.morePublishRelay.accept(false)
                }
            }, onError: { _ in
                self.listPublishRelay.accept(LJResponse.Failed(LJError.RequestError))
            })
            .disposed(by: disposeBag)
    }
}
