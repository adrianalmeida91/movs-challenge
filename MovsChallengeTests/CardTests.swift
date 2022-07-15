import SnapshotTesting
import XCTest
@testable import MovsChallenge

final class CardTests: XCTestCase {
    func testCardInitializer() {
        let viewModel = Card.ViewModel(imageUrl: String(), tagText: "10/12/17", text: "Coco")
        snapshot(viewModel: viewModel, function: #function)
    }

    func testCardShouldDisplayInfinityTextLines() {
        let viewModel = Card.ViewModel(imageUrl: String(), tagText: "10/12/17", text: "CocoCocoCocoCocoCocoCoco")
        snapshot(viewModel: viewModel, function: #function)
    }

    // MARK: - Private functions

    private func snapshot(viewModel: Card.ViewModel, function: String) {
        let sut = Card(viewModel: viewModel)
        sut.backgroundColor = .black
        isRecording = true
        assertSnapshot(matching: sut.toView(), as: .image, testName: "\(function) - View")
        assertSnapshot(matching: sut.toViewController(), as: .image, testName: "\(function) - ViewController")
    }
}
