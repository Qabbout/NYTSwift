//
//  ArticlesTableViewController.swift
//  NYT
//
//  Created by Abdulrahman on 3/25/22.
//

import UIKit

class ArticlesTableViewController: UITableViewController {

    //MARK: Variables
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var results: Results? {
        didSet {
            DispatchQueue.main.async { [weak self] in

                self?.activityIndicator.removeFromSuperview()
                self?.activityIndicator.frame = .zero
                self?.tableView.reloadData()
            }
        }
    }

    //MARK: LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        addShadowToNavBar()
        setUpActivityIndicator()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NYTService.shared.getArticles { [weak self] result in
            do {
                self?.results = try result.get()

            } catch {
                print(error.localizedDescription)
            }
        }

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

    func setUpActivityIndicator(){
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.heightAnchor.constraint(equalTo: view.heightAnchor),
            activityIndicator.widthAnchor.constraint(equalTo: view.widthAnchor)

        ])

    }

    // MARK: - TableView Methods

    override func numberOfSections(in tableView: UITableView) -> Int {

        return results?.numResults ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "article", for: indexPath) as! ArticlesTableViewCell

        if let results = results {
            cell.titleLabel.text = results.results[indexPath.section].title
            cell.authorLabel.text = results.results[indexPath.section].byline
            cell.dateLabel.text = results.results[indexPath.section].publishedDate
        }


        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }

    //MARK: Nivagtions

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        switch segue.identifier {
            case DetailsViewController.segueIdentifier:
                if let destination = segue.destination as? DetailsViewController {
                    destination.result = results?.results[selectedPath.section]
                }
            default:
                return
        }
    }



}

