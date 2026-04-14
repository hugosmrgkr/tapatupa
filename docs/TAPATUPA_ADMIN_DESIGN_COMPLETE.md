# 👨‍💼 TAPATUPA - ADMIN/PETUGAS DESIGN
## Dokumentasi UI/UX Figma AI (iPhone 17 Pro) - Consistent dengan User Design

**Aplikasi:** TAPATUPA - Petugas/Admin Pemerintah Kabupaten Toba  
**Device:** iPhone 17 Pro (1170 x 2532 px)  
**Design System:** KONSISTEN dengan User Design  
**Status:** ✅ Dokumentasi Lengkap 1 File - Ready untuk AI Figma Plugin  
**Tanggal:** 14 April 2026

---

## 🎨 DESIGN SYSTEM (SAMA DENGAN USER)

```plaintext
PRIMARY COLORS (IDENTIK):
├── Primary Red:        #EC4336  (CTAs, Highlights)
├── Light Red BG:       #FFF0EF  (Soft backgrounds)
└── Success Green:      #4CAF50  (Approval status)

NEUTRAL PREMIUM (IDENTIK):
├── Dark Navy:          #1A1A2E  (Headlines, Main text)
├── Professional Gray:  #6B7280  (Secondary text)
├── Light Gray:         #F3F4F6  (Page background)
├── Soft Gray:          #EEEEEE  (Dividers)
├── Very Light Gray:    #F9FAFB  (Card backgrounds)
└── Pure White:         #FFFFFF  (Cards, Sections)

SEMANTIC COLORS (IDENTIK):
├── Warning Orange:     #FF9800  (Pending requests)
├── Error Red:          #F44336  (Rejected)
└── Info Blue:          #2196F3  (Information)

TYPOGRAPHY (IDENTIK):
Font: Google Poppins (300, 400, 500, 600, 700, 800)
Display 1: 32px 800, Heading 1: 28px 700, Body: 14px 400, Button: 15px 700
(Same as User design)

SPACING & SIZING (IDENTIK):
8px grid system, 16px page padding, 52px input height, 56px button height
(Same as User design)
```

---

## 👥 ADMIN/PETUGAS FITUR (Total 10 Halaman)

### 1. Admin Login (Berbeda dari User)
### 2. Admin Dashboard (Overview & Statistics)
### 3. Daftar Permohonan (Requests to Review)
### 4. Detail Permohonan (Review & Approval)
### 5. Approval Form (Accept/Reject Decision)
### 6. Manajemen Lahan (Land Management CRUD)
### 7. Detail Lahan Edit (Edit Land Properties)
### 8. Monitoring Pembayaran (Payment Tracking)
### 9. Reports & Analytics (Business Intelligence)
### 10. Admin Profile & Settings

---

---

# 💡 SEMUA PROMPT ADMIN AI (COPY-PASTE)

> **Setiap prompt sudah lengkap & konsisten dengan User Design. Copy-paste langsung ke Figma AI Plugin.**

---

## ✨ PROMPT A1: ADMIN LOGIN (Berbeda dari User)

```
DESIGN FIGMA AI PROMPT - ADMIN LOGIN (Petugas Pemerintah)

PROJECT: TAPATUPA Admin
DEVICE: iPhone 17 Pro (1170x2532px)
STYLE: Professional, Secure, Government-themed

COLOR SCHEME (SAME AS USER):
Primary Red #EC4336, Dark Navy #1A1A2E, Gray #6B7280, Light #F9FAFB, White #FFFFFF

═══ PAGE LAYOUT

[Header - 18% top]
- Background: Gradient from #1A1A2E to #2C2C3E (dark professional)
- Padding: 44px (safe) + 24px
- Logo/Brand: "TAPATUPA" (16px, 800, red #EC4336, left)
- Secondary text: "ADMIN PORTAL" (12px, 600, white, below logo)
- Subtitle: "Sistem Manajemen Sewa Tanah Pemerintah" (12px, 400, white opacity 80%)

[Form Section - 60%, 16px left-right padding]
- Top margin: 40px

Field 1 - Email Petugas:
- Label: "Email Petugas *" (12px, 600, white)
- Input: 52px, white bg, border 1px white
  ├── Placeholder: "petugas@tapatupa.go.id"
  ├── Icon (left): Mail icon, white
  └── Focus: Shadow glow effect
- Bottom margin: 20px

Field 2 - Password:
- Label: "Password *" (12px, 600, white)
- Input: 52px, white bg, eye toggle
  ├── Placeholder: "Masukkan password"
  └── Icon (left): Lock icon, white
- Bottom margin: 12px

[Forgot Password]
- "Lupa password?" (12px, 500, white, right-aligned, link)
- Bottom margin: 32px

[Remember Me - Optional]
- Checkbox + "Ingat saya di device ini" (12px, 400, white)
- Bottom margin: 32px

[Buttons - 18% bottom]
1. Login Button:
   - "MASUK" (15px, 700, white)
   - Background: #EC4336 (red on dark background provides contrast)
   - Height: 56px
   - Full width
   - Shadow: strong
   - Bottom margin: 20px

2. Contact Support:
   - "Lupa akses? Hubungi IT Support" (12px, white link)
   - Centered
   - Bottom: 34px safe area

═══ DESIGN NOTES:
- Government-professional aesthetic
- Dark header for security feel
- Higher contrast for access
- White inputs on dark background
- Red CTA stands out
- Secure, official appearance
```

