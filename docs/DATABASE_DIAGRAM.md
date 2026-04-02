# DATABASE_DIAGRAM — CDM / ERD / PDM (TAPATUPA)

> Cara melihat seperti **laporan** di VS Code:
>
> - Buka file ini lalu tekan **Ctrl+Shift+V** (Markdown: Open Preview)
> - Atau klik kanan tab file → **Open Preview to the Side**

Dokumen ini merangkum **model data** yang relevan dengan seluruh use case di TAPATUPA (lihat `tapatupa/docs/USE_CASE_SCENARIOS.md`), dan disusun berdasarkan schema SQL yang ada di repo backend `pajak-retribusi-platform`.

## Sumber (berdasarkan schema SQL)

Tabel-tabel utama yang mendukung use case TAPATUPA tersebar di beberapa database/service:

- `asset_db` — `asset-service` (aset, tarif, foto, dokumen, konfigurasi sewa)
  - `pajak-retribusi-platform/services/asset-service/database/sql/001_asset_schema.sql`
  - `pajak-retribusi-platform/services/asset-service/database/sql/008_asset_location.sql`
  - `pajak-retribusi-platform/services/asset-service/database/sql/010_rename_subdistrict_to_village.sql`
- `rental_db` — `rental-service` (permohonan sewa, lampiran identitas, perjanjian)
  - `pajak-retribusi-platform/services/rental-service/database/sql/001_rental_schema.sql`
- `bill_db` — `bill-service` (tagihan + rincian item)
  - `pajak-retribusi-platform/services/bill-service/database/sql/001_bill_schema.sql`
- `payment_db` — `payment-service` (transaksi pembayaran + channel)
  - `pajak-retribusi-platform/services/payment-service/database/sql/001_payment_schema.sql`
- `tax_payer_db` — `tax-payer-service` (wajib retribusi + registrasi jenis retribusi)
  - `pajak-retribusi-platform/services/tax-payer-service/database/schema.sql`
- `auth_db` — `auth-service` (akun login + profil pegawai/petugas)
  - `pajak-retribusi-platform/services/auth-service/database/sql/001_auth_db.sql`
  - `pajak-retribusi-platform/services/auth-service/database/sql/010_employees_schema.sql`
- `setup_config_db` — `setup_config_service` (tenant, generic catalog, wilayah)
  - `pajak-retribusi-platform/services/setup_config_service/database/sql/001_setup_config.sql`
  - `pajak-retribusi-platform/services/setup_config_service/database/sql/010_wilayah.sql`

## Catatan penting

- Mayoritas service menggunakan `tenant_id` untuk isolasi multi-tenant.
- **Tidak ada FK hard lintas database** (mis. `rental_applications.asset_id` tidak FK ke `asset_db.assets.id`). Hubungan lintas-service adalah **logical reference** dan di-enforce di level aplikasi/service.
- Banyak field referensi master data memakai `setup_config_db.cfg_catalog_items` (contoh: `IDENTITY_TYPE`, `RENTAL_PURPOSE`, `ASSET_LOCATION`, `OBLIGOR_TYPE`, `JOB`, `RETRIBUTION_TYPE`).
- Referensi wilayah tidak seragam antar domain:
  - `asset_db.assets.village_id` menyimpan **Emsifa ID 10 digit** (lihat komentar di schema `asset-service`).
  - `tax_payer_db.tax_payers.village_id` menyimpan logical reference ke `setup_config_db.wilayah.id`.
  - `auth_db.employees.kode_wilayah` menyimpan logical reference ke `setup_config_db.wilayah.kode`.

---

## CDM (Conceptual Data Model) — Lintas Use Case

CDM ini memetakan **konsep bisnis** utama yang muncul di use case: autentikasi, lihat aset & tarif, ajukan permohonan, perjanjian & tagihan, pembayaran VA otomatis, history pembayaran, serta pengelolaan oleh petugas.

