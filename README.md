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
Payload: <script>alert(document.cookie)</script>
  
![Rxss](https://github.com/user-attachments/assets/a4f5cb0f-3185-4eff-b804-dfabdfdec346)
  
 ## Mitigation
 **Escape Output: **
 
 Replace the vulnerable line:
 `<apex:outputText value="{!userInput}" escape="false"/>`
 with
`<apex:outputText value="{!HTMLENCODE(userInput)}"/>`

## Notes
This proof-of-concept demonstrates the importance of secure coding practices and highlights potential risks if developers explicitly disables Salesforce's default XSS protection. This is highly dangerous in real-world applications. Developers should always be cautious about how they handle and render user input.