---

## ✨ PROMPT A2: ADMIN DASHBOARD (Overview)

```
DESIGN FIGMA AI PROMPT - ADMIN DASHBOARD

PROJECT: TAPATUPA Admin
DEVICE: iPhone 17 Pro (1170x2532px)
STYLE: Data-driven, Professional, Overview-focused

═══ PAGE STRUCTURE

[Top Bar - 12% (fixed)]
- Background: white
- Safe area: 44px
- Left: Greeting "Selamat Pagi, Hendra" (14px, 500, gray)
- Right: Bell icon (notifications) + Admin profile icon (40x40)

[Hero Statistics Section - 28%]
- Background: Gradient from #1A1A2E to #2C2C3E (dark, premium)
- Padding: 20px
- Content:

  Title: "Dasbor Manajemen" (24px, 700, white)
  
  4 Statistics Cards (2x2 grid):
  
  Card 1 - Total Permohonan:
  ├── Icon: Document icon (32x32, white)
  ├── Number: "247" (24px, 700, white)
  ├── Label: "Permohonan" (12px, 400, white opacity 80%)
  └── Trend: "↑ 12% minggu ini" (10px, #4CAF50, green)
  
  Card 2 - Pending Review:
  ├── Icon: Clock icon (32x32, white)
  ├── Number: "18" (24px, 700, #FF9800, orange)
  ├── Label: "Perlu Review" (12px, white opacity 80%)
  └── Priority: "Urgent" (10px, red)
  
  Card 3 - Lunas Pembayaran:
  ├── Icon: Check icon (32x32, white)
  ├── Number: "156" (24px, 700, #4CAF50)
  ├── Label: "Pembayaran Lunas" (12px, white opacity 80%)
  └── Trend: "✓ On track" (10px, green)
  
  Card 4 - Revenue Total:
  ├── Icon: Money icon (32x32, white)
  ├── Amount: "Rp 156 Juta" (24px, 700, white)
  ├── Label: "Target Bulan Ini" (12px, white opacity 80%)
  └── Progress: "78%" (10px, green)

  Card spacing: 8px between
  Card size: ~100x100px each
  Card styling: Transparent bg, white border opacity 20%, rounded 12px


[Recent Activity Section - 20%]
- Title: "Aktivitas Terbaru" (16px, 700, #1A1A2E, 16px left margin)
- Background: white

Activity items (vertical list):
- Height: 60px per item
- Background: white
- Border: None
- Padding: 12px 16px
- Margin: 8px 16px

Item format:
├── Left icon: Action-based icon (24x24, gray)
├── Middle:
│  ├── Title: "Permohonan baru diterima" (12px, 600, #1A1A2E)
│  └── Details: "Lahan Gemuruh - Ahmad Syaiful" (11px, 400, gray)
└── Right: Time "2 jam lalu" (10px, gray)

Items shown: 4-5 recent activities


[Quick Actions Section - 15%]
- Title: "Akses Cepat" (16px, 700, #1A1A2E)
- Horizontal scroll buttons (chips style):
  ├── "Review Permohonan" (outline, red text)
  ├── "Laporan Harian" (outline)
  ├── "Manajemen Lahan" (outline)
  └── "Data Pembayaran" (outline)

- Button styling: 40px height, outlined, gray border, rounded 20px
- Spacing: 8px between
- Margin: 16px left-right


[Pending Requests Preview - 20%]
- Title: "Permohonan Menunggu Approval" (16px, 700, red #EC4336)
- Subtitle: "18 permohonan memerlukan tindakan" (12px, gray)

Preview cards (max 3):
- Height: 80px minimum
- Compact horizontal layout:
  ├── Image: 60x60, land photo
  ├── Info:
  │  ├── Name: "Lahan Gemuruh" (12px, 700)
  │  ├── Requester: "Ahmad Syaiful" (10px, gray)
  │  └── Time: "Diajukan 2 jam lalu" (10px, gray)
  └── Status badge: "PENDING" orange


[Bottom Navigation - 80px]
Same as User (5 tabs, but modified icons for Admin)


═══ DESIGN NOTES:
- Professional dashboard aesthetic
- Data-driven visualization
- Quick stats overview
- Recent activity feed
- Easy access to critical functions
- Color-coded priorities
- Government/official feel
```

---

## ✨ PROMPT A3: DAFTAR PERMOHONAN (For Review)

