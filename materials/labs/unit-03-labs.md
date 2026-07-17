# Unit 3 — Labs: MS Excel for Legal Data Management

**Course:** Computer Information | **Mapped syllabus practicals:** 4, 5

## Lab 4 — Case Data Sheets in Excel: Formulas and Filters

**Unit:** T3 | **Objectives:** Obj 5, 9 | **Duration:** 2 hours

### Objectives

- Build a case register workbook with structured data entry.
- Apply formulas, sorting, and filters for case management.

### Setup

- MS Excel; starter CSV optional (instructor may provide 10 sample rows).

### Procedure

1. Create workbook `Case_Register_RollNo.xlsx`, sheet `Cases`.
2. Columns: Case ID, Client, Court, Matter Type, Status, Filing Date, Next Hearing, Days to Hearing (formula).
3. Enter **15 fictional cases**.
4. **Formulas:**
   - `Days to Hearing` = Next Hearing − TODAY().
   - Status summary: `=COUNTIF(E:E,"Pending")` (adjust range).
5. **Formatting:** header row bold; freeze top row; date format for dates.
6. **Sort** by Next Hearing ascending.
7. **AutoFilter:** show only Pending matters in District Court.
8. Optional: `=IF` flag "Urgent" when Days to Hearing ≤ 7.

### Expected Outcome

- Functional case sheet with dynamic days calculation and filtered views.
- Printed or PDF snapshot of filtered results.

### Checkpoints

| # | Checkpoint | ✓ |
|---|------------|---|
| 1 | 15 rows with consistent columns | |
| 2 | Date and COUNTIF formulas work | |
| 3 | Sort applied correctly | |
| 4 | Filter demonstrated with screenshot | |
| 5 | Freeze panes on header | |

---

---

## Lab 5 — Billing and Client Record Sheets in Excel

**Unit:** T3 | **Objectives:** Obj 5, 9 | **Duration:** 2 hours

### Objectives

- Design client records and billing worksheets linked by Client ID.
- Calculate fees and outstanding amounts using Excel functions.

### Setup

- Continue workbook or new file `Chamber_Billing_RollNo.xlsx`.

### Procedure

1. Sheet `Clients`: Client ID, Name, Contact, Matter, Retainer Date.
2. Sheet `Billing`: Invoice No, Client ID, Date, Description, Hours, Rate, **Amount** (=Hours×Rate), Paid (Y/N).
3. Enter **10 clients** and **15 invoice lines**.
4. Summary section:
   - Total billed: `=SUM(G:G)` (Amount column).
   - Unpaid count: `=COUNTIF(H:H,"N")`.
   - Total outstanding: `=SUMIF(H:H,"N",G:G)`.
5. **Sort** billing by Amount descending.
6. **Chart:** top 5 clients by billed amount (bar chart).
7. Discuss **data privacy**: fictional data only; password-protect file if policy requires.

### Expected Outcome

- Two-sheet workbook with accurate billing math and summary metrics.
- Chart illustrating fee distribution.

### Checkpoints

| # | Checkpoint | ✓ |
|---|------------|---|
| 1 | Client and billing sheets linked by ID | |
| 2 | Amount formula not typed manually | |
| 3 | SUMIF/COUNTIF summaries correct | |
| 4 | Chart created and labeled | |
| 5 | Fictional data only confirmed | |

---
