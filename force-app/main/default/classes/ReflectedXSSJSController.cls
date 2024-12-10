public class ReflectedXSSJSController {
    public String userInput { get; set; }

    public ReflectedXSSJSController() {
        userInput = ApexPages.currentPage().getParameters().get('input');
    }
}
