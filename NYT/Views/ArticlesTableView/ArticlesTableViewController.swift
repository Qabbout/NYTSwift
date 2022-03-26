//
//  ArticlesTableViewController.swift
//  NYT
//
//  Created by Abdulrahman on 3/25/22.
//

import UIKit

class ArticlesTableViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        addShadowToNavBar()


    }

    // MARK: UI Tweaks

    private func addShadowToNavBar() {
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        self.navigationController?.navigationBar.layer.shadowRadius = 3.0
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.5
        self.navigationController?.navigationBar.layer.shadowPath = UIBezierPath(rect: (self.navigationController?.navigationBar.bounds)!).cgPath
        self.navigationController?.navigationBar.layer.shouldRasterize = true
        self.navigationController?.navigationBar.layer.rasterizationScale = UIScreen.main.scale

    }

    // MARK: - TableView methods

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 20
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "article", for: indexPath) as! ArticlesTableViewCell

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)

    }

}