```mermaid
flowchart LR
  TENANT["Tenant"]

  AUTH_USER["Akun Login (AuthUser)"]
  EMP["Petugas (Employee)"]
  TP["Wajib Retribusi (TaxPayer)"]

  AC["Kategori Aset"]
  AT["Tipe Aset"]
  ASSET["Aset"]
  TARIFF["Tarif Tipe Aset"]

  APP["Permohonan Sewa"]
  APP_ID["Lampiran Identitas"]
  AGR["Perjanjian Sewa"]

  BILL["Tagihan"]
  PAY["Pembayaran"]
  CHANNEL["Channel Pembayaran"]

  CATALOG["Catalog Item (Setup Config)"]
  WIL["Wilayah"]

  TENANT -- "1..N" --> AUTH_USER
  TENANT -- "1..N" --> EMP
  TENANT -- "1..N" --> TP

  TENANT -- "1..N" --> AC
  AC -- "1..N" --> AT
  AT -- "1..N" --> ASSET
  AT -- "1..N" --> TARIFF

  TP -- "1..N" --> APP
  ASSET -- "1..N" --> APP
  APP -- "1..N" --> APP_ID
  APP -- "0..1" --> AGR

  AGR -- "1..N" --> BILL
  BILL -- "0..N" --> PAY
  CHANNEL -- "1..N" --> PAY

  CATALOG -. "lookup" .-> APP
  CATALOG -. "lookup" .-> APP_ID
  CATALOG -. "lookup" .-> ASSET
  WIL -. "lookup" .-> ASSET
  WIL -. "lookup" .-> TP
```

---

## ERD (Chen Notation) — Domain Aset (asset-service)

Legenda bentuk:

- **Entity**: kotak
- **Relationship**: diamond
- **Attribute**: lingkaran

```mermaid
flowchart LR
  %% =========================
  %% Entities
  %% =========================
  AC[asset_categories]
  AT[asset_types]
  A[assets]
  AP[asset_photos]
  AD[asset_documents]
  ATT[asset_type_tariffs]
  TIER[asset_tariff_tiers]
  AIT[asset_individual_tariffs]
  ARC[asset_rental_configs]

  %% =========================
  %% Relationships (diamonds)
  %% =========================
  R1{"memiliki"}
  R2{"mengklasifikasikan"}
  R3{"memiliki"}
  R4{"memiliki"}
  R5{"menetapkan"}
  R6{"memiliki"}
  R7{"override"}
  R8{"dikonfigurasi"}

  %% =========================
  %% Cardinalities
  %% =========================
  AC -- "1" --- R1
  R1 -- "N" --- AT

  AT -- "1" --- R2
  R2 -- "N" --- A

  A -- "1" --- R3
  R3 -- "N" --- AP

  A -- "1" --- R4
  R4 -- "N" --- AD

  AT -- "1" --- R5
  R5 -- "N" --- ATT

  ATT -- "1" --- R6
  R6 -- "N" --- TIER

  A -- "1" --- R7
  R7 -- "N" --- AIT

  A -- "1" --- R8
  R8 -- "0..1" --- ARC

  %% =========================
  %% Key attributes only
  %% =========================
  AC_id((id)) --- AC
  AC_tenant((tenant_id)) --- AC
  AC_code((code)) --- AC
  AC_name((name)) --- AC

  AT_id((id)) --- AT
  AT_cat((category_id)) --- AT
  AT_code((code)) --- AT
  AT_unit((tariff_unit)) --- AT

  A_id((id)) --- A
  A_type((asset_type_id)) --- A
  A_code((code)) --- A
  A_name((name)) --- A
  A_status((status)) --- A
  A_village((village_id*)) --- A
  A_loc((location_catalog_item_id*)) --- A

  Note1(["* logical reference (tanpa FK hard) ke layanan lain"]):::note
  Note1 --- A_village
  Note1 --- A_loc

  classDef note fill:#fff,stroke:#999,stroke-dasharray: 3 3,color:#333;
```

---

## ERD (Chen Notation) — Sewa, Tagihan, Pembayaran (lintas service)

Diagram ini menekankan relasi data yang dipakai oleh use case UC-04 s/d UC-08.

