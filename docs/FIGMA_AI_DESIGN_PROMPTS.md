# 📱 TAPATUPA - FIGMA AI DESIGN PROMPTS DOCUMENTATION

**Aplikasi:** TAPATUPA (Tata Parkir Terpadu Utama Pelayanan Administrasi)  
**Design Target:** iPhone 17 Pro (1170 x 2532 px / 390 x 844 dp)  
**Design System:** Vibe-Based Design dengan AI Plugin  
**Dokumentasi Versi:** 1.0  
**Tanggal:** April 2026

---

## 🎨 DESIGN SYSTEM & BRAND IDENTITY

### Palet Warna Utama

```
Primary Red:        #EC4336 (Brand Color - Energetic, Professional)
Primary Light BG:   #FFF0EF (Soft Red Background)
Dark Text:          #1A1A2E (Deep Navy - Readability)
Gray Secondary:     #8A8A9A (Medium Gray - Supporting Text)
Divider:            #EEEEEE (Light Gray - Borders)
Inactive Dot:       #E0E0E8 (Very Light Gray - UI Elements)
Input BG:           #F7F8FA (Off-White - Input Fields)
Scaffold BG:        #F2F4F7 (Very Light Blue-Gray - Page BG)
Accent White:       #FFFFFF (Pure White - Cards, Components)
Success Green:      #4CAF50 (Status - Payment Success)
Warning Orange:     #FF9800 (Status - Pending, Alert)
Error Red:          #F44336 (Status - Rejected, Error)
```

### Typography & Text Styles

| Style | Font | Size | Weight | Color | Usage |
|-------|------|------|--------|-------|-------|
| **Heading 1** | Google Poppins | 28px | 800 (Bold) | #1A1A2E | Page Title |
| **Heading 2** | Google Poppins | 22px | 700 (Bold) | #1A1A2E | Section Title |
| **Heading 3** | Google Poppins | 18px | 600 (SemiBold) | #1A1A2E | Subsection |
| **Body Large** | Google Poppins | 16px | 500 (Medium) | #1A1A2E | Main Content |
| **Body Regular** | Google Poppins | 14px | 400 (Regular) | #8A8A9A | Supporting Text |
| **Body Small** | Google Poppins | 12px | 400 (Regular) | #8A8A9A | Captions, Hints |
| **Label** | Google Poppins | 13px | 600 (SemiBold) | #1A1A2E | Buttons, Labels |
| **Button** | Google Poppins | 16px | 700 (Bold) | #FFFFFF | CTA Buttons |

### Component Standards

**Border Radius:**
- Buttons, Round Elements: 16px
- Input Fields, Cards: 12px
- Small Components: 8px
- Illustrations, Large Shapes: 40px

**Spacing System (8px Grid):**
- XS: 4px
- S: 8px  
- M: 16px
- L: 24px
- XL: 32px
- XXL: 48px

**Shadow Styles:**
- Subtle: blur 8px, y-offset 4px, opacity 8%
- Medium: blur 16px, y-offset 8px, opacity 12%
- Strong: blur 32px, y-offset 16px, opacity 16%

---

## 📑 HALAMAN & FITUR UTAMA

### HALAMAN AUTHENTICATION (3 halaman)

---

## 1️⃣ ONBOARDING SCREEN

**File:** `lib/screens/onboarding_screen.dart`  
**Navigation:** App Launch → Role Select  
**Total Screens:** 3 slides carousel

### Design Context
Halaman pengenalan aplikasi dengan visual yang menarik, menampilkan value propositions TAPATUPA. Setiap slide memiliki ilustrasi, headline, deskripsi, dan CTA button yang konsisten.

### AI Design Prompt

```
Design an iOS onboarding carousel screen for TAPATUPA app (3 slides).

DEVICE: iPhone 17 Pro (1170x2532px)
DESIGN SYSTEM: Modern, professional, energy-efficient minimalist

COLOR PALETTE:
- Primary: #EC4336 (Red)
- Light BG: #FFF0EF
- Dark Text: #1A1A2E
- Gray: #8A8A9A
- White: #FFFFFF
- Scaffold: #F2F4F7

TYPOGRAPHY: Google Poppins (24px H1, 14px Body)

SLIDE 1: "Sewa Aset Dengan Mudah"
- Layout: Top illustration (40% height) + bottom content
- Illustration: Abstract minimal shapes in #FFF0EF background, showing friendly geometric figures representing "user" and "building/asset"
- Headline: "Sewa Aset Dengan Mudah" (24px, 800 weight, #1A1A2E)
- Description: "Temukan dan sewa aset pemerintah favorit Anda dengan beberapa klik saja. Proses yang sederhana dan transparan" (14px, 400 weight, gray #8A8A9A)
- Bottom: Indicator dots (3 dots, 1st active in red, others in #E0E0E8)
- Button: "Lanjut" (CTA button, 16px py, 100% width, red bg)
- Secondary action: "Skip" text button (gray, top-left corner)

SLIDE 2: "Pantau Status Real-Time"
- Illustration: Dashboard mockup with simple line charts, progress bars
- Headline: "Pantau Status Real-Time"
- Description: "Lacak semua permohonan, tagihan, dan pembayaran Anda kapan saja dengan dashboard yang intuitif"
- Same layout as Slide 1

SLIDE 3: "Pembayaran Aman & Terpercaya"
- Illustration: Security shield icon with payment symbols, lock icons
- Headline: "Pembayaran Aman & Terpercaya"
- Description: "Nikmati sistem pembayaran digital yang aman melalui virtual account. Semua transaksi terenkripsi dan terjamin"
- Bottom action: "Mulai Sekarang" (main CTA)
- Option: "Masuk" (secondary link button)

DESIGN DETAILS:
- All borders: 16px radius
- Card shadow: blur 16px, y-offset 8px, opacity 12%
- Spacing: 24px margins, 16px gaps
- Font: Google Poppins
- Style: Clean, modern, friendly, corporate-professional
```

---

## 2️⃣ ROLE SELECT & LOGIN SCREEN

**File:** `lib/screens/role_select_login.dart`, `lib/screens/login.dart`  
**Navigation:** Onboarding → Role Select → Login  
**Total Screens:** 2 (Role Selection, Login Form)

### 2.1 Role Select Screen

**Design Context**
User memilih role: "Masyarakat (User)" atau "Petugas (Admin)". Kedua pilihan ditampilkan dalam card yang menarik dengan icon, deskripsi, dan feedback interaktif.

### AI Design Prompt - Role Selection

