# DATABASE_DIAGRAM — ERD (Notasi Chen) asset-service

> Cara melihat seperti **laporan** di VS Code:
> - Buka file ini lalu tekan **Ctrl+Shift+V** (Markdown: Open Preview)
> - Atau klik kanan tab file → **Open Preview to the Side**

Dokumen ini menggambarkan **ERD notasi Chen** untuk database `asset_db` milik `asset-service` (berdasarkan definisi tabel di `pajak-retribusi-platform/services/asset-service/database/sql/001_asset_schema.sql` dan perubahan lanjutan seperti `008_asset_location.sql`).

Catatan:
- `tenant_id` dipakai hampir di semua tabel untuk isolasi multi-tenant.
- `assets.village_id` dan `assets.location_catalog_item_id` adalah **logical reference** (tanpa FK hard) ke layanan konfigurasi/lookup.

---

## ERD (Chen Notation)

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
  %% Cardinalities (labels on edges)
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
  %% Attributes (circles)
  %% Keep this compact: show key attributes only
  %% =========================

  %% asset_categories attributes
  AC_id((id)) --- AC
  AC_tenant((tenant_id)) --- AC
  AC_code((code)) --- AC
  AC_name((name)) --- AC
  AC_active((is_active)) --- AC

  %% asset_types attributes
  AT_id((id)) --- AT
  AT_tenant((tenant_id)) --- AT
  AT_cat((category_id)) --- AT
  AT_code((code)) --- AT
  AT_name((name)) --- AT
  AT_unit((tariff_unit)) --- AT
  AT_active((is_active)) --- AT

  %% assets attributes
  A_id((id)) --- A
  A_tenant((tenant_id)) --- A
  A_type((asset_type_id)) --- A
  A_code((code)) --- A
  A_name((name)) --- A
  A_status((status)) --- A
  A_area((area_m2)) --- A
  A_val((valuation)) --- A
  A_year((valuation_year)) --- A
  A_addr((address)) --- A
  A_village((village_id*)) --- A
  A_loc((location_catalog_item_id*)) --- A
  A_payload((payload)) --- A

  %% asset_photos attributes
  AP_id((id)) --- AP
  AP_tenant((tenant_id)) --- AP
  AP_asset((asset_id)) --- AP
  AP_path((storage_path)) --- AP
  AP_primary((is_primary)) --- AP

  %% asset_documents attributes
  AD_id((id)) --- AD
  AD_tenant((tenant_id)) --- AD
  AD_asset((asset_id)) --- AD
  AD_type((document_type)) --- AD
  AD_path((storage_path)) --- AD
  AD_file((file_name)) --- AD

  %% asset_type_tariffs attributes
  ATT_id((id)) --- ATT
  ATT_tenant((tenant_id)) --- ATT
  ATT_type((asset_type_id)) --- ATT
  ATT_status((status)) --- ATT
  ATT_eff((effective_date)) --- ATT
  ATT_exp((expired_date)) --- ATT
  ATT_base((base_tariff)) --- ATT

  %% asset_tariff_tiers attributes
  TIER_id((id)) --- TIER
  TIER_tariff((tariff_id)) --- TIER
  TIER_min((min_value)) --- TIER
  TIER_max((max_value)) --- TIER
  TIER_amt((tariff_amount)) --- TIER

  %% asset_individual_tariffs attributes
  AIT_id((id)) --- AIT
  AIT_tenant((tenant_id)) --- AIT
  AIT_asset((asset_id)) --- AIT
  AIT_amt((tariff_amount)) --- AIT
  AIT_eff((effective_date)) --- AIT
  AIT_exp((expired_date)) --- AIT

  %% asset_rental_configs attributes
  ARC_id((id)) --- ARC
  ARC_tenant((tenant_id)) --- ARC
  ARC_asset((asset_id)) --- ARC
  ARC_min((min_rental_months)) --- ARC
  ARC_max((max_rental_months)) --- ARC
  ARC_dep((deposit_months)) --- ARC
  ARC_cycle((billing_cycle)) --- ARC

  %% Notes
  Note1(["* logical reference (tanpa FK hard) ke layanan lain"]):::note
  Note1 --- A_village
  Note1 --- A_loc

  classDef note fill:#fff,stroke:#999,stroke-dasharray: 3 3,color:#333;
```

---

## CDM (Conceptual Data Model)

CDM berikut merangkum model data dari domain `asset-service` dengan **format kotak-atribut** seperti contoh yang kamu kirim (mudah dibaca di laporan). Fokusnya entitas inti + relasi, bukan semua kolom audit.

Keterangan:
- `village_id` dan `location_catalog_item_id` adalah **logical reference** (tanpa FK hard) ke layanan konfigurasi/lookup.

```mermaid
erDiagram
  ASSET_CATEGORY {
    bigint id PK
    string tenant_id
    string code
    string name
    boolean is_active
  }

  ASSET_TYPE {
    bigint id PK
    string tenant_id
    bigint category_id FK
    string code
    string name
    string tariff_unit
    boolean is_active
  }

  ASSET {
    bigint id PK
    string tenant_id
    bigint asset_type_id FK
    string code
    string name
    string status
    float area_m2
    float valuation
    int valuation_year
    bigint village_id
    bigint location_catalog_item_id
    string payload_json
  }

  ASSET_PHOTO {
    bigint id PK
    string tenant_id
    bigint asset_id FK
    string storage_path
    boolean is_primary
  }

  ASSET_DOCUMENT {
    bigint id PK
    string tenant_id
    bigint asset_id FK
    string document_type
    string storage_path
    string file_name
  }

  ASSET_TYPE_TARIFF {
    bigint id PK
    string tenant_id
    bigint asset_type_id FK
    string status
    string effective_date
    string expired_date
    float base_tariff
  }

  TARIFF_TIER {
    bigint id PK
    bigint tariff_id FK
    float min_value
    float max_value
    float tariff_amount
  }

  INDIVIDUAL_TARIFF_OVERRIDE {
    bigint id PK
    string tenant_id
    bigint asset_id FK
    float tariff_amount
    string effective_date
    string expired_date
    string reason
  }

  ASSET_RENTAL_CONFIG {
    bigint id PK
    string tenant_id
    bigint asset_id FK
    int min_rental_months
    int max_rental_months
    int deposit_months
    string billing_cycle
  }

  %% Relasi (kardinalitas)
  ASSET_CATEGORY ||--o{ ASSET_TYPE : "mempunyai"
  ASSET_TYPE ||--o{ ASSET : "mengklasifikasikan"

  ASSET ||--o{ ASSET_PHOTO : "memiliki"
  ASSET ||--o{ ASSET_DOCUMENT : "memiliki"

  ASSET_TYPE ||--o{ ASSET_TYPE_TARIFF : "menetapkan"
  ASSET_TYPE_TARIFF ||--o{ TARIFF_TIER : "memiliki"

  ASSET ||--o{ INDIVIDUAL_TARIFF_OVERRIDE : "override"
  ASSET ||--o| ASSET_RENTAL_CONFIG : "dikonfigurasi"
```

---

## Ringkasan Relasi

- `asset_categories (1) — (N) asset_types`
- `asset_types (1) — (N) assets`
- `assets (1) — (N) asset_photos`
- `assets (1) — (N) asset_documents`
- `asset_types (1) — (N) asset_type_tariffs`
- `asset_type_tariffs (1) — (N) asset_tariff_tiers`
- `assets (1) — (N) asset_individual_tariffs`
- `assets (1) — (0..1) asset_rental_configs`
