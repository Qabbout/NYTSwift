//
//  DetailsViewController.swift
//  NYT
//
//  Created by Abdulrahman on 3/26/22.
//

import UIKit

class DetailsViewController: UIViewController {

    //MARK: Variables
    static let segueIdentifier: String = "goToArticle"

    
    @IBOutlet weak var detailsLabel: UILabel!

    var result: Result? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.detailsLabel?.text = self?.result?.abstract
            }

        }
    }


    //MARK: LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