```
Design a role selection screen for TAPATUPA app.

DEVICE: iPhone 17 Pro (1170x2532px)
DESIGN: Role selection with 2 large, tappable cards

LAYOUT:
- Header: "Pilih Peran Anda" (28px, 800 weight, #1A1A2E, center-aligned)
- Subheader: "Lanjutkan sebagai masyarakat atau petugas" (14px, gray, center)
- Top spacing: 80px

ROLE CARDS (2 cards, 90% width, vertical stack):

Card 1 - "MASYARAKAT (User)":
- Background: #FFFFFF with border 2px #EEEEEE
- Icon: Large building/home icon, 64x64px, color #EC4336
- Title: "Masyarakat" (18px, 600 weight, #1A1A2E)
- Description: "Cari dan sewa aset dengan mudah" (14px, gray)
- Inside padding: 24px
- Border radius: 16px
- Shadow: subtle shadow (blur 16px, y 8px, opacity 12%)
- Interactive state: On tap, background slightly changes to #FFF0EF, border becomes #EC4336

Card 2 - "PETUGAS (Admin)":
- Background: Same as Card 1
- Icon: Dashboard/management icon, 64x64px, color #EC4336
- Title: "Petugas" (18px, 600 weight, #1A1A2E)
- Description: "Kelola aset dan permohonan" (14px, gray)
- Same styling as Card 1

SPACING:
- Between cards: 20px
- Top margin: 50px from subheader
- Bottom: 50px to bottom padding

COLOR PALETTE (standard):
Primary #EC4336, White #FFFFFF, Dark #1A1A2E, Gray #8A8A9A, Divider #EEEEEE

FONT: Google Poppins throughout
STYLE: Professional, clean, modern, with subtle hover/tap feedback
```

### 2.2 Login Screen

**Design Context**
Form input untuk login dengan email/username dan password. Terdapat "Forgot Password?" link, login button, dan link ke registrasi.

### AI Design Prompt - Login Form

```
Design a login screen for TAPATUPA app.

DEVICE: iPhone 17 Pro (1170x2532px)
STRUCTURE: Header + Form + CTA + Links

HEADER SECTION (top 20% of screen):
- Background: Gradient fade from #FFF0EF to #F2F4F7 (subtle)
- Logo/Brand text: "TAPATUPA" (16px, 800 weight, #EC4336, letter-spacing 1.2)
- Main title: "Masuk ke Akun Anda" (26px, 800 weight, #1A1A2E)
- Subtitle: "Akses aset dan kelola permohonan Anda" (14px, gray, line-height 1.5)
- Spacing: 40px top padding, 30px bottom

FORM SECTION (middle 60%):
Layout: Vertical stack, 24px left-right padding

1. Email/Username Input Field:
   - Label: "Email atau Username" (13px, 600 weight, #1A1A2E, top 8px margin)
   - Input: 56px height, background #F7F8FA, border 1px #EEEEEE
   - Placeholder: "contoh@email.com" (gray)
   - Padding: 12px left-right, 14px top-bottom
   - Border radius: 12px
   - Focus state: border #EC4336, shadow subtle
   - Font: 16px, #1A1A2E
   - Bottom margin: 20px

2. Password Input Field:
   - Label: "Password" (13px, 600 weight, #1A1A2E, top 8px margin)
   - Input: Same as email field
   - Icon (right): Eye icon for show/hide password, padding 12px right
   - Placeholder: "Masukkan password Anda"
   - Bottom margin: 12px

3. Forgot Password Link:
   - Text: "Lupa Password?" (14px, 500 weight, #EC4336)
   - Alignment: Right
   - Tap: Navigate to forgot password flow
   - Bottom margin: 32px

CTA BUTTON SECTION (bottom 15%):
1. Login Button:
   - Label: "MASUK" (16px, 700 weight, white)
   - Background: #EC4336
   - Height: 56px
   - Width: 100% with 24px margins
   - Border radius: 16px
   - Shadow: blur 32px, y 16px, opacity 16% (#EC4336 with opacity)
   - Pressed state: Darker red, elevated shadow reduced
   - Disabled state: Gray background, opacity 50%
   - Bottom margin: 20px

2. Register Link:
   - Text: "Belum punya akun? Daftar Sekarang" (14px, center)
   - "Daftar Sekarang" in #EC4336 (500 weight), rest in gray
   - Bottom padding: 24px

COLORS:
- Primary: #EC4336
- Light BG: #FFF0EF
- Dark: #1A1A2E
- Gray: #8A8A9A
- Input: #F7F8FA
- Border: #EEEEEE
- White: #FFFFFF

FONT: Google Poppins
STYLE: Professional, minimalist, focus on clarity and usability
```

---

## 3️⃣ REGISTRASI SCREEN

**File:** `lib/screens/registrasi.dart`  
**Navigation:** Login → Registration → Verification (optional) → Login  
**Type:** Multi-step registration form

### Design Context
Form registrasi user dengan input: nama lengkap, email, nomor telepon, password, konfirmasi password, dan terms-of-service checkbox.

### AI Design Prompt - Registration Form

```
Design a registration screen for TAPATUPA app with multi-step form.

DEVICE: iPhone 17 Pro (1170x2532px)
STRUCTURE: Header + Step Indicator + Form Inputs + CTA

HEADER (Top 15%):
- Title: "Buat Akun Baru" (26px, 800 weight, #1A1A2E)
- Subtitle: "Isi data diri Anda untuk memulai" (14px, gray)
- Step indicator: "1/3" or progress bar (blue: #EC4336, inactive: #E0E0E8)
- Spacing: 40px top, 30px bottom

FORM SECTION - STEP 1 (Personal Data):
Padding: 24px left-right

Inputs (vertical stack, 20px spacing):

1. Nama Lengkap:
   - Label: "Nama Lengkap" (13px, 600 weight, #1A1A2E, red asterisk*)
   - Input field: 56px height, #F7F8FA background, 1px #EEEEEE border
   - Placeholder: "Masukkan nama lengkap Anda"
   - Border radius: 12px
   - Padding: 12px

2. Email:
   - Label: "Email" (13px, 600 weight, #1A1A2E, asterisk)
   - Input field: Same styling
   - Placeholder: "contoh@email.com"
   - Validation hint: "Email akan digunakan untuk login" (12px, gray)

3. Nomor Telepon (Optional):
   - Label: "No. Telepon" (13px, gray, optional label)
   - Input: Country code prefix (+62), editable phone number field
   - Placeholder: "81234567890"
   - Spacing from above: 20px

Buttons below form (20px top spacing):
- "Lanjut" button: 56px height, #EC4336, 100% width, 16px label
- Bottom: "Sudah punya akun? Masuk" (14px, gray with #EC4336 link)

CTA SPACING: 32px bottom padding

COLORS:
- Primary: #EC4336
- Inputs: #F7F8FA
- Border: #EEEEEE
- Text: #1A1A2E
- Secondary: #8A8A9A
- White: #FFFFFF

FONT: Google Poppins (Heading 800, Labels 600, Body 400)

STYLE:
- Clean, modern, form-focused design
- Smooth transitions between fields
- Error states: red border with error message below
- Success states: green checkmark or subtle highlight
```

---

