public class ReflectedXSSCSSController {
    public String userInput { get; set; }

    public ReflectedXSSCSSController() {
        userInput = ApexPages.currentPage().getParameters().get('color');
    }
}
