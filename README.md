# 🧾 Testing – Testmiljö för WTP CRM-system

Detta repo innehåller testningen för CRM-systemet WTP.

##  Struktur i repot

```
Testing/
├── WTP-main/              # Själva CRM-systemet (frontend + backend)
│   ├── client/            # React frontend
│   └── server/            # .NET-backend
├── XUnitTest/             # Enhetstester (xUnit)
├── END2ENDTester/         # End-to-end-tester (SpecFlow + Playwright)
├── Postman/               # API-testning (Postman-samlingar)
├── .github/workflows/     # CI/CD workflows för automatiserad testkörning
└── README.md              # Denna fil
```

##  Innehåll i testsviten

| Testtyp          | Plats              | Teknologi               | Innehåll                          |
|------------------|--------------------|--------------------------|-----------------------------------|
| Enhetstestning   | XUnitTest/         | xUnit                    | Login, användare, rollhantering   |
| API-testning     | Postman/           | Postman + Newman         | Login, tickets, chatt             |
| End-to-end (E2E) | END2ENDTester/     | SpecFlow + Playwright    | Fulla användarflöden (GUI-tester) |
| CI/CD            | .github/workflows/ | GitHub Actions           | Bygg, testa och verifiera         |

## ⚙️ Komma igång lokalt

1. **Klona repot**
```bash
git clone https://github.com/ecthelionofthefountain-510/test-wtp-last-stand.git
cd test-wtp-last-stand
```

2. **Initiera testdatabas**
```bash
psql -U postgres -d test_db -f test_db_dump.sql
```

3. **Starta backend (.NET)**
```bash
cd WTP-main/server
dotnet restore
dotnet run
```

4. **Starta frontend (React)**
```bash
cd WTP-main/client
npm install
npm run dev
```

## 🔍 Köra tester

✔️ **Enhetstester**
```bash
cd XUnitTest
dotnet test
```

✔️ **End-to-end-tester (GUI)**
Körs via SpecFlow + Playwright i exempelvis Rider (med GUI-testramverk aktiverat).

✔️ **API-testning (Postman)**
Importera `WTP_Test.postman_collection.json` i Postman och kör mot lokal server.

## ⚒️ CI/CD

Testerna körs automatiskt via GitHub Actions vid varje push. Resultat och rapporter finns i fliken "Actions".

## 🧠 Teknologier

- **Frontend:** React + Vite  
- **Backend:** ASP.NET Core (Minimal API)  
- **Databas:** PostgreSQL  
- **Testning:** xUnit, Postman, Playwright, SpecFlow  
- **CI/CD:** GitHub Actions