## 📋 HALAMAN UTAMA USER (8 halaman)

---

## 4️⃣ HOME / DASHBOARD (Aset & Tarif Sewa)

**File:** `lib/user/aset_retribusi.dart`  
**Navigation:** Main Navigation → Home Tab  
**Type:** List/Grid view dengan search & filter

### Design Context
Halaman utama yang menampilkan daftar aset yang tersedia untuk disewa. Menampilkan: aset image, nama, tarif per unit, rating/status, dan action button untuk detail/booking.

### AI Design Prompt - Asset Listing

```
Design a home/asset listing screen for TAPATUPA app.

DEVICE: iPhone 17 Pro (1170x2532px)
STRUCTURE: Header + Search bar + Filter + Asset Cards Grid + Bottom Navigation

HEADER SECTION (Top 15%):
- Background: Linear gradient from #FFF0EF to white
- Greeting text: "Selamat Pagi, Nama User" (16px, 500 weight, #8A8A9A) [top-left]
- Main title: "Cari Aset Pemerintah" (24px, 800 weight, #1A1A2E) [left-aligned]
- Bell icon (notifications): 24x24px, color #1A1A2E, top-right corner
- Spacing: 20px top, 20px left-right

SEARCH & FILTER (Below header, 12px vertical padding):
- Search bar: 100% width, 48px height, #F7F8FA background, 1px #EEEEEE border
  - Left icon: Search icon (20x20px, gray)
  - Placeholder text: "Cari nama aset..." (gray, 14px)
  - Border radius: 12px
  - Padding: 12px left-right
  - Spacing: 12px bottom

- Filter chips (horizontal scroll):
  - Chips: "Semua", "Parkir", "Ruang Meeting", "Lapangan" (12px text, 400 weight)
  - Active chip: #EC4336 background, white text
  - Inactive: white background, #8A8A9A text, gray border
  - Height: 36px, padding: 12px horizontal, 8px vertical
  - Border radius: 20px (pill-shaped)
  - Spacing: 8px horizontal, 16px left margin
  - Scrollable: horizontal scroll
  - Bottom margin: 16px

ASSET CARDS SECTION (Scrollable list):
- Grid layout: 2 columns (vertical cards) OR Single column (horizontal cards)
- Card style: White background, 12px border radius, subtle shadow
- Card height: 280px (2-column) or 120px (1-column)
- Card padding: 12px
- Gap: 12px horizontal, 16px vertical
- Left-right margin: 16px

CARD COMPONENTS (per asset):
1. Image area: 100% width, 160px height (2-col) or 100px height (1-col)
   - Background: #F2F4F7 placeholder
   - Border radius: 8px
   - Object fit: cover
   - Overlay: Subtle gradient (dark at bottom)

2. Badge (top-right corner of image):
   - Status label: "Tersedia" or "Terbatas"
   - Background: #4CAF50 (available) or #FF9800 (limited), 80% opacity
   - Text: white, 10px, bold
   - Padding: 4px 8px
   - Border radius: 6px
   - Margin: 8px

3. Title: Aset name (14px, 600 weight, #1A1A2E), line clamp 1
   - Margin: 12px top

4. Category: "Ruang Parkir" (12px, 400 weight, gray)
   - Margin: 4px top

5. Rating row: ⭐ 4.8 (12px, bold, #1A1A2E) + (24 reviews, gray)
   - Margin: 8px top

6. Price section:
   - Label: "Tarif Sewa:" (12px, gray)
   - Price: "Rp 50.000 / hari" (16px, 700 weight, #EC4336)
   - Margin: 8px top

7. Action button: "Lihat Detail" or "Pesan Sekarang"
   - Style: Ghost button (white bg, #EC4336 border, #EC4336 text)
   - Height: 36px
   - Font: 12px, 600 weight
   - Border radius: 8px
   - Margin: 12px top
   - On tap: Navigate to asset detail page

BOTTOM SPACING:
- 24px bottom margin before navigation bar

COLORS:
- Primary: #EC4336
- Light BG: #FFF0EF
- Dark: #1A1A2E
- Gray: #8A8A9A
- Input: #F7F8FA
- Scaffold: #F2F4F7
- Border: #EEEEEE
- White: #FFFFFF
- Success: #4CAF50
- Warning: #FF9800

FONT: Google Poppins
STYLE: Modern, card-based, clean grid layout with smooth interactions
```

---

## 5️⃣ PERMOHONAN (Pengajuan & Daftar Permohonan)

**File:** `lib/user/permohonan.dart`  
**Navigation:** Main Navigation → Requests Tab  
**Type:** Tabbed interface (Daftar Permohonan + Buat Permohonan Form)

### 5.1 Daftar Permohonan (List)

### Design Context
Menampilkan daftar riwayat permohonan sewa user. Setiap permohonan menunjukkan: aset, tanggal, status, dan link ke detail.

### AI Design Prompt - Requests List

```
Design a requests list screen for TAPATUPA app.

DEVICE: iPhone 17 Pro (1170x2532px)
STRUCTURE: Header + Tabs + Filters + Request Cards + Empty State

HEADER SECTION (Top 12%):
- Title: "Permohonan Saya" (26px, 800 weight, #1A1A2E)
- Subtitle: "Kelola pengajuan sewa aset Anda" (14px, gray)
- Spacing: 20px padding all sides

TABS (Below header):
- Tab 1: "Semua" (14px, bold, #EC4336 underline if active)
- Tab 2: "Pending" (14px, gray if inactive)
- Tab 3: "Disetujui" (14px, gray)
- Tab 4: "Ditolak" (14px, gray)
- Tab 5: "Selesai" (14px, gray)
- Style: White background, 2px bottom border on active tab (#EC4336)
- Spacing: Horizontal scroll if needed, 0 padding between tabs
- Height: 50px with some padding
- Divider: 1px #EEEEEE below tabs

REQUEST CARDS (Vertical stack below tabs):
Card layout per request:
- Background: #FFFFFF
- Border: 1px #EEEEEE
- Border radius: 12px
- Padding: 16px
- Margin: 12px (left-right), 8px (top-bottom)
- Shadow: subtle (blur 8px, y 4px, opacity 8%)

Card content:
1. Top row (horizontal):
   - Left: Asset name (16px, 600 weight, #1A1A2E), left-aligned
   - Right: Status badge
     - Background: varies by status (Pending: #FF9800, Approved: #4CAF50, Rejected: #F44336, Done: gray)
     - Text: white, 10px, bold, padding 4px 8px, radius 6px

2. Middle info row:
   - Icon + Date: "📅 20 April 2026 - 25 April 2026" (12px, gray)
   - Spacing: 8px top margin

3. Bottom row (horizontal):
   - Left: "Tarif: Rp 100.000/hari" (12px, gray)
   - Right: Button "Lihat Detail" (12px, 600 weight, #EC4336, no background, underline)
   - Spacing: 8px top margin

EMPTY STATE (if no requests):
- Icon: Empty/document icon (64x64px, light gray)
- Text: "Belum Ada Permohonan" (16px, 600 weight, #8A8A9A, center)
- Subtext: "Mulai buat permohonan sewa untuk melanjutkan" (14px, gray, center)
- Button: "Buat Permohonan Baru" (primary button style, red bg)
- Spacing: Vertically centered on screen

PAGINATION / LOAD MORE:
- If many requests, show "Load More" button at bottom
- Or: Infinite scroll (auto-load when near bottom)
- Style: Gray text button, centered

COLORS:
- Primary: #EC4336
- Status colors: Pending #FF9800, Approved #4CAF50, Rejected #F44336, Done #CCCCCC
- Text: #1A1A2E
- Secondary: #8A8A9A
- Border: #EEEEEE
- White: #FFFFFF

FONT: Google Poppins
STYLE: Clean, list-based, easy scanning for status and dates
```