```
DESIGN FIGMA AI PROMPT - REQUEST LIST FOR ADMIN REVIEW

PROJECT: TAPATUPA Admin
DEVICE: iPhone 17 Pro
STYLE: List-focused, Status-clear, Action-oriented

═══ PAGE LAYOUT

[Header]
- Title: "Permohonan Masuk" (24px, 700, #1A1A2E)
- Back arrow (top-left)
- Filter icon (top-right) - for filtering

[Status Tabs - sticky below header]
- "Semua" (14px, active red underline)
- "Pending" (14px, gray)
- "Review" (14px, gray)
- "Approved" (14px, gray)
- "Rejected" (14px, gray)
- Same styling as User design
- Horizontal scroll if needed


[Filter Row - below tabs]
- Sort dropdown: "Terbaru ▼" (Newest/Oldest/Priority)
- Left margin: 16px
- Margin bottom: 12px


[REQUEST ITEMS - vertical list]

Each item: 110px height
Background: white
Border: 1px left-side (4px thick, status-colored)
Radius: 12px
Padding: 12px
Margin: 12px 16px, 8px top-bottom
Shadow: subtle

Item layout (3 sections):

Left (15%):
- Image: 70x70, radius 10px
- Land photo or placeholder

Center (60%):
- Row 1: Land name "Lahan Gemuruh" (13px, 700, #1A1A2E)
- Row 2: Requester "Ahmad Syaiful" (11px, 400, gray)
- Row 3: Request date "Diajukan: 15 Apr 2026, 10:30" (10px, gray)
- Row 4: Details "3 bulan sewa • Rp 1.5 Juta" (11px, 500, #EC4336)

Right (25%):
- Top: Status badge (status-colored, white text)
  ├── Pending: Orange #FF9800
  ├── Review: Blue #2196F3
  ├── Approved: Green #4CAF50
  └── Rejected: Red #F44336
- Middle: Days pending "2 hari" (10px, gray)
- Bottom: Action button "Tinjau" (10px, 600, red link) or checkmark icon

On tap: Navigate to Detail/Review screen


[Empty State - if all approved]
- Icon: Checkmark circle (64x64, green)
- Text: "Semua permohonan telah ditinjau" (16px, 700, gray)
- Subtext: "Belum ada permohonan baru" (13px, 400)
- Button: "Buka arsip" (outline)


[Pagination / Load More]
- Button: "Muat Lebih Banyak" (gray outline) or infinite scroll


[Bottom Navigation - 80px]
Same admin nav


═══ DESIGN NOTES:
- Clear status indicators
- Easy scanning
- Action-oriented
- Priorities visible (oldest first, or customize)
- Multiple status views
```

---

## ✨ PROMPT A4: DETAIL PERMOHONAN (Admin Review)

```
DESIGN FIGMA AI PROMPT - REQUEST DETAIL (Admin Review Version)

PROJECT: TAPATUPA Admin
DEVICE: iPhone 17 Pro
STYLE: Detailed, Review-focused, Decision-ready

═══ PAGE LAYOUT

[Header]
- Back arrow (top-left)
- Title: "Review Permohonan" (20px, 700, #1A1A2E)
- Ref number: "#REQ-2026-00456" (12px, gray, below title)

[Status Timeline - top]
- Submitted: ✓ Complete (green)
- In Review: ⏳ Current (orange)
- Decision: ⭕ Pending (gray)
- Line connecting: colored or neutral
- Compact horizontal layout, 16px padding

[Land Information Card - 15%]
- Background: white, border 1px #E5E7EB, shadow
- Radius: 12px, padding: 16px, margin: 16px
- Image: 80x80, land photo, float left
- Content:
  ├── "Lahan Gemuruh" (14px, 700, #1A1A2E)
  ├── "5 m² • Dekat Jalan Raya" (12px, 400, gray)
  ├── "Lokasi: Kabupaten Toba" (11px, 400, gray)
  └── "Rating: ⭐ 4.8" (11px, 400)

[Requester Information - 12%]
- Title: "Data Pemohon" (13px, 700, #1A1A2E, margin 16px top)
- Border-bottom: 1px #E5E7EB
- Content rows:
  ├── Name: "Ahmad Syaiful" (14px, 700)
  ├── Email: "ahmad.syaiful@email.com" (12px, 400)
  ├── Phone: "+62 812 3456 7890" (12px, 400)
  ├── NIK: "1201234567890123" (12px, monospace, gray)
  └── Joined: "Member sejak 15 Maret 2026" (11px, 400, gray)
- Padding: 12px 16px per row


[Request Details - 15%]
- Title: "Detail Permohonan" (13px, 700)
- Rows:
  ├── Durasi: "3 bulan (15 Apr - 15 Jul 2026)"
  ├── Tarif: "Rp 500.000 per bulan"
  ├── Total: "Rp 1.500.000"
  ├── Kebutuhan khusus: "Lokasi perlu dekat jalan utama"
  └── Status Dokumen: "✓ KTP | ✓ Domisili" (green checkmarks)


[Document Verification - 12%]
- Title: "Verifikasi Dokumen" (13px, 700)
- Documents list:
  ├── "KTP" - ✓ Verified (green, 11px)
  ├── "Domisili" - ✓ Verified (green)
  ├── "Surat Referensi" - ⭕ Pending (orange)
  └── "Proof Pembayaran" - ⭕ Pending (orange)


[Admin Notes Section - 10%]
- Title: "Catatan Review" (13px, 700)
- Textarea: 80px height
- Placeholder: "Tulis catatan untuk approval/rejection..."
- Background: #F9FAFB
- Radius: 10px


[Decision Actions - 20%]
- Section title: "Keputusan" (13px, 700, red)

Two main buttons + options:

Button 1 - APPROVE:
- Background: #4CAF50 (green)
- Text: "SETUJUI PERMOHONAN" (15px, 700, white)
- Height: 56px
- Full width
- Shadow: strong
- Bottom margin: 12px

Button 2 - REJECT:
- Background: Outline / Ghost style
- Border: 2px #F44336 (red)
- Text: "TOLAK PERMOHONAN" (15px, 700, red)
- Height: 56px
- Full width
- Bottom margin: 12px

Optional:
- Checkbox: "Hubungi pemohon via email" (12px, 400)
- Preview message will auto-generate


[Edit Log - bottom, small]
- "Diubah terakhir: 14 Apr 2026, 10:30 - Hendra Simanjuntak" (10px, gray)


[Bottom Navigation]
Same admin nav


═══ DESIGN NOTES:
- All requester data visible
- Document status clear
- Easy-to-fill notes
- Clear approval & rejection buttons
- On-brand styling consistent
```