```mermaid
flowchart LR
  TP[tax_payers]
  RA[rental_applications]
  RAI[rental_application_identities]
  AGR[rental_agreements]
  WIT[agreement_witnesses]
  BILL[bills]
  BI[bill_items]
  PAY[payments]
  CH[payment_channels]

  R1{"mengajukan"}
  R2{"melampirkan"}
  R3{"menghasilkan"}
  R4{"memiliki"}
  R5{"ditagihkan"}
  R6{"memiliki"}
  R7{"dibayar"}
  R8{"menggunakan"}

  TP -- "1" --- R1
  R1 -- "N" --- RA

  RA -- "1" --- R2
  R2 -- "N" --- RAI

  RA -- "1" --- R3
  R3 -- "0..1" --- AGR

  AGR -- "1" --- R4
  R4 -- "N" --- WIT

  AGR -- "1" --- R5
  R5 -- "N" --- BILL

  BILL -- "1" --- R6
  R6 -- "N" --- BI

  BILL -- "1" --- R7
  R7 -- "0..N" --- PAY

  CH -- "1" --- R8
  R8 -- "N" --- PAY

  %% Key attributes (compact)
  TP_id((id)) --- TP
  TP_tin((tax_identification_number)) --- TP

  RA_id((id)) --- RA
  RA_asset((asset_id*)) --- RA
  RA_taxpayer((taxpayer_id*)) --- RA
  RA_status((status)) --- RA

  AGR_id((id)) --- AGR
  AGR_no((agreement_number)) --- AGR

  BILL_id((id)) --- BILL
  BILL_no((bill_number)) --- BILL
  BILL_status((status)) --- BILL

  PAY_id((id)) --- PAY
  PAY_status((status)) --- PAY
  PAY_ref((payment_ref)) --- PAY

  Note2(["* logical reference lintas service (tanpa FK hard cross-DB)"]):::note
  Note2 --- RA_asset
  Note2 --- RA_taxpayer

  classDef note fill:#fff,stroke:#999,stroke-dasharray: 3 3,color:#333;
```

---

## PDM (Physical Data Model) — Per Service / Database

PDM di bawah **ringkas (kolom inti)** dan mengikuti struktur tabel pada masing-masing database. Relasi yang ditunjukkan sebagai `FK` adalah relasi **di dalam database yang sama**.

### PDM — asset_db (asset-service)

```mermaid
erDiagram
  ASSET_CATEGORIES {
    bigint id PK
    string tenant_id
    string code
    string name
    text description
    boolean is_active
    timestamptz created_at
    timestamptz deleted_at
  }

  ASSET_TYPES {
    bigint id PK
    string tenant_id
    bigint category_id FK
    string code
    string name
    string tariff_unit
    text description
    boolean is_active
    timestamptz created_at
    timestamptz deleted_at
  }

  ASSETS {
    bigint id PK
    string tenant_id
    bigint asset_type_id FK
    string code
    string name
    string status
    text address
    bigint village_id
    bigint location_catalog_item_id
    numeric latitude
    numeric longitude
    numeric area_m2
    numeric valuation
    int valuation_year
    jsonb payload
    string created_by
    string updated_by
    timestamptz created_at
    timestamptz updated_at
    timestamptz deleted_at
  }

  ASSET_PHOTOS {
    bigint id PK
    string tenant_id
    bigint asset_id FK
    string storage_path
    string caption
    boolean is_primary
    int sort_order
    string uploaded_by
    timestamptz created_at
    timestamptz deleted_at
  }

  ASSET_DOCUMENTS {
    bigint id PK
    string tenant_id
    bigint asset_id FK
    string document_type
    string storage_path
    string file_name
    string nomor_dokumen
    date tanggal_dokumen
    string caption
    string uploaded_by
    timestamptz created_at
    timestamptz deleted_at
  }

  ASSET_TYPE_TARIFFS {
    bigint id PK
    string tenant_id
    bigint asset_type_id FK
    string status
    date effective_date
    date expired_date
    numeric base_tariff
    text notes
    string created_by
    timestamptz submitted_at
    string approved_by
    timestamptz approved_at
    timestamptz deleted_at
  }

  ASSET_TARIFF_TIERS {
    bigint id PK
    bigint tariff_id FK
    string tier_label
    numeric min_value
    numeric max_value
    numeric tariff_amount
    int sort_order
    timestamptz deleted_at
  }

  ASSET_INDIVIDUAL_TARIFFS {
    bigint id PK
    string tenant_id
    bigint asset_id FK
    numeric tariff_amount
    date effective_date
    date expired_date
    text reason
    string created_by
    string approved_by
    timestamptz approved_at
    timestamptz created_at
    timestamptz deleted_at
  }

  ASSET_RENTAL_CONFIGS {
    bigint id PK
    string tenant_id
    bigint asset_id FK
    int min_rental_months
    int max_rental_months
    int deposit_months
    string billing_cycle
    boolean auto_renew_allowed
    text notes
    string updated_by
    timestamptz updated_at
    timestamptz deleted_at
  }

  ASSET_CATEGORIES ||--o{ ASSET_TYPES : "category_id"
  ASSET_TYPES ||--o{ ASSETS : "asset_type_id"
  ASSETS ||--o{ ASSET_PHOTOS : "asset_id"
  ASSETS ||--o{ ASSET_DOCUMENTS : "asset_id"
  ASSET_TYPES ||--o{ ASSET_TYPE_TARIFFS : "asset_type_id"
  ASSET_TYPE_TARIFFS ||--o{ ASSET_TARIFF_TIERS : "tariff_id"
  ASSETS ||--o{ ASSET_INDIVIDUAL_TARIFFS : "asset_id"
  ASSETS ||--o| ASSET_RENTAL_CONFIGS : "asset_id"
```

