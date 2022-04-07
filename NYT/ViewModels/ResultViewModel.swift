//
//  ResultViewModel.swift
//  NYT
//
//  Created by Abdulrahman on 4/7/22.
//

import Foundation
import RxSwift

struct ResultListViewModel {
    let resultListViewModel: [ResultViewModel]

}

extension ResultListViewModel {

    init(_ results: [Result]) {
        self.resultListViewModel = results.compactMap(ResultViewModel.init)
    }

}

extension ResultListViewModel {

    func articleAt(_ index: Int) -> ResultViewModel {
        return resultListViewModel[index]
    }

}


struct ResultViewModel {

    let result: Result

    init(_ result: Result) {
        self.result = result
    }
}

extension ResultViewModel {

    var title: Observable<String> {
        return Observable<String>.just(result.title)

    }
    var abstract: Observable<String> {
        return Observable<String>.just(result.abstract)
    }
    var byline: Observable<String> {
        return Observable<String>.just(result.byline)
    }
    var publishedDate: Observable<String> {
        return Observable<String>.just(result.publishedDate)
    }
}