### 5.2 Buat Permohonan (Form)

### Design Context
Form untuk membuat permohonan sewa baru. Input: pilih aset, tanggal mulai, tanggal akhir, kebutuhan khusus/catatan.

### AI Design Prompt - Create Request Form

```
Design a "create new request" form screen for TAPATUPA app.

DEVICE: iPhone 17 Pro (1170x2532px)
STRUCTURE: Header + Form Inputs + Summary Box + CTA Buttons

HEADER:
- Title: "Buat Permohonan Baru" (26px, 800 weight, #1A1A2E)
- Subtitle: "Isi data berikut untuk mengajukan sewa" (14px, gray)
- Back button: <- arrow icon, top-left
- Spacing: 20px padding

FORM SECTION (Scrollable):
Padding: 16px left-right

INPUT GROUP 1 - ASSET SELECTION:
- Label: "Pilih Aset" (14px, 600 weight, #1A1A2E, red asterisk)
- Dropdown: 56px height, #F7F8FA background
  - Current value: "Ruang Parkir A" or placeholder "Pilih aset..."
  - Dropdown icon (right): chevron down, 20x20px, gray
  - Border: 1px #EEEEEE
  - Border radius: 12px
  - Padding: 12px
  - On tap: Show modal with asset list
- Spacing: 20px bottom

INPUT GROUP 2 - DATE RANGE:
- Row 1 - Start Date:
  - Label: "Tanggal Mulai" (14px, 600 weight, #1A1A2E, asterisk)
  - Input: 56px, white bg, #EEEEEE border
    - Placeholder: "20/04/2026"
    - Icon (left): Calendar icon
    - Padding: 12px
    - Read-only (opens date picker on tap)
  - Spacing: 20px bottom

- Row 2 - End Date:
  - Label: "Tanggal Akhir" (14px, 600 weight, #1A1A2E, asterisk)
  - Same input style as start date
  - Must be after start date
  - Spacing: 20px bottom

INPUT GROUP 3 - OPTIONAL NOTES:
- Label: "Catatan / Kebutuhan Khusus" (14px, 600 weight, gray, optional label)
- Textarea: 120px height, #F7F8FA background
  - Placeholder: "Sebutuhkan tempat parkir khusus? Ruang meeting? Dll..."
  - Border: 1px #EEEEEE, radius 12px
  - Padding: 12px
  - Resize: vertical, no resize handle
- Spacing: 20px bottom

SUMMARY BOX (Below form, before buttons):
- Background: #FFF0EF (light red)
- Border: 1px #EEEEEE
- Padding: 16px
- Border radius: 12px
- Margin: 20px bottom from form

Summary content:
1. Row: "Aset" (14px, gray): "Ruang Parkir A" (14px, bold, #1A1A2E), right-aligned
2. Row: "Periode Sewa" (14px, gray): "20 Apr - 25 Apr 2026 (5 hari)" (14px, bold, #1A1A2E)
3. Row: "Tarif Harian" (14px, gray): "Rp 50.000" (14px, #8A8A9A)
4. Divider: 1px #EEEEEE
5. Row: "Total Estimasi" (16px, 700 weight, #1A1A2E): "Rp 250.000" (18px, 700 weight, #EC4336)

CTA BUTTONS (Bottom, 16px padding):
- Button 1 - "Lanjut ke Pembayaran": 56px height, #EC4336, white text, 100% width
  - Border radius: 16px
  - Font: 16px, 700 weight, bold
  - Shadow: blur 32px, y 16px, opacity 16%
  - Margin: 12px bottom
  
- Button 2 - "Batal": 56px height, white background, #EC4336 text and border
  - Border radius: 16px
  - Font: 16px, 700 weight
  - Margin: no shadow, 24px bottom

COLORS:
- Primary: #EC4336
- Light BG: #FFF0EF
- Input: #F7F8FA
- Border: #EEEEEE
- Dark: #1A1A2E
- Gray: #8A8A9A
- White: #FFFFFF

FONT: Google Poppins
STYLE: Form-focused, clear input hierarchy, prominent summary & CTA
```

---

## 6️⃣ DETAIL PERMOHONAN

**File:** `lib/user/detail_permohonan.dart`  
**Navigation:** Requests List → Detail Permohonan  
**Type:** Detail view with multiple sections

### Design Context
Halaman detail untuk melihat informasi lengkap permohonan: aset, tanggal, status, tagihan info, dan action buttons berdasarkan status.

### AI Design Prompt - Request Detail

