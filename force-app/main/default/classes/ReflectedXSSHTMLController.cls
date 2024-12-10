public class ReflectedXSSHTMLController {
    public String userInput { get; set; }

    // Constructor to get URL parameter value
    public ReflectedXSSHTMLController() {
        userInput = ApexPages.currentPage().getParameters().get('input');
    }
}