---

## ✨ PROMPT A5: APPROVAL FORM (Decision Modal)

```
DESIGN FIGMA AI PROMPT - APPROVAL/REJECTION DECISION FORM

PROJECT: TAPATUPA Admin
DEVICE: iPhone 17 Pro
STYLE: Decision-focused, Modal-style, Clear CTA

═══ MODAL LAYOUT (Appears over previous screen, bottom-sheet style)

[Modal Header]
- Title: "Konfirmasi Keputusan" (20px, 700, #1A1A2E)
- Close button (X): 24x24, top-right
- Divider below: 1px #E5E7EB


═══ IF APPROVING:

[Approval Content]

Title: "Setujui Permohonan?" (18px, 700, green #4CAF50)
Subtitle: "Pastikan semua data sudah diverifikasi" (13px, 400, gray)

Checklist (optional required):
- "Dokumen sudah diverifikasi" ☑️
- "Data pemohon sudah dicek" ☑️
- "Lokasi lahan sesuai" ☑️
- All optional to check, but info reads better when checked

[Auto-message]
- Label: "Notifikasi Otomatis ke Pemohon" (12px, 600)
- Message box (auto-filled, editable):
  "Terima kasih atas permohonan Anda. Permohonan sewa lahan Gemuruh telah DISETUJUI dengan periode 3 bulan mulai 15 April 2026. Silakan lanjutkan ke tahap pembayaran untuk mengamankan booking."
- Styling: white bg, border 1px gray, radius 10px, height 100px

[Button Group]
- Button 1 (primary): "SETUJUI & KIRIM NOTIFIKASI" (56px, green, white text, shadow)
- Button 2 (secondary): "BATAL" (44px, outline, gray)
- Spacing: 12px between


═══ IF REJECTING:

[Rejection Content]

Title: "Tolak Permohonan?" (18px, 700, red #F44336)
Subtitle: "Alasan penolakan akan dikirim ke pemohon" (13px, 400, gray)

[Required Reason]
- Label: "Alasan Penolakan *" (12px, 600, required)
- Dropdown/Buttons to select:
  ├── "Dokumen tidak lengkap"
  ├── "Data pemohon tidak sesuai"
  ├── "Lokasi lahan tidak tersedia"
  ├── "Violasi syarat dan ketentuan"
  └── "Lainnya" (if selected, shows textarea)
- Selection styling: button-style, active/inactive

[Custom Reason - if "Lainnya"]
- Textarea: 100px height
- Placeholder: "Jelaskan alasan penolakan..."

[Auto-message]
- Label: "Notifikasi ke Pemohon" (12px, 600)
- Message box (auto-filled):
  "Permohonan Anda untuk sewa lahan Gemuruh telah DITOLAK. Alasan: [Reason dipilih]. Anda dapat mengajukan permohonan baru untuk lokasi lain atau hubungi admin untuk diskusi lebih lanjut."
- Editable

[Button Group]
- Button 1 (primary): "TOLAK & KIRIM NOTIFIKASI" (56px, red, white text, shadow)
- Button 2 (secondary): "BATAL" (44px, outline)


═══ BOTH: CONFIRMATION SCREEN (After clicking Approve/Reject)

[Success/Confirmation]
- Icon: Checkmark circle (green) or X circle (red)
- Message: "Keputusan telah disimpan" (16px, 700)
- Subtext: "Pemohon akan menerima notifikasi" (12px, 400)
- Auto-close after 2 seconds OR Button: "Kembali ke Daftar" (outlined)


═══ DESIGN NOTES:
- Modal overlay on previous page
- Clear decision path
- Reason requirement for rejection
- Auto-message for communication
- Confirmation feedback
- Easy to understand choices
```

---

## ✨ PROMPT A6: MANAJEMEN LAHAN (CRUD)

```
DESIGN FIGMA AI PROMPT - LAND MANAGEMENT (Admin)

PROJECT: TAPATUPA Admin
DEVICE: iPhone 17 Pro
STYLE: Management-focused, Data-entry, Professional

═══ TAB LAYOUT (Same as User, but Admin Version)

[Header]
- Title: "Manajemen Lahan" (24px, 700, #1A1A2E)
- Add button (+ icon): floating action button or top-right

[Tabs - sticky]
- "Semua" (500+ items)
- "Tersedia" (count: 45)
- "Disewa" (count: 12)
- "Maintenance" (count: 3)
- Same tab styling as user


[Filter & Sort]
- Search: "Cari nama/lokasi lahan..." (input, 48px)
- Sort dropdown: "Terbaru ▼" (By date/name/price/status)
- Filter button: Additional filters


[LAND LIST ITEMS]

Item height: 120px
Background: white
Border: 1px #E5E7EB
Radius: 12px
Padding: 12px
Margin: 12px 16px
Shadow: subtle

Item layout (horizontal):

Left (18%):
- Image: 80x80, radius 10px
- placeholder or photo

Center (60%):
- Title: "Lahan Gemuruh" (14px, 700, #1A1A2E)
- Location: "Kab. Toba / Dekat Jalan Raya" (12px, 400, gray)
- Specs: "5 m² • Datar • Resmi" (11px, 500, gray)
- Status: "Tersedia" (11px, 700, status-colored)
  ├── Available: Green
  ├── Rented: Blue
  └── Maintenance: Orange
- Price: "Rp 500.000/bulan" (12px, 700, red)

Right (22%):
- Action buttons (vertical):
  ├── Edit icon (24x24, gray button)
  └── More/Menu icon (24x24, gray button)
- On tap Edit: Go to edit form
- On tap Menu: Show options (View, Edit, Delete, Reports)


[Floating Action Button - Fixed bottom-right]
- Background: red #EC4336
- Icon: Plus (24x24, white)
- Shadow: strong
- On tap: Show "Add New Land" form


[Empty State]
- Icon: Land/field icon (64x64, light gray)
- Text: "Belum ada lahan terdaftar" (16px, 700, gray)
- Button: "Tambah Lahan Baru" (red)


═══ DESIGN NOTES:
- CRUD-ready interface
- Status indicators
- Quick actions
- Admin-focused data display
- Easy land discovery
- Add/edit capabilities
```