```
Design a request detail screen for TAPATUPA app.

DEVICE: iPhone 17 Pro (1170x2532px)
STRUCTURE: Header + Status Card + Details Section + Tagihan Section + Action Buttons

HEADER (Top 8%):
- Back button: <- arrow, top-left
- Title: "Detail Permohonan" (20px, 700 weight, #1A1A2E), center-aligned
- Spacing: 16px padding

STATUS CARD (Top section):
- Background: Gradient card with status color
  - If Pending: Orange (#FF9800) to lighter orange
  - If Approved: Green (#4CAF50) to lighter green
  - If Rejected: Red (#F44336) to lighter red
- Content:
  - Status text: "PENDING PERSETUJUAN" (16px, 700 weight, white) centered
  - Subtext: "Permohonan Anda sedang ditinjau" (12px, white, opacity 90%)
  - Animated progress indicator (if pending): Circular progress or loading animation
- Padding: 24px
- Border radius: 16px
- Margin: 16px left-right, 12px bottom

DETAILS SECTION 1 - ASSET INFO:
- Section title: "Informasi Aset" (16px, 700 weight, #1A1A2E)
- Divider: 1px #EEEEEE below title
- Content rows (vertical, left-right aligned):
  
  1. "Nama Aset" (12px, gray): "Ruang Parkir A" (14px, bold, #1A1A2E)
  2. "Kategori" (12px, gray): "Ruang Parkir" (14px, #1A1A2E)
  3. "Lokasi" (12px, gray): "JL. Merdeka No. 45, Jakarta" (14px, #1A1A2E)
  4. "Kapasitas" (12px, gray): "50 unit" (14px, #1A1A2E)
  
- Background: #FFFFFF, border 1px #EEEEEE, padding 16px, radius 12px
- Spacing: 16px bottom

DETAILS SECTION 2 - RENTAL PERIOD:
- Section title: "Periode Sewa" (16px, 700 weight, #1A1A2E)
- Content rows:
  
  1. "Tanggal Mulai" (12px, gray): "20 April 2026 (Senin)" (14px, bold, #1A1A2E)
  2. "Tanggal Akhir" (12px, gray): "25 April 2026 (Sabtu)" (14px, bold, #1A1A2E)
  3. "Durasi Sewa" (12px, gray): "5 hari" (14px, #EC4336, bold)
  4. Icon with duration: Calendar icon + "5 hari" displayed prominently
  
- Background: white, border, padding, spacing same as above

DETAILS SECTION 3 - REQUEST INFO:
- Section title: "Informasi Permohonan" (16px, 700 weight, #1A1A2E)
- Content rows:
  
  1. "No. Referensi" (12px, gray): "#REF-2026-00145" (13px, monospace, #1A1A2E)
  2. "Dibuat" (12px, gray): "18 April 2026, 10:30" (14px, #1A1A2E)
  3. "Catatan" (12px, gray): "Membutuhkan tempat parkir dekat entrance" (12px, gray, italic), optional
  
- Same styling

TARIFF CALCULATION SECTION:
- Section title: "Rincian Tarif" (16px, 700 weight, #1A1A2E)
- Background: #FFF0EF
- Padding: 16px
- Border radius: 12px
- Content rows (right-aligned prices):

  1. "Tarif Harian" (12px, gray): "Rp 50.000" (13px, gray)
  2. "Durasi" (12px, gray): "5 hari" (13px, gray)
  3. "Subtotal" (13px, gray): "Rp 250.000" (14px, gray)
  4. "Pajak (10%)" (12px, gray): "Rp 25.000" (13px, gray)
  - Divider: 1px #EEEEEE
  5. "TOTAL" (14px, 700 weight, #1A1A2E): "Rp 275.000" (18px, 700 weight, #EC4336)

- Spacing: 16px bottom

APPROVAL/REJECTION INFO (Conditional):
- If approved:
  - Box: Green tint (#4CAF50 opacity 10%)
  - Icon: Green checkmark
  - Text: "Permohonan Disetujui" (14px, bold, #4CAF50)
  - By info: "Disetujui oleh: Admin Ahmad" (12px, gray)
  - Date: "18 April 2026, 11:00" (12px, gray)
  
- If rejected:
  - Box: Red tint
  - Icon: Red X mark
  - Text: "Permohonan Ditolak" (14px, bold, #F44336)
  - Reason: "Aset sudah dipesan untuk tanggal tersebut" (12px, red)
  
- Padding: 16px, radius 12px

ACTION BUTTONS (Bottom, 16px padding):
- Button 1 (if pending): "Batalkan Permohonan" (56px, white bg, red text/border)
- Button 1 (if approved): "Lihat Tagihan" (56px, #EC4336 bg, white text) linking to invoice
- Button 1 (if rejected): "Buat Permohonan Baru" (56px, #EC4336 bg, white text)

- All buttons: 100% width, 16px radius, 700 weight label, shadow on primary

COLORS:
- Primary: #EC4336
- Light BG: #FFF0EF
- Dark: #1A1A2E
- Gray: #8A8A9A
- Success: #4CAF50
- Error: #F44336
- Warning: #FF9800
- Border: #EEEEEE
- White: #FFFFFF

FONT: Google Poppins
STYLE: Information-dense, clear status indication, prominent action CTAs
```

---

## 7️⃣ TAGIHAN (Invoice / Bill Listing)

**File:** `lib/user/tagihan.dart`  
**Navigation:** Main Navigation → Bills Tab  
**Type:** List view with tabs for status

### Design Context
Menampilkan daftar tagihan yang perlu dibayar atau sudah dibayar. Setiap tagihan menunjukkan: aset, jumlah, due date, status pembayaran.

### AI Design Prompt - Bills/Invoices Listing

```
Design a bills/invoices listing screen for TAPATUPA app.

DEVICE: iPhone 17 Pro (1170x2532px)
STRUCTURE: Header + Tabs + Filter + Invoice Cards + Summary + Empty State

HEADER (Top 12%):
- Title: "Tagihan Saya" (26px, 800 weight, #1A1A2E)
- Subtitle: "Kelola dan bayar tagihan sewa aset" (14px, gray)
- Spacing: 20px padding

TABS & STATUS FILTER:
- Tab 1: "Belum Bayar" (14px, bold if active, #EC4336 underline)
- Tab 2: "Lunas" (14px, gray)
- Tab 3: "Overdue" (14px, gray) - if any overdue items
- Style: White bg, 2px underline on active, horizontal layout
- Height: 50px
- Divider: 1px #EEEEEE below

INVOICE CARDS (Vertical stack):
Card layout - Horizontal card design for easy scanning:

- Background: #FFFFFF
- Border: 2px solid (varies by status)
  - Unpaid: gray #EEEEEE
  - Paid: green #4CAF50 opacity 30%
  - Overdue: red #F44336 opacity 30%
- Border radius: 12px
- Padding: 16px
- Margin: 12px (left-right), 8px (top-bottom)
- Shadow: subtle blur 8px

Card content (structured):

1. Top row (horizontal):
   - Left: 
     - Asset name: "Ruang Parkir A" (16px, 700 weight, #1A1A2E)
     - Invoice no: "#INV-2026-0523" (12px, gray)
   - Right: 
     - Status badge:
       - "BELUM BAYAR": Orange #FF9800 bg, white text, rounded
       - "LUNAS": Green #4CAF50 bg, white text
       - "OVERDUE": Red #F44336 bg, white text
     - Font: 10px, bold, padding 4px 8px, radius 6px

2. Middle row (horizontal):
   - Left: "Periode: 20 - 25 Apr 2026" (12px, gray)
   - Right: "5 hari" (12px, bold, #1A1A2E)

3. Line item row (gray divider 1px above and below):
   - "Rp 50.000/hari × 5 hari" (12px, gray): "Rp 250.000" (12px, #1A1A2E)
   - "Pajak (10%)" (12px, gray): "Rp 25.000" (12px, #1A1A2E)

4. Bottom row (horizontal):
   - Left:
     - "Total: " (12px, gray) + "Rp 275.000" (14px, 700 weight, #EC4336)
     - Below: "Jatuh Tempo: 27 Apr 2026" (11px, gray or red if overdue)
   - Right (if unpaid):
     - "Bayar Sekarang" button (48px height, #EC4336 bg, white text, 10px font)
     - Border radius: 8px
     - On tap: Navigate to payment page

SUMMARY BOX (Below cards, optional):
- Background: #FFF0EF
- Padding: 16px
- Border radius: 12px
- Margin: 16px left-right

Content:
- Row 1: "Total Belum Bayar:" (13px, gray) right-aligned "Rp 550.000" (16px, bold, #EC4336)
- Row 2: "Total Lunas:" (13px, gray) right-aligned "Rp 1.200.000" (14px, bold, #4CAF50)

EMPTY STATE (if no invoices):
- Icon: Receipt/document icon (64x64px, light gray)
- Text: "Belum Ada Tagihan" (16px, 700 weight, #8A8A9A)
- Subtext: "Semua resmi pelunasan Anda, terima kasih!" (14px, gray)
- Centered vertically

COLORS:
- Primary: #EC4336
- Status: Unpaid #FF9800, Paid #4CAF50, Overdue #F44336
- Dark: #1A1A2E
- Gray: #8A8A9A
- Light BG: #FFF0EF
- Border: #EEEEEE
- White: #FFFFFF

FONT: Google Poppins
STYLE: Scannable list, prominent amounts, status-based styling
```