### PDM — rental_db (rental-service)

```mermaid
erDiagram
  RENTAL_APPLICATIONS {
    bigint id PK
    string tenant_id
    bigint asset_id
    bigint taxpayer_id
    bigint taxpayer_previous_id
    string application_type
    string no_surat
    int purpose_id
    smallint duration_value
    string duration_unit
    date start_date
    date end_date
    text notes
    string status
    timestamptz submitted_at
    timestamptz approved_at
    timestamptz cancelled_at
    text cancel_reason
    string created_by
    string updated_by
    timestamptz created_at
    timestamptz updated_at
    timestamptz deleted_at
  }

  RENTAL_APPLICATION_IDENTITIES {
    bigint id PK
    string tenant_id
    bigint application_id FK
    int identity_type_id
    text file_url
    text notes
    timestamptz created_at
    timestamptz deleted_at
  }

  RENTAL_AGREEMENTS {
    bigint id PK
    string tenant_id
    bigint application_id FK
    string asset_type
    string agreement_number
    bigint asset_id
    bigint taxpayer_id
    string npwrd
    date start_date
    date end_date
    date ratification_date
    string ratified_by
    numeric land_area
    numeric building_area
    smallint duration_value
    string duration_unit
    numeric annual_fee
    string billing_code
    text doc_agreement_url
    text notes
    string status
    timestamptz terminated_at
    text termination_reason
    string created_by
    string updated_by
    timestamptz created_at
    timestamptz updated_at
    timestamptz deleted_at
  }

  AGREEMENT_WITNESSES {
    bigint id PK
    bigint agreement_id FK
    string tin
    string full_name
    text notes
    timestamptz created_at
    timestamptz deleted_at
  }

  AGREEMENT_NUMBER_SEQUENCES {
    string tenant_id PK
    string asset_type PK
    int year PK
    int last_seq
    timestamptz deleted_at
  }

  RENTAL_APPLICATIONS ||--o{ RENTAL_APPLICATION_IDENTITIES : "application_id"
  RENTAL_APPLICATIONS ||--o| RENTAL_AGREEMENTS : "application_id"
  RENTAL_AGREEMENTS ||--o{ AGREEMENT_WITNESSES : "agreement_id"
```

### PDM — bill_db (bill-service)

