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
<img width="1792" alt="RxssHTML" src="https://github.com/user-attachments/assets/d5f1750d-b652-46d4-bc41-9a60ca1e8c80">

Javascript Context Payload: </script><script>alert(%27XSS in JavaScript context!%27)</script>
<img width="1792" alt="RxssJS" src="https://github.com/user-attachments/assets/e21f0bc6-1e23-448f-8e6c-aa972e210d85">

CSS Context Payload: </style><script>alert(%27XSS%20in%20CSS%20Context!%27)</script>
<img width="1792" alt="RxssCSS" src="https://github.com/user-attachments/assets/631173c5-dbe2-433e-b65e-db4679ffee1a">

Attribute/EventHandler Context Payload: javascript:alert(%27XSS in Attribute Context!%27)
<img width="1792" alt="RxssEventHandler" src="https://github.com/user-attachments/assets/e0ba11ba-2a66-4d2c-b5f2-1c50908a1f16">
  
 ## Mitigation
Mitigation code is commented in all vulnerable pages

## Notes
This proof-of-concept demonstrates the importance of secure coding practices and highlights potential risks if developers explicitly disables Salesforce's default XSS protection. This is highly dangerous in real-world applications. Developers should always be cautious about how they handle and render user input.