---

## 8️⃣ PEMBAYARAN (Payment Gateway & Process)

**File:** `lib/user/pembayaran.dart` & `lib/user/pembayaran-tagihan.dart`  
**Navigation:** Invoice/Request → Payment  
**Type:** Multi-step payment flow

### 8.1 Payment Method Selection

### Design Context
Halaman pemilihan metode pembayaran. Opsi: Virtual Account (Bank), E-wallet, Transfer Manual, dll.

### AI Design Prompt - Payment Method Selection

```
Design a payment method selection screen for TAPATUPA app.

DEVICE: iPhone 17 Pro (1170x2532px)
STRUCTURE: Header + Payment Summary + Method Options + Selected Method Details + CTA

HEADER (Top 10%):
- Back button: <- arrow, top-left
- Title: "Pilih Metode Pembayaran" (24px, 700 weight, #1A1A2E)
- Spacing: 16px padding

PAYMENT SUMMARY BOX (Below header):
- Background: #FFF0EF (light red)
- Border: 1px #EEEEEE
- Padding: 16px
- Border radius: 12px
- Margin: 12px

Content:
1. "Tagihan:" (12px, gray) | "Rp 275.000" (14px, bold, #1A1A2E), right-aligned
2. "Aset:" (12px, gray) | "Ruang Parkir A" (14px, #1A1A2E), right-aligned
3. "Periode:" (12px, gray) | "20-25 Apr 2026" (14px, #1A1A2E), right-aligned
- Divider: 1px #EEEEEE
4. "Pembayaran Sebelum:" (12px, gray) | "27 April 2026" (14px, bold, #EC4336), right-aligned

PAYMENT METHOD OPTIONS (Scrollable list):
Margin: 16px left-right

METHOD CARD 1 - VIRTUAL ACCOUNT (Bank):
- Background: white
- Border: 2px solid (gray by default, #EC4336 if selected)
- Padding: 16px
- Border radius: 12px
- Margin: 12px bottom
- Shadow: subtle

Structure:
1. Top row:
   - Left: 
     - Icon: Bank building icon (40x40px, #1A1A2E)
     - Title: "Virtual Account Bank" (16px, 700 weight, #1A1A2E)
     - Subtitle: "Transfer via bank pilihan Anda" (12px, gray)
   - Right: Radio button (20x20px, #EC4336 if selected)

2. Payment details (if selected, expanded):
   - Bank list: BCA, Mandiri, BRI, etc. (each 48px, with bank logo)
   - Selected bank highlight: light blue background
   - Account number input: "2845001234567" (copy icon on right)
   - "Salin No. Rekening" button (ghost style, white bg, gray border)

OPTION: Collapsible details section

METHOD CARD 2 - E-WALLET:
- Same structure as method 1
- Icon: Mobile wallet icon
- Title: "Dompet Digital"
- Subtitle: "GCash, OVO, Dana, DANA"
- If selected: show list of available e-wallets

METHOD CARD 3 - DEBIT/CREDIT CARD:
- Same structure
- Icon: Credit card icon
- Title: "Kartu Debit/Kredit"
- Subtitle: "Mastercard, Visa, etc"
- If selected: Show form
  - "Nomor Kartu" input
  - "Nama Pemegang" input
  - "Tanggal Berlaku" input
  - "CVV" input
  - "Simpan kartu" checkbox

METHOD CARD 4 - MANUAL TRANSFER:
- Same structure
- Icon: Manual transfer icon
- Title: "Transfer Manual"
- Subtitle: "Transfer langsung ke rekening pemerintah"
- If selected: Show bank details
  - Bank: "Bank Mandiri"
  - Account name: "Pemerintah Kota Jakarta"
  - Account number: "0006854321" (copyable)

INSTRUCTION TEXT (if selected method):
- Background: very light blue (#F0F4FF)
- Padding: 12px
- Border radius: 8px
- Border left: 3px #EC4336

Content:
- "Instruksi Pembayaran:" (12px, bold, #1A1A2E)
- "Lakukan transfer ke rekening di atas dengan nominal Rp 275.000 / Masukkan PIN e-wallet Anda / Finish payment at terminal" (depends on method)

CTA BUTTONS (Bottom):
- Button 1: "Lanjutkan ke Pembayaran" (56px, #EC4336, white text, 100% width, 16px radius)
  - Only enabled if method selected
  - Disabled state: gray opacity 50%
- Spacing: 16px bottom

COLORS:
- Primary: #EC4336
- Light BG: #FFF0EF
- Dark: #1A1A2E
- Gray: #8A8A9A
- Border: #EEEEEE
- White: #FFFFFF
- Info BG: #F0F4FF

FONT: Google Poppins
STYLE: Clear options, expandable details, radio-style selection
```

### 8.2 Payment Confirmation & Status

### Design Context
Halaman konfirmasi pembayaran atau proses pembayaran sedang berlangsung. Menampilkan ringkasan dan status pembayaran (pending, success, failed).

### AI Design Prompt - Payment Processing/Confirmation

