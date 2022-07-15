import XCTest
import SnapshotTesting
@testable import MovsChallenge

// TDD
// Red --> Escrever um teste que falhe
// Green --> Escrever o código que passe o teste
// Refactoring --> Refatorar, melhorar, reusavel...

// 3 Leis do TDD
// 1 - Nao pode escrever codigo até ter escrito um teste que detecte uma possivel falha
// 2 - Nao pode escrever mais testes de unidade do que o suficiente para detectar uma falha
// 3 - Nao pode escrever mais codigo do que o suficiente para passar nos testes

// FIRST
// F - fast
// I - Independent
// R - Repeatable
// S - Self-validating
// T - Timely

// SUT - System under testing

// GWT
// Given - dado
// When - quando
// Then - entao

final class TagTests: XCTestCase {
    func testTagInitialize() {
        let viewModel = Tag.ViewModel(text: "27/10/17")
        let sut = Tag(viewModel: viewModel)
        assertSnapshot(matching: sut.toView(), as: .image, named: "View")
        assertSnapshot(matching: sut.toViewController(), as: .image, named: "ViewController")
    }
}
