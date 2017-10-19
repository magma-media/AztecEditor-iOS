import XCTest
@testable import Aztec

class NSAttributedStringHTMLInitializerTests: XCTestCase {

    let defaultFontDescriptor = UIFont.systemFont(ofSize: 12).fontDescriptor

    /// Test that text contained within script tags, parsed by libxml as CData, does not trigger a crash.
    ///
    /// Example: <script>(adsbygoogle = window.adsbygoogle || []).push({});</script>
    ///
    func testScriptTagWithCDataDoesNotTriggerACrash() {

        let html = "<script>(adsbygoogle = window.adsbygoogle || []).push({});</script>"

        let defaultAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 14),
                                 NSParagraphStyleAttributeName: ParagraphStyle.default]
        
        XCTAssertNoThrow(NSAttributedString(withHTML: html, defaultAttributes: defaultAttributes))
    }
}