---

## ✨ PROMPT A7: EDIT LAHAN (Land Details Form)

```
DESIGN FIGMA AI PROMPT - EDIT LAHAN DETAILS

PROJECT: TAPATUPA Admin
DEVICE: iPhone 17 Pro
STYLE: Form-focused, Data-entry, Complete

═══ PAGE LAYOUT

[Header]
- Back arrow (top-left)
- Title: "Edit Detail Lahan" (24px, 700, #1A1A2E) / "Tambah Lahan Baru"
- Mode: Edit or Add

[Image Section - 25%]
- Image area: 100% width, 160px height, radius 12px
- Placeholder or current image
- Overlay buttons:
  ├── Upload icon: "Change Photo" (white text, bottom-left)
  └── Plus icon: "Add More Photos" (right side)
- On tap: Open image picker


[FORM FIELDS - scrollable, 16px padding]

Section 1 - INFORMASI DASAR (Basic):

Field 1 - Nama Lahan:
- Label: "Nama Lahan *" (12px, 600)
- Input: "Lahan Gemuruh" (52px, #F9FAFB, border 1px)
- Bottom margin: 16px

Field 2 - Kategori:
- Label: "Kategori Lahan *" (12px, 600)
- Dropdown: "Tanah Kosong ▼" (select options)
- Options: Tanah Kosong, Untuk Bangunan, Pertanian, Perkebunan
- Bottom margin: 16px

Field 3 - Lokasi/Desa:
- Label: "Desa/Kelurahan *" (12px, 600)
- Input: "Gemuruh" (52px, same style)
- Bottom margin: 16px

Field 4 - Kabupaten:
- Label: "Kabupaten *" (12px, 600)
- Input: "Toba" (52px, same)
- Bottom margin: 16px

Field 5 - Koordinat GPS (optional):
- Label: "Koordinat GPS (Optional)" (12px, 600, gray)
- Inputs (side-by-side):
  ├── Latitude: "2.5521" (48px, 48% width)
  └── Longitude: "97.1234" (48px, 48% width, right-side)
  └── "Gunakan Peta" link (optional, small)
- Bottom margin: 16px


Section 2 - SPESIFIKASI LAHAN:

Field 6 - Luas Lahan:
- Label: "Luas Lahan (m²) *" (12px, 600)
- Input: "5" (52px)
- Bottom margin: 16px

Field 7 - Bentuk:
- Label: "Bentuk Tanah *" (12px, 600)
- Dropdown: "Persegi Panjang ▼"
- Options: Persegi, Persegi Panjang, Segitiga, Tidak Beraturan
- Bottom margin: 16px

Field 8 - Topografi:
- Label: "Topografi *" (12px, 600)
- Dropdown: "Datar ▼"
- Options: Datar, Landai, Curam, Berbukit
- Bottom margin: 16px

Field 9 - Lebar Jalan Depan:
- Label: "Lebar Jalan Depan (meter)" (12px, 600)
- Input: "3" (52px)
- Bottom margin: 16px


Section 3 - AKSES & UTILITAS:

Field 10 - Akses Air:
- Label: "Akses Air ke Lahan *" (12px, 600)
- Toggle switches (2 options below label):
  ├── Left: "Ada" (52px, outlined, active = red bg)
  └── Right: "Tidak Ada" (52px, outlined)
- Selected styling: red bg, white text
- Bottom margin: 16px

Field 11 - Akses Listrik:
- Label: "Akses Listrik *" (12px, 600)
- Toggle switches (same styling)
- Bottom margin: 16px

Field 12 - Kondisi Lahan:
- Label: "Kondisi Lahan *" (12px, 600)
- Buttons (toggle multiple):
  ├── "Produktif" ☑️
  ├── "Berfungsi" ☑️
  ├── "Tidak Produktif" ☐
  └── "Terbengkalai" ☐
- Spacing: 8px between
- Bottom margin: 16px


Section 4 - PEMILIK & STATUS:

Field 13 - Pemilik/Pengelola:
- Label: "Pemilik/Badan Pengelola *" (12px, 600)
- Input: "Pemerintah Kab. Toba" (52px, disabled/read-only)
- Bottom margin: 16px

Field 14 - Sertifikasi:
- Label: "Tipe Sertifikasi *" (12px, 600)
- Dropdown: "Surat Letter C ▼"
- Options: Surat Letter C, Sertifikat Tanah, SPPT PBB, Lainnya
- Bottom margin: 16px

Field 15 - Status Lahan:
- Label: "Status Lahan Saat Ini *" (12px, 600)
- Buttons (toggle):
  ├── "Tersedia" (active: green bg, round selected)
  ├── "Disewa" (gray)
  └── "Maintenance" (orange)
- Bottom margin: 16px


Section 5 - TARIF & DESKRIPSI:

Field 16 - Harga Sewa/Bulan:
- Label: "Harga Sewa per Bulan *" (12px, 600)
- Input: "500000" (52px)
- Prefix (inside): "Rp " (left, gray)
- Bottom margin: 16px

Field 17 - Deskripsi Lengkap:
- Label: "Deskripsi Lahan" (12px, 600)
- Textarea: 120px height, #F9FAFB bg, 1px border
- Placeholder: "Deskripsikan detail lahan, keunggulan, dan informasi penting lainnya..."
- Radius: 10px
- Bottom margin: 20px


[ACTION BUTTONS - Bottom, 16px padding]

Button 1 - SAVE:
- "SIMPAN PERUBAHAN" (56px, red #EC4336, white, shadow)
- Full width
- Bottom margin: 12px

Button 2 - DELETE (if edit mode):
- "HAPUS LAHAN" (48px, outline, red text, ghost style)
- Full width
- Bottom margin: 24px (safe area 34px)


═══ DESIGN NOTES:
- Comprehensive form
- All fields required marked *
- Optional (gray label)
- Toggle selections clear
- Easy data entry
- Validation shown
- Professional admin form
```

