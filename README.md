# PoC-ReflectedXss-VF

This project demonstrates a Reflected XSS vulnerability in a Visualforce Page. Reflected XSS occurs when malicious user input is included in a server response without proper validation or sanitization. This proof-of-concept (PoC) is intended for educational purposes only and highlights the risks of improperly handling user input in Visualforce pages.

# Project Structure
**Apex Controller:** `XSSController.cls`
- Handles the input submitted by the user.
- Provides a getter method to return user input.

**Visualforce Page:** `ReflectedXssDemo.page`
- Includes an input form to accept user input.
- Reflects the user input directly in the output without escaping.

# How It Works
## Vulnerability
The Visualforce page renders user input directly using the `<apex:outputText>` tag with `escape="false"`.
This disables Salesforce's default XSS protection, allowing malicious scripts to execute.

## Demonstration Flow
A user submits text through the input field.
The text is immediately reflected on the page without escaping.
If the input contains malicious code (e.g., <script> tags), the browser executes it, demonstrating the XSS vulnerability.

## Setup Instructions

  **Deploy the Code:**

  Upload the provided XSSController.cls and ReflectedXssDemo.page to your Salesforce org.

  **Access the Page**
- Open the ReflectedXssDemo.page in your browser.
- Example URL: https://[your-salesforce-instance]/apex/ReflectedXssDemo
  
## Exploitation Example
HTML Context Payload: <script>alert(document.cookie)</script>
  <img width="1792" alt="RxssHTML" src="https://git.soma.salesforce.com/storage/user/31505/files/8991dedf-f2f5-48c1-994d-d6faedb0f233">

Javascript Context Payload: </script><script>alert(%27XSS in JavaScript context!%27)</script>
<img width="1792" alt="RxssJS" src="https://git.soma.salesforce.com/storage/user/31505/files/b55717e8-101a-4c33-9a83-57a6088c638f">
  
CSS Context Payload: </style><script>alert(%27XSS%20in%20CSS%20Context!%27)</script>
<img width="1792" alt="RxssCSS" src="https://git.soma.salesforce.com/storage/user/31505/files/4e491fe4-8f50-4f43-88f2-4b7f09c63dcb">
  
Attribute/EventHandler Context Payload: 
<img width="1792" alt="RxssEventHandler" src="https://git.soma.salesforce.com/storage/user/31505/files/79a71260-9bd5-44a5-9237-192ee726e182">

  
 ## Mitigation
Mitigation code is commented in all vulnerable pages

## Notes
This proof-of-concept demonstrates the importance of secure coding practices and highlights potential risks if developers explicitly disables Salesforce's default XSS protection. This is highly dangerous in real-world applications. Developers should always be cautious about how they handle and render user input.
