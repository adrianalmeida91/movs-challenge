import UIKit
import SnapKit

final class Tag: UIView, ViewCode {
    fileprivate enum Layout { }

    struct ViewModel {
        let text: String
    }

    // MARK: - UI

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Layout.Font.size)
        label.textColor = .white
        label.text = viewModel.text
        return label
    }()

    // MARK: - Private variable

    private let viewModel: ViewModel

    // MARK: - Initializers

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override functions

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderWidth = Layout.Size.borderWidth
        layer.borderColor = Layout.Color.borderColor
    }

    // MARK: - ViewCode conforms

    func setupViewHierarchy() {
        addSubview(label)
    }

    func setupViewConstraints() {
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Layout.Size.padding)
        }
    }
}

// MARK: - Layout constants

extension Tag.Layout {
    enum Size {
        static let padding = 4
        static let borderWidth: CGFloat = 1
    }

    enum Font {
        static let size: CGFloat = 18
    }

    enum Color {
        static let borderColor = UIColor.white.cgColor
    }
}
