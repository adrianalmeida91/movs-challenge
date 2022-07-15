import UIKit
import SnapKit

extension UIView {
    func toViewController() -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .black
        viewController.view.addSubview(self)
        snp.makeConstraints { make in
            make.left.top.equalToSuperview()
        }
        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()
        return viewController
    }

    func toView() -> UIView {
        let view = UIView()
        view.addSubview(self)
        snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return self
    }
}