---

## ✨ PROMPT A8: MONITORING PEMBAYARAN (Payment Tracking)

```
DESIGN FIGMA AI PROMPT - PAYMENT MONITORING

PROJECT: TAPATUPA Admin
DEVICE: iPhone 17 Pro
STYLE: Financial-focused, Data-driven, Reporting

═══ PAGE LAYOUT

[Header]
- Title: "Monitoring Pembayaran" (24px, 700, #1A1A2E)
- Date range selector: "Apr 2026 ▼" (top-right, small)

[Summary Cards - horizontal scroll or grid 2x2]

Card 1 - Total Pembayaran:
- "Total Pembayaran:" (12px, gray)
- "Rp 156 Juta" (20px, 700, red)
- "78 transaksi" (10px, gray)
- Background: #FFF0EF
- Radius: 12px, padding: 16px

Card 2 - Target Bulan:
- "Target Bulan Ini:" (12px, gray)
- "Rp 200 Juta" (20px, 700, gray)
- "78% tercapai" (10px, green) with progress bar

Card 3 - Pending Pembayaran:
- "Menunggu Pembayaran:" (12px, gray)
- "Rp 44 Juta" (20px, 700, orange)
- "15 transaksi" (10px, orange) with ! icon

Card 4 - Overdue:
- "Overdue Pembayaran:" (12px, gray)
- "Rp 8 Juta" (20px, 700, red)
- "3 transaksi" (10px, red)

Margins: 16px, grid 2x2 on mobile


[Status Filter Tabs - sticky below]
- "Semua" (active red)
- "Lunas" (gray)
- "Pending" (gray)
- "Overdue" (gray)
- Same tab styling


[Payment Items / Transactions List]

Item height: 100px
Background: white
Border: 1px #E5E7EB
Radius: 12px
Padding: 12px
Margin: 12px 16px

Item layout:

Left section (15%):
- Avatar or Icon (56x56, radius 50% or 8px)
- Status colored background

Center section (60%):
- Row 1: "Lahan Gemuruh - Ahmad Syaiful" (13px, 700, #1A1A2E)
- Row 2: "Invoice #INV-2026-1001" (11px, 400, gray)
- Row 3: "15 Apr 2026" (10px, 400, gray)
- Row 4: "Periode: Apr 2026 (1 bulan)" (10px, 400, gray)

Right section (25%):
- Amount: "Rp 500.000" (14px, 700, red #EC4336)
- Status badge (pill):
  ├── "LUNAS" (green) - if paid
  ├── "PENDING" (orange) - if pending
  └── "OVERDUE" (red) - if overdue
- Days info: "2 hari lalu" (10px, gray)

On tap: Navigate to payment detail


[Detailed Payment Card - Optional]
If tap payment item, expand to show:
- Payment method
- Transaction ID
- Confirmation details
- Edit button (if needed)


[Download Report Button]
- At bottom: "📥 Download Laporan Bulan Ini" (outline, 48px)
- Margin: 16px, bottom: 34px safe area


[Empty State - if no payments]
- Icon + text
- "Belum ada pembayaran bulan ini" (16px, 700)


═══ DESIGN NOTES:
- Financial overview
- Status-based display
- Pending & overdue prioritized
- Easy transaction review
- Reporting capability
- Professional dashboard
```

---

## ✨ PROMPT A9: REPORTS & ANALYTICS

