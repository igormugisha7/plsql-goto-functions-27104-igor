
# PL/SQL GOTO Statements and Functions - Individual Assignment III

- **Course:** Database Development with PL/SQL (INSY 8311) - AUCA
- **Student:** Mugisha Igor - ID 27104
- **Instructor:** Eric Maniraguha

## Repository contents
| Folder | Content |
|---|---|
| `00_setup/` | `create_tables.sql` - creates and fills `departments` and `employees` |
| `01_goto/` | A1 number classifier, A2 salary review, A3 illegal GOTO + fix, A4 rewrite without GOTO |
| `02_functions/` | B1 annual salary, B2 years of service, B3 tax, B4 department name, C1 payroll validator |
| `03_tests/` | B5 functions in SQL, `test_functions.sql`, `test_validate_payroll.sql` |
| `screenshots/` | Output screenshots for A1-A4, B5, C1 |
| `docs/REFLECTION.md` | C2 reflection |


## Design decisions
- Tax is progressive monthly PAYE: 0% up to 60,000; 10% up to 100,000; 20% up to 200,000; 30% above.
- Missing employee: B1/B2 return `NULL`; B4 returns `Unknown Department` / `No Department`.
- A2: under 1 year = not eligible; salary >= 1,000,000 = capped; 5+ years = 10% raise, else 5%.
- `fn_validate_payroll` uses one legal GOTO exit (`invalid_result`) for all failures.

