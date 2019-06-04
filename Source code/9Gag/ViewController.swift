//
//  ViewController.swift
//  9Gag
//
//  Created by Quan Hoang on 6/4/19.
//  Copyright © 2019 smartapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - outlets
    @IBOutlet weak var tableViewListLink: UITableView!
    
    // MARK: - vars
    var listLink: [String] = []
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.setupData()
    }
    
    // MARK: - setups
    private func setupViews() {
        self.title = "List"
        self.tableViewListLink.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableViewListLink.dataSource = self
        self.tableViewListLink.delegate = self
    }
    
    private func setupData() {
        self.listLink = [
            "https://linkhay.com/link/2809166/dao-bao-tien-tim-cook-lam-ca-nguoi-giau-dau-vi",
            "https://linkhay.com/link/item/click/id/2803815",
            "https://www.youtube.com/watch?v=HsMFcQlxwKs&list=RDHsMFcQlxwKs&start_radio=1",
            "https://images.pexels.com/photos/1252869/pexels-photo-1252869.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            "https://www.nhaccuatui.com/bai-hat/anh-dech-can-gi-nhieu-ngoai-em-den-ft-vu-ft-thanh-dong.VSvhW9JOP9gD.html"
        ]
        self.tableViewListLink.reloadData()
    }
    
    // MARK: - apis
    
    // MARK: - actions

}

// MARK: - UITableView
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listLink.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.listLink[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailVc.link = self.listLink[indexPath.row]
        
        self.navigationController?.pushViewController(detailVc, animated: true)
    }

}

