//
//  DetailsViewController.swift
//  NYT
//
//  Created by Abdulrahman on 3/26/22.
//

import UIKit
import RxSwift

class DetailsViewController: UIViewController {

    //MARK: Variables
    static let segueIdentifier: String = "goToArticle"

    let disposeBag = DisposeBag()
    
    @IBOutlet weak var detailsLabel: UILabel!

    var resultVM: ResultViewModel?


    //MARK: LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViews()
    }

    private func bindViews(){

        resultVM?.abstract.asDriver(onErrorJustReturn: "No Abstarct")
            .drive(detailsLabel.rx.text)

            .disposed(by: disposeBag)

    }
}
