import UIKit
import SnapKit

final class Card: UIView, ViewCode {
    fileprivate enum Layout { }

    struct ViewModel {
        let imageUrl: String
        let tagText: String
        let text: String
    }

    // MARK: - UI

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .cyan
        return imageView
    }()

    private lazy var tagView: Tag = {
        let viewModel = Tag.ViewModel(text: viewModel.tagText)
        let tag = Tag(viewModel: viewModel)
        return tag
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Layout.Font.size)
        label.textColor = .white
        label.text = viewModel.text
        label.numberOfLines = 0
        return label
    }()

    // MARK: - Private variables

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

    // MARK: - ViewCode functions

    func setupViewHierarchy() {
        addSubviews(imageView, tagView, label)
    }

    func setupViewConstraints() {
        imageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.size.equalTo(CGSize(width: 150, height: 200))
        }
        tagView.snp.makeConstraints { make in
            make.centerX.equalTo(imageView.snp.centerX)
            make.left.greaterThanOrEqualTo(imageView.snp.left).offset(Layout.Size.tagMargin.left)
            make.top.greaterThanOrEqualTo(imageView.snp.top).offset(Layout.Size.tagMargin.top)
            make.right.lessThanOrEqualTo(imageView.snp.right).offset(-Layout.Size.tagMargin.right)
            make.bottom.equalTo(imageView.snp.bottom).offset(-Layout.Size.tagMargin.bottom)
        }
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(Layout.Size.labelMargin.left)
            make.top.equalTo(imageView.snp.bottom).offset(Layout.Size.labelMargin.top)
            make.right.lessThanOrEqualToSuperview().offset(-Layout.Size.labelMargin.right)
            make.bottom.lessThanOrEqualToSuperview().offset(-Layout.Size.labelMargin.bottom)
        }
    }
}

// MARK: - Layout constants

extension Card.Layout {
    enum Size {
        static let tagMargin = (left: 4, top: 4, right: 4, bottom: 4)
        static let labelMargin = (left: 4, top: 12, right: 4, bottom: 4)
    }

    enum Font {
        static let size: CGFloat = 18
    }
}