```mermaid
erDiagram
  BILLS {
    bigint id PK
    string tenant_id
    string bill_number
    string source_type
    string source_id
    bigint taxpayer_id
    string npwrd
    numeric principal_amount
    int penalty_days
    numeric penalty_amount
    numeric amount
    string currency
    string status
    boolean is_arrears
    date due_date
    date notification_date
    timestamptz payment_expiry_at
    timestamptz paid_at
    timestamptz voided_at
    string voided_by
    text void_reason
    int period_year
    int period_month
    jsonb payload
    string created_by
    string updated_by
    timestamptz created_at
    timestamptz updated_at
    timestamptz deleted_at
  }

  BILL_ITEMS {
    bigint id PK
    bigint bill_id FK
    string tenant_id
    string description
    string item_type
    numeric quantity
    numeric unit_price
    numeric subtotal
    timestamptz created_at
  }

  BILLS ||--o{ BILL_ITEMS : "bill_id"
```

### PDM — payment_db (payment-service)

```mermaid
erDiagram
  PAYMENT_CHANNELS {
    bigint id PK
    string tenant_id
    string code
    string name
    string provider
    boolean is_active
    jsonb payload
    string created_by
    string updated_by
    timestamptz created_at
    timestamptz updated_at
    timestamptz deleted_at
  }

  PAYMENTS {
    bigint id PK
    string tenant_id
    bigint bill_id
    bigint taxpayer_id
    bigint channel_id FK
    string channel_code
    string terminal_code
    string branch_code
    numeric principal_amount
    numeric penalty_amount
    numeric amount
    string currency
    numeric remaining_balance
    string status
    string payment_ref
    string receipt_number
    timestamptz paid_at
    text notes
    jsonb payload
    string created_by
    string updated_by
    timestamptz created_at
    timestamptz updated_at
    timestamptz deleted_at
  }

  PAYMENT_CHANNELS ||--o{ PAYMENTS : "channel_id"
```

### PDM — tax_payer_db (tax-payer-service)

```mermaid
erDiagram
  TAX_PAYERS {
    bigint id PK
    string tenant_id
    string tax_identification_number
    string full_name
    text foto_url
    int obligor_type_id
    int job_id
    int village_id
    text address
    string phone
    string whatsapp
    string email
    string created_by
    string updated_by
    timestamptz created_at
    timestamptz updated_at
    timestamptz deleted_at
  }

  TAX_PAYER_RETRIBUTION_TYPES {
    bigint id PK
    string tenant_id
    bigint taxpayer_id FK
    int retribution_type_id
    string reference_id
    boolean is_active
    timestamptz registered_at
    timestamptz updated_at
    timestamptz deleted_at
  }

  TAX_PAYERS ||--o{ TAX_PAYER_RETRIBUTION_TYPES : "taxpayer_id"
```

### PDM — auth_db (auth-service)

```mermaid
erDiagram
  AUTH_USERS {
    bigint user_id PK
    string username
    text password_hash
    boolean is_active
    string user_type
    string display_name
    int perms_version
    timestamptz last_login_at
    timestamptz created_at
    timestamptz updated_at
    timestamptz deleted_at
  }

  AUTH_USER_TENANTS {
    bigint user_id PK
    string tenant_id PK
    boolean is_active
    timestamptz deleted_at
  }

  AUTH_USER_APPS {
    bigint user_id PK
    string tenant_id PK
    string app_code PK
    boolean is_active
    timestamptz deleted_at
  }

  AUTH_ROLES {
    bigint role_id PK
    string role_code
    string role_name
    text description
    boolean is_active
  }

  AUTH_PERMISSIONS {
    bigint perm_id PK
    string perm_code
    string perm_name
    bigint parent_perm_id
    string service_code
    string module_code
    string action_code
    boolean is_active
    timestamptz deleted_at
  }

  AUTH_ROLE_PERMISSIONS {
    bigint role_id PK
    bigint perm_id PK
    timestamptz deleted_at
  }

  AUTH_USER_ROLES {
    bigint user_id PK
    string tenant_id PK
    string app_code PK
    bigint role_id PK
    timestamptz deleted_at
  }

  AUTH_REFRESH_TOKENS {
    bigint id PK
    bigint user_id FK
    string tenant_id
    string app_code
    string user_type
    string token_hash
    string user_agent
    string ip_address
    timestamptz expires_at
    timestamptz revoked_at
    string revoke_reason
    timestamptz created_at
    timestamptz updated_at
    timestamptz deleted_at
  }

  EMPLOYEES {
    bigint employee_id PK
    bigint user_id FK
    string tenant_id
    string nip
    string full_name
    bigint grade_item_id
    string grade_code
    bigint position_item_id
    string position_code
    bigint division_item_id
    string division_code
    string kode_wilayah
    text address
    string phone
    string whatsapp
    string email
    text photo_url
    timestamptz created_at
    timestamptz updated_at
    timestamptz deleted_at
  }

  AUTH_USERS ||--o{ AUTH_USER_TENANTS : "user_id"
  AUTH_USERS ||--o{ AUTH_USER_APPS : "user_id"
  AUTH_USERS ||--o{ AUTH_REFRESH_TOKENS : "user_id"
  AUTH_USERS ||--o| EMPLOYEES : "user_id"

  AUTH_USERS ||--o{ AUTH_USER_ROLES : "user_id"
  AUTH_ROLES ||--o{ AUTH_USER_ROLES : "role_id"
  AUTH_ROLES ||--o{ AUTH_ROLE_PERMISSIONS : "role_id"
  AUTH_PERMISSIONS ||--o{ AUTH_ROLE_PERMISSIONS : "perm_id"
  AUTH_PERMISSIONS ||--o{ AUTH_PERMISSIONS : "parent_perm_id"
```

