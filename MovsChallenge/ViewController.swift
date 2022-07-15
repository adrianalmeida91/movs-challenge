//
//  ViewController.swift
//  MovsChallenge
//
//  Created by adrian.almeida on 03/06/22.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewModel = Card.ViewModel(imageUrl: String(), tagText: "10/10/17", text: "Coco")
        let card = Card(viewModel: viewModel)
        view.addSubview(card)
        card.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
        }
    }
}