```
Design a payment confirmation and processing screen for TAPATUPA app.

DEVICE: iPhone 17 Pro (1170x2532px)
STRUCTURE: 
  - DURING PROCESSING: Header + Animated Loading + Status Indicator
  - AFTER SUCCESS/FAILURE: Header + Status Card + Details + Invoice Link + Receipt

═══════════════════════════════════════════════════════════
STATE 1: PAYMENT PROCESSING (Loading)
═══════════════════════════════════════════════════════════

HEADER (Minimal):
- Centered: "Memproses Pembayaran..." (20px, 700 weight, #1A1A2E)
- Spacing: 40px top

CENTERED CONTENT AREA:
- Animated circular progress: 120x120px
  - Color: #EC4336
  - Background ring: #E0E0E8
  - Rotating animation
  - Duration: 1-3 seconds loop

- Below animation: "Mohon Tunggu" (16px, bold, #1A1A2E), centered
- Subtext: "Kami sedang memverifikasi pembayaran Anda..." (12px, gray, centered)

- Bottom instruction: "Jangan tutup aplikasi atau kembali" (12px, red #F44336, italic)

═══════════════════════════════════════════════════════════
STATE 2: PAYMENT SUCCESS
═══════════════════════════════════════════════════════════

HEADER:
- Back button: Disabled (grayed out) - force forward action
- Center: "Pembayaran Berhasil" (24px, 700 weight, #1A1A2E)

SUCCESS CARD (Large, prominent):
- Background: White with top border 4px #4CAF50
- Centered content:
  - Icon: Large checkmark or success animation (96x96px, #4CAF50)
  - Title: "Transaksi Berhasil" (22px, bold, #1A1A2E), center
  - Amount: "Rp 275.000" (28px, bold, #EC4336), center
  - Date-time: "27 April 2026, 14:35" (12px, gray, center)
  
- Padding: 32px, border radius: 16px, margin: 16px

INVOICE DETAILS SECTION:
- White background, border 1px #EEEEEE, padding 16px, radius 12px
- Margin: 12px

Details (rows):
1. "Referensi Pembayaran" (12px, gray): "#PAY-2026-08745" (13px, monospace, bold)
2. "Metode" (12px, gray): "Virtual Account - Mandiri" (13px, #1A1A2E)
3. "Nama Pemegang" (12px, gray): "John Doe" (13px, #1A1A2E)
4. "Periode Sewa" (12px, gray): "20 - 25 Apr 2026" (13px, #1A1A2E)
5. "Status" (12px, gray): "LUNAS" (13px, bold, #4CAF50)

Status indicator: Green dot + "Lunas" text, left-aligned before last row

ACTION SECTION:
- Row 1: "📥 Download Bukti Pembayaran" button
  - Ghost button: white bg, gray border, 48px height, 100% width
  - On tap: Download PDF receipt
  
- Row 2 (with 12px top spacing): "🏠 Kembali ke Beranda" button
  - Primary button: #EC4336 bg, white text, 48px height, 100% width
  - On tap: Navigate to home

BOTTOM MESSAGE:
- "Perjanjian sewa akan kami proses segera" (12px, center, gray)
- "Terima kasih telah menggunakan TAPATUPA" (12px, center, #EC4336)

═══════════════════════════════════════════════════════════
STATE 3: PAYMENT FAILED
═══════════════════════════════════════════════════════════

SUCCESS CARD - Changed to:
- Background: White with top border 4px #F44336
- Icon: Large X or error icon (96x96px, #F44336)
- Title: "Pembayaran Gagal" (22px, bold, #1A1A2E)
- Error reason: "Saldo tidak cukup atau transaksi ditolak bank" (13px, red)

ACTION BUTTONS:
- Button 1: "Coba Lagi" (primary, #EC4336)
  - Navigates back to payment method selection
- Button 2: "Hubungi Support" (ghost button)
  - Opens chat or support link

═══════════════════════════════════════════════════════════

COLORS:
- Primary: #EC4336
- Success: #4CAF50
- Error: #F44336
- Dark: #1A1A2E
- Gray: #8A8A9A
- Border: #EEEEEE
- White: #FFFFFF

FONT: Google Poppins
STYLE: Clear status communication, prominent success/error indication, action-oriented
```

---

## 9️⃣ PROFIL PENGGUNA (User Profile)

**File:** `lib/user/user_profile_page.dart`, `lib/user/profile.dart`  
**Navigation:** Main Navigation → Profile Tab  
**Type:** Profile & Settings view

### Design Context
Menampilkan informasi profil user, data pribadi, riwayat aktivitas, dan pengaturan akun.

### AI Design Prompt - User Profile

```
Design a user profile screen for TAPATUPA app.

DEVICE: iPhone 17 Pro (1170x2532px)
STRUCTURE: Header + Profile Card + Menu Sections + Logout + Version Info

HEADER (Top gradient):
- Background: Linear gradient from #FFF0EF to white
- Spacing: 20px top padding

PROFILE CARD (Top section, 20% height):
- Background: White
- Padding: 24px
- Border radius: 16px
- Margin: 0 16px
- Shadow: medium   blur 16px

Content (vertical, centered):
1. Avatar: Circular image 80x80px
   - Background: #EC4336 if no image
   - Initials: "JD" in white (16px, bold)
   - Border: 2px white
   - Editable: camera icon overlay (24x24px)

2. User info (below avatar):
   - Name: "John Doe" (18px, 700 weight, #1A1A2E, center)
   - Email: "john.doe@email.com" (13px, gray, center)
   - Status: "Member sejak 15 Maret 2026" (11px, gray, italic, center)

3. Edit button (below info):
   - "Ubah Profil" (13px, #EC4336, center)
   - On tap: Navigate to edit profile form

MENU SECTIONS (Scrollable list below profile):
Vertical stack with section dividers

SECTION 1 - ACCOUNT:
Title: "AKUN" (11px, 700 weight, gray, uppercase) top padding 20px

Menu items (list items):
- Item height: 52px
- Padding: 16px left-right
- Border-bottom: 1px #EEEEEE

1. "👤 Data Pribadi" (16px, #1A1A2E)
   Right: Chevron icon (20x20, gray)
   - Tap: Edit personal info

2. "🔐 Ubah Password" (16px, #1A1A2E)
   Right: Chevron
   - Tap: Open change password form

3. "📧 Email & Notifikasi" (16px, #1A1A2E)
   Right: Chevron or toggle
   - Tap: Toggle notification preferences

SECTION 2 - ACTIVITY:
Title: "AKTIVITAS" (11px, gray, uppercase, top 20px)

1. "📋 Riwayat Permohonan" (16px, #1A1A2E)
   Right: Badge with count "12" (10px, bg #EC4336, white)
   - Tap: Show request history

2. "📄 Riwayat Pembayaran" (16px, #1A1A2E)
   Right: Chevron
   - Tap: Show payment history

3. "📥 Unduh Laporan" (16px, #1A1A2E)
   Right: Chevron
   - Tap: Export reports (PDF/CSV)

SECTION 3 - SETTINGS:
Title: "PENGATURAN" (11px, gray, uppercase, top 20px)

1. "🌙 Mode Gelap" (16px, #1A1A2E)
   Right: Toggle switch (active/inactive, color #EC4336)

2. "🌍 Bahasa" (16px, #1A1A2E)
   Right: "Indonesia" (12px, gray) + Chevron
   - Tap: Select language

3. "🔔 Notifikasi Push" (16px, #1A1A2E)
   Right: Toggle switch

4. "🔒 Privasi" (16px, #1A1A2E)
   Right: Chevron
   - Tap: Privacy settings

SECTION 4 - HELP & INFO:
Title: "BANTUAN" (11px, gray, uppercase, top 20px)

1. "❓ FAQ" (16px, #1A1A2E)
   Right: Chevron
   
2. "💬 Hubungi Support" (16px, #1A1A2E)
   Right: Chevron
   - Options: Chat, Email, Phone

3. "📜 Syarat & Ketentuan" (16px, #1A1A2E)
   Right: Chevron
   - Opens web page

4. "🔗 Kebijakan Privasi" (16px, #1A1A2E)
   Right: Chevron
   - Opens web page

BOTTOM SECTION:
- App version: "Versi 1.0.0 (Build 145)" (11px, gray, center-aligned, bottom 24px)
- Last updated: "Terakhir diperbarui: 14 April 2026" (10px, gray, center)

LOGOUT BUTTON:
- Location: Bottom, above version info
- Style: Ghost button (white bg, red border, red text)
- Label: "KELUAR" (16px, 700 weight, #F44336)
- Height: 48px
- Width: 100% with 16px margins
- Top spacing: 24px, bottom spacing: 32px
- On tap: Show confirmation dialog, then logout

COLORS:
- Primary: #EC4336
- Dark: #1A1A2E
- Gray: #8A8A9A
- Border: #EEEEEE
- Light BG: #FFF0EF
- White: #FFFFFF
- Error: #F44336

FONT: Google Poppins
STYLE: Menu-based layout, clear sections, account-focused
```

