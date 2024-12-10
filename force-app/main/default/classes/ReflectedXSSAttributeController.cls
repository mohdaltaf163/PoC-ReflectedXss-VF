public class ReflectedXSSAttributeController {
    public String userInput { get; set; }

    public ReflectedXSSAttributeController() {
        userInput = ApexPages.currentPage().getParameters().get('input');
    }
}
