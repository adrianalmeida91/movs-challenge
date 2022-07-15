protocol ViewCode: AnyObject {
    func setupViews()
    func setupViewHierarchy()
    func setupViewConstraints()
}

extension ViewCode {
    func setupViews() {
        setupViewHierarchy()
        setupViewConstraints()
    }
}