---

## 🗺️ NAVIGATION & FLOW

### Bottom Navigation Bar (Shared across all main screens)

```
Design bottom navigation bar for TAPATUPA app.

DEVICE: iPhone 17 Pro (1170x2532px)
LOCATION: Bottom of screen, fixed

STRUCTURE:
- Background: #FFFFFF
- Height: 80px (accounting for iPhone safe area)
- Border-top: 1px #EEEEEE
- Shadow: Subtle upward shadow (blur 16px, y -4px)

NAVIGATION ITEMS (5 tabs, horizontal layout):

Tab 1 - HOME:
- Icon: Home icon (24x24px)
- Label: "Beranda" (10px, 400 weight)
- Active: Icon & label in #EC4336
- Inactive: Icon & label in #8A8A9A
- Tap area: 56x56px centered

Tab 2 - SEARCH / ASSETS:
- Icon: Search/magnifying glass (24x24px)
- Label: "Cari" (10px)
- Same styling

Tab 3 - REQUESTS (Center):
- Icon: document/clipboard (26x26px, slightly larger)
- Label: "Permohonan" (10px)
- Badge: Red dot + number "3" (if unread, center-top of icon)
- Same interactive styling

Tab 4 - BILLS:
- Icon: Receipt/bill icon (24x24px)
- Label: "Tagihan" (10px)
- Badge: Red dot + number if unpaid
- Same styling

Tab 5 - PROFILE:
- Icon: Person/user icon (24x24px)
- Label: "Profil" (10px)
- Same styling

SPACING:
- Icons: 20px top padding
- Labels: 4px below icons
- Total height per tab content: 56px (icon 24 + 4px gap + label 10px)

ANIMATION:
- Active icon: Scale slightly (1.1x)
- Tap feedback: Brief opacity fade
- Transition: 200ms ease

COLORS:
- Active: #EC4336 (icon + label)
- Inactive: #8A8A9A (icon + label)
- Badge BG: #F44336 (red)
- Badge text: white (10px, bold)

FONT: Google Poppins
STYLE: Clean iOS-style navigation, professional appearance
```

---

## 📊 SUMMARY: TOTAL FITUR & PROMPTS

| No | Kategori | Fitur / Halaman | File | Jumlah Prompt |
|----|----------|----------------|------|--------------|
| 1 | Authentication | Onboarding (3 slides) | onboarding_screen.dart | 1 |
| 2 | Authentication | Role Selection | role_select_login.dart | 1 |
| 3 | Authentication | Login Form | login.dart | 1 |
| 4 | Authentication | Registration | registrasi.dart | 1 |
| 5 | Main - User | Home / Asset Listing | aset_retribusi.dart | 1 |
| 6 | Main - User | Request List | permohonan.dart | 1 |
| 7 | Main - User | Create Request Form | permohonan.dart (form tab) | 1 |
| 8 | Main - User | Request Detail | detail_permohonan.dart | 1 |
| 9 | Main - User | Bills/Invoices List | tagihan.dart | 1 |
| 10 | Main - User | Payment Method Selection | pembayaran.dart | 1 |
| 11 | Main - User | Payment Processing | pembayaran-tagihan.dart | 1 |
| 12 | Main - User | User Profile | user_profile_page.dart | 1 |
| 13 | Navigation | Bottom Navigation Bar | main_navigation.dart | 1 |

**TOTAL FITUR:** 13 halaman/komponen utama  
**TOTAL PROMPTS:** 13 prompt detail (1 prompt per fitur)  
**DEVICE:** iPhone 17 Pro (1170 x 2532 px)  
**DESIGN SYSTEM:** Vibe-based minimalist professional

---

## 🎯 CARA MENGGUNAKAN DOKUMENTASI INI DI FIGMA

### Langkah-langkah untuk setiap fitur:

1. **Buka Figma** dan buat file baru dengan ukuran iPhone 17 Pro (1170x2532)
2. **Buat frame/page** untuk setiap fitur (contoh: "01 - Onboarding")
3. **Salin PROMPT** dari dokumentasi ini
4. **Gunakan AI Plugin** (Contoh: "Make Design" atau "Wireframer" di Figma)
5. **Paste prompt** lengkap ke AI plugin
6. **Adjust hasil** sesuai warna & brand guideline
7. **Simpan & share** dengan tim

### Tips:

- ✅ **Konsistensi:** Selalu reference design system (warna, typography, spacing)
- ✅ **Iterasi:** Jika hasil belum perfect, refine prompt dengan detail tambahan
- ✅ **Naming:** Beri nama frame sistematis (01, 02, 03, dll)
- ✅ **Component Library:** Buat reusable components (buttons, cards, inputs)
- ✅ **Handoff:** Export ke dev dengan annot ations

---

## 💡 CATATAN PENTING

- Semua warna sudah didefinisikan di `lib/styles/app_styles.dart` Flutter project
- Typography menggunakan Google Poppins font (tersedia di Google Fonts)
- Spacing mengikuti 8px grid system untuk konsistensi
- Design sistem ini sudah compatible dengan Flutter Material 3 design principles
- Untuk Admin/Petugas, akan ada halaman dashboard terpisah (belum didokumentasi di sini)

---

**Dokumentasi Dibuat:** 14 April 2026  
**Status:** ✅ Complete & Ready for AI Design Generation  
**Version:** 1.0 - Initial Release
```
