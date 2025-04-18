# CRM-system för ärendehantering

Detta är repo för projektet som innehåller källkoden, testkoden samt konfiguration för CI/CD (GitHub Actions). Projektet är en del av kursens projektuppgift med testning av ett CRM-system för ärendehantering.

## Innehåll

- **Källkod:**  
  Projektets fullständiga kodbas finns i mappen `WTP-main`, med alla funktioner för CRM-systemet.

- **Testkod:**  
  - **Enhetstester:** xUnit-tester för backend-logik och databasinteraktion (`XUnitTest`).  
  - **GUI- och end-to-end-tester:** Playwright/SpecFlow-testfall (`END2ENDTester`).  
  - **API-tester:** Postman-samling för att testa API-endpoints (`Postman`).

- **CI/CD:**  
  GitHub Actions-konfiguration för automatiserad testkörning och byggning (se `.github/workflows`).

- **Testfall & Loggar:**  
  Automatiserade testresultat (HTML-rapporter, loggar etc.) via Newman eller GitHub Actions.

## Dokumentation (Kunskapsrapporter)

Följande dokument lämnas in separat:
- Förstudierapport (PDF eller DOCX)
- Testplan / strategi (PDF eller DOCX)
- Slutrapport (PDF eller DOCX)

## Så här kör du projektet och testerna

1. **Kör applikationen:**  
   Starta backend och frontend.

2. **Kör enhetstester:**  
   Navigera till `XUnitTest` och kör:  
   ```bash
   dotnet test
   ```

3. **Kör API-tester:**  
   Öppna Postman-samlingen `WTP_Test.postman_collection.json` och kör testerna mot din testmiljö.

4. **Kör GUI-tester:**  
   Navigera till `END2ENDTester` och kör Playwright/SpecFlow-tester enligt README där.

5. **CI/CD:**  
   Testerna körs automatiskt via GitHub Actions vid varje push. Resultaten visas i "Actions"-fliken på GitHub.

## Övrigt

Detta repo utgör projektuppgiften för kursen där testning, kodkvalitet och CI/CD är centrala delar.

**Innehållet i inlämningen:**
- **Kunskapsrapporter:** Förstudierapport, Testplan/strategi, Slutrapport  
- **Projektuppgift:** Källkod, testkod, GitHub Actions-konfiguration, testloggar