```
DESIGN FIGMA AI PROMPT - REPORTS & ANALYTICS

PROJECT: TAPATUPA Admin
DEVICE: iPhone 17 Pro
STYLE: Analytical, Data visualization, Professional

═══ PAGE LAYOUT

[Header]
- Title: "Laporan & Analitik" (24px, 700, #1A1A2E)
- Date range: "Bulan April 2026 ▼" (top-right)
- Export button (gear icon): top-right corner

[Quick Stats - 4 cards grid]

Card 1 - Permohonan Total:
- Icon: Document
- "1,247" (18px, 700)
- "Total Permohonan" (11px, gray)
- Trend: "↑ 5.2% vs bulan lalu" (10px, green)

Card 2 - Approval Rate:
- Icon: Check
- "78%" (18px, 700, green)
- "Approval Rate" (11px, gray)
- "965 disetujui" (10px, gray)

Card 3 - Revenue Target:
- Icon: Money
- "156M / 200M" (14px, 700)
- "Revenue Target" (11px, gray)
- Progress bar: 78%

Card 4 - Active Rentals:
- Icon: Home
- "156" (18px, 700)
- "Sewa Aktif" (11px, gray)
- "32 lahan tersewa" (10px, gray)

Styling: Each card in own container, grid 2x2


[Key Metrics Section - 20%]
- Title: "Metrik Utama" (16px, 700, #1A1A2E, 16px margin)

Horizontal scrollable chart cards:

Chart 1 - Permohonan Per Minggu:
- Line chart (simple, stylized)
- Y-axis: Numbers (0-400)
- X-axis: Week (W1-W4)
- Line color: red #EC4336
- Area fill: light red opacity

Chart 2 - Pembayaran Per Minggu:
- Bar chart (vertical bars)
- Bars: green for achieved, gray for pending
- Y-axis: Rp (0-100M)
- X-axis: Week (W1-W4)

Each chart: 280x150px, white bg, shadow, radius 12px


[Status Breakdown - 18%]
- Title: "Status Permohonan (Bulan Ini)" (16px, 700, 16px margin)
- Pie/Donut chart:
  ├── Approved: 65% (green)
  ├── Pending: 20% (orange)
  ├── Rejected: 10% (red)
  └── Processing: 5% (blue)
- Legend below chart (colored dots + labels)
- Chart size: 200x200px, centered


[Revenue Breakdown - 15%]
- Title: "Breakdown Pendapatan" (16px, 700, 16px margin)
- Table (simple):
  ├── Lokasi | Pendapatan | % Total
  ├── Gemuruh | Rp 24 Jt | 15%
  ├── Mabar | Rp 18 Jt | 12%
  ├── Lainnya | Rp 114 Jt | 73%
  └── Total | Rp 156 Jt | 100%
- Row styling: alternating light gray


[Action Buttons - Bottom]
- Button 1: "📥 Download PDF" (outline, 48px)
- Button 2: "📊 Buat Laporan Custom" (outline, 48px, red text)
- Button 3: "📧 Email Laporan" (outline, 48px)
- Spacing: 8px between
- Margin: 16px, bottom: 34px


═══ DESIGN NOTES:
- Data-driven analytics
- Visual charts/graphs
- Clear KPIs
- Comparison metrics
- Reporting/export capability
- Professional business intelligence
- Multiple data visualizations
```

---

## ✨ PROMPT A10: ADMIN PROFILE & SETTINGS