### PDM — setup_config_db (setup_config_service)

```mermaid
erDiagram
  TENANTS {
    string tenant_id PK
    string tenant_name
    boolean is_active
    timestamptz created_at
    timestamptz updated_at
    timestamptz deleted_at
  }

  CFG_STATUSES {
    string domain PK
    string status_code PK
    string label
    boolean is_terminal
    boolean is_active
    int sort_order
    timestamptz deleted_at
  }

  CFG_CATALOG_ITEMS {
    string tenant_id PK
    string catalog_type PK
    bigint item_id PK
    string code
    string name
    string status_domain
    string status_code
    bigint parent_item_id
    jsonb payload
    timestamptz created_at
    timestamptz updated_at
    timestamptz deleted_at
  }

  CFG_CATALOG_LINKS {
    string tenant_id PK
    string from_catalog_type PK
    bigint from_item_id PK
    string rel_type PK
    string to_catalog_type PK
    bigint to_item_id PK
    jsonb payload
    timestamptz created_at
    timestamptz deleted_at
  }

  WILAYAH {
    bigint id PK
    string kode
    string nama
    timestamptz deleted_at
  }

  TENANTS ||--o{ CFG_CATALOG_ITEMS : "tenant_id"
  TENANTS ||--o{ CFG_CATALOG_LINKS : "tenant_id"
  CFG_STATUSES ||--o{ CFG_CATALOG_ITEMS : "(status_domain,status_code)"
```

---

## Ringkasan Relasi Lintas-Service (Logical Reference)

Relasi berikut dipakai oleh use case, tetapi **tidak** dibangun sebagai FK hard (karena beda database):

- `rental_applications.asset_id` → `asset-service.assets.id`
- `rental_applications.taxpayer_id` → `tax_payers.id`
- `rental_agreements.asset_id` → `asset-service.assets.id`
- `rental_agreements.taxpayer_id` → `tax_payers.id`
- `bills.source_type='rental'` + `bills.source_id` → identitas objek di rental-service (mis. `rental_agreements.id` sesuai kontrak integrasi)
- `payments.bill_id` → `bill-service.bills.id`
- `payments.taxpayer_id` → `tax_payers.id`
- `assets.village_id` → ID wilayah (Emsifa ID 10 digit) untuk resolusi nama lokasi (tanpa FK)
- `tax_payers.village_id` → `setup_config_service.wilayah.id` (tanpa FK)
- `employees.kode_wilayah` → `setup_config_service.wilayah.kode` (tanpa FK)
- `assets.location_catalog_item_id`, `rental_application_identities.identity_type_id`, `rental_applications.purpose_id`, `tax_payers.job_id`, dll → `cfg_catalog_items` (setup-config)