```
DESIGN FIGMA AI PROMPT - ADMIN PROFILE & SETTINGS

PROJECT: TAPATUPA Admin
DEVICE: iPhone 17 Pro
STYLE: Professional, Settings-focused, Personal

═══ PAGE LAYOUT

[Header - with subtle background]
- Background: Light gray #F3F4F6
- Title: "Profil Admin" (24px, 700, #1A1A2E)

[ADMIN PROFILE CARD - 20%]
- Background: white
- Shadow: subtle
- Padding: 20px
- Radius: 16px
- Margin: 16px
- Content (vertical, centered):

  1. Avatar:
  - 80x80px, circular, border 3px white
  - Background: navy #1A1A2E or image
  - Initials: "HS" (white, 24px 700)
  - Edit icon overlay (24x24, red bg, top-right)

  2. User info:
  - Name: "Hendra Simanjuntak" (18px, 700, #1A1A2E)
  - Role: "Petugas Pemerintah" (12px, 400, gray)
  - Department: "Dinas Pertanahan Kab. Toba" (11px, 400, gray)
  - Status: "🟢 Aktif" (11px, 400, green)

  3. Edit button:
  - "Ubah Profil" link (13px, 600, red)


[MENU SECTIONS - scrollable below]

═══ SECTION 1: AKUN ADMIN

[Menu Item 1]
- Icon: Person (24x24, gray)
- Title: "Data Pribadi" (14px, 500, #1A1A2E)
- Subtitle: "Kelola informasi pribadi Anda" (11px, 400, gray)
- Chevron (right): 20x20, gray
- Height: 56px, padding: 12px 16px
- Border-bottom: 1px #E5E7EB
- Tap: Navigate to edit personal data

[Menu Item 2]
- Icon: Lock (24x24, gray)
- Title: "Ubah Password" (14px, 500)
- Subtitle: "Perbarui password admin Anda" (11px, gray)
- Chevron
- Same styling


[Menu Item 3]
- Icon: Security/Shield (24x24, gray)
- Title: "Keamanan Login" (14px, 500)
- Right: Toggle switch (red when active)
- Subtitle: "Aktifkan 2FA (Two-Factor Auth)" (11px, gray, below title)
- Same styling


[Menu Item 4]
- Icon: Bell (24x24, gray)
- Title: "Notifikasi" (14px, 500)
- Right: Toggle switch
- Subtitle: "Terima notifikasi sistem" (11px, gray)


═══ SECTION 2: AKSES & PERMISSION

[Menu Item 1]
- Icon: Key (24x24, gray)
- Title: "Permission Level" (14px, 500)
- Right: Badge "LEVEL 3" (gray bg, 11px, 600)
- Subtitle: "Admin Pengawas - Akses Penuh" (10px, gray)
- Chevron
- On tap: Show permission details (read-only)


[Menu Item 2]
- Icon: Activity (24x24, gray)
- Title: "Activity Log" (14px, 500)
- Subtitle: "Lihat riwayat aktivitas login" (11px, gray)
- Chevron
- On tap: Show activity history


═══ SECTION 3: PREFERENSI SISTEM

[Menu Item 1]
- Icon: Globe (24x24, gray)
- Title: "Bahasa" (14px, 500)
- Right: "Bahasa Indonesia" (12px, gray)
- Chevron


[Menu Item 2]
- Icon: Sun (24x24, gray)
- Title: "Tema" (14px, 500)
- Toggle: "Otomatis / Terang / Gelap"
- If selected: show toggle


[Menu Item 3]
- Icon: Bell/Settings (24x24, gray)
- Title: "Zona Waktu" (14px, 500)
- Right: "GMT+7 (WIB)" (12px, gray)
- Chevron


═══ SECTION 4: BANTUAN & SUPPORT

[Menu Item 1]
- Icon: Question (24x24, gray)
- Title: "Bantuan & Panduan" (14px, 500)
- Subtitle: "FAQ, tutorial, dokumentasi" (11px, gray)
- Chevron

[Menu Item 2]
- Icon: Mail/Envelope (24x24, gray)
- Title: "Hubungi Tim Support" (14px, 500)
- Subtitle: "Email: support@tapatupa.go.id" (11px, gray)
- Chevron

[Menu Item 3]
- Icon: File (24x24, gray)
- Title: "Syarat & Ketentuan" (14px, 500)
- Chevron (opens external)

[Menu Item 4]
- Icon: Shield (24x24, gray)
- Title: "Kebijakan Privasi" (14px, 500)
- Chevron (opens external)


═══ SECTION 5: STATUS SISTEM

[Status Info - Box style]
- Background: #F9FAFB, border 1px #E5E7EB, radius 10px
- Padding: 16px, margin: 16px

Content:
- "Versi Aplikasi: 1.2.0" (11px, 400)
- "Build: 245" (11px, 400)
- "Terakhir Update: 14 Apr 2026" (11px, 400)
- "Status Server: 🟢 Normal" (11px, green)


[APP INFO - Bottom]
- Version & build info (centered, 11px, gray)
- Last updated (10px, gray)
- Margin top: 24px


[LOGOUT BUTTON - Bottom]
- Style: Outline / Ghost (red border 2px, red text)
- Text: "KELUAR" (14px, 700, red #F44336)
- Height: 48px
- Full width with 16px margins
- Top margin: 24px
- Bottom: 34px safe area
- On tap: Confirmation "Yakin ingin keluar?" → Logout


═══ DESIGN NOTES:
- Professional admin profile
- Organized menu sections
- Clear security options
- System preferences
- Support contact
- Permission transparency
- Activity tracking
- Logout functionality
```

---

---

# 📋 GUIDELINES & CONSISTENCY

## DESIGN CONSISTENCY CHECKLIST

✅ **Semua 10 halaman Admin KONSISTEN dengan:**
- ✅ Warna palette user (red, navy, gray, sama persis)
- ✅ Typography (Poppins, font sizes, weights sama)
- ✅ Spacing (8px grid, 16px page padding, sama)
- ✅ Components (buttons, inputs, cards styling sama)
- ✅ Navigation pattern (bottom nav modified for admin)
- ✅ Shadow & depth system (sama)
- ✅ Icons style (professional, consistent)
- ✅ Border radius (12px standard)

## PERBEDAAN ADMIN vs USER

| Aspek | User | Admin |
|-------|------|-------|
| **Fokus** | Browse & Rent | Manage & Monitor |
| **Data** | Personal requests | System-wide view |
| **Actions** | Apply, Pay, Track | Approve, Reject, Manage |
| **Dashboard** | My activities | KPIs & Statistics |
| **Fitur** | 12 screens | 10 screens |
| **Permission** | Limited | Full control |
| **Visual** | Customer-facing | Professional/Corporate |


## CARA GENERATE (Sama seperti User)

1. **Buka Figma** + AI Plugin
2. **Copy 1 prompt** dari dokumentasi ini
3. **Paste ke plugin** input field
4. **Generate** design
5. **Adjust colors & details** manual (kecil-kecilan)
6. **Repeat** untuk semua 10 admin prompts
7. **Ensure consistency** dengan warna & styling

## TOTAL DELIVERABLES

- ✅ **10 Halaman Admin** (berbeda dari 12 user)
- ✅ **10 AI Prompts** (semua dalam 1 file ini)
- ✅ **Design System** (konsisten dengan user)
- ✅ **Color Reference** (sama persis user)
- ✅ **Typography** (same Poppins stack)
- ✅ **Spacing System** (same 8px grid)
- ✅ **Professional Aesthetic** (upscale, corporate)
- ✅ **Copy-Paste Ready** (format optimal untuk AI plugin)

---

**STATUS:** ✅ READY FOR FIGMA AI PLUGIN  
**Total Halaman:** 10 fitur admin  
**Total Prompts:** 10 AI prompts copy-paste  
**Consistency:** 100% dengan user design  
**Format:** 1 file dokumentasi saja  

**Tinggal generate di Figma! 🚀**

