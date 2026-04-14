# 🌾 TAPATUPA - SEWA TANAH KABUPATEN TOBA
## Dokumentasi Desain UI/UX Figma AI (iPhone 17 Pro)

**Aplikasi:** TAPATUPA - Platform Sewa Tanah Digital Pemerintah Kabupaten Toba  
**Device:** iPhone 17 Pro (1170 x 2532 px)  
**Inspirasi Desain:** Living (Premium Property App) - Clean, Minimal, Berkualitas Tinggi  
**Warna Brand:** Red Energetic + Neutral Premium  
**Font:** Poppins (Modern, Profesional)  
**Status:** ✅ Dokumentasi Lengkap 1 File - Ready untuk AI Figma Plugin  
**Tanggal:** 14 April 2026

---

## 📑 DAFTAR ISI

1. [Design System](#design-system)
2. [Fitur & Halaman](#fitur--halaman-total-12)
3. [Semua Prompt AI (Copy-Paste)](#semua-prompt-ai-copy-paste)
4. [Guidelines Implementasi](#guidelines-implementasi)

---

---

# 🎨 DESIGN SYSTEM

## COLOR PALETTE (Inspirasi: Living + Premium Properties)

```plaintext
PRIMARY COLORS:
├── Primary Red:        #EC4336  (Energetic, CTA, Highlight)
├── Accent Dark Red:    #D32F2F  (Hover states, Emphasis)
├── Light Red BG:       #FFF0EF  (Soft background, Card hover)
└── Success Green:      #4CAF50  (Status approved, Success)

NEUTRAL PREMIUM:
├── Dark Navy:          #1A1A2E  (Headlines, Main text)
├── Professional Gray:  #6B7280  (Secondary text, Body)
├── Light Gray:         #F3F4F6  (Page background)
├── Soft Gray:          #EEEEEE  (Dividers, Borders)
├── Very Light Gray:    #F9FAFB  (Card backgrounds)
└── Pure White:         #FFFFFF  (Cards, Section backgrounds)

STATUS & SEMANTIC:
├── Warning Orange:     #FF9800  (Pending, Limited availability)
├── Error Red:          #F44336  (Rejected, Failed)
├── Info Blue:          #2196F3  (Information, Tips)
└── Success Green:      #4CAF50  (Completed, Approved)

GRADIENT ACCENTS (untuk hero sections):
├── Gradient 1:         From #EC4336 to #FF9800 (Warm)
├── Gradient 2:         From #1A1A2E to #2C2C3E (Dark premium)
└── Gradient 3:         From #F3F4F6 to #FFFFFF (Subtle)
```

## TYPOGRAPHY SYSTEM (Google Poppins)

```plaintext
FONT STACK: Google Poppins (Import dari Google Fonts)
Weights needed: 300, 400, 500, 600, 700, 800

TEXT STYLES:
│ Nama Style    │ Size │ Weight │ Color        │ Usage                    │
├───────────────┼──────┼────────┼──────────────┼──────────────────────────┤
│ Display 1     │ 32px │ 800    │ #1A1A2E      │ Hero sections, main title│
│ Heading 1     │ 28px │ 700    │ #1A1A2E      │ Page titles              │
│ Heading 2     │ 24px │ 700    │ #1A1A2E      │ Section titles           │
│ Heading 3     │ 20px │ 600    │ #1A1A2E      │ Subsection titles        │
│ Body Large    │ 16px │ 500    │ #1A1A2E      │ Main content text        │
│ Body Regular  │ 14px │ 400    │ #6B7280      │ Secondary content        │
│ Body Small    │ 12px │ 400    │ #6B7280      │ Captions, metadata       │
│ Label         │ 13px │ 600    │ #1A1A2E      │ Form labels, badges      │
│ Button        │ 15px │ 700    │ #FFFFFF      │ CTA buttons              │
│ Button Small  │ 12px │ 600    │ #FFFFFF      │ Secondary buttons        │
│ Caption       │ 11px │ 400    │ #9CA3AF      │ Hints, timestamps        │

LINE HEIGHT:
├── Display/Heading: 1.2 (Tight untuk visual impact)
├── Body: 1.6 (Readable, comfortable)
├── Caption: 1.4
└── Button: 1.5
```

## SPACING & SIZING (8px Grid System)

```plaintext
SPACING SCALE:
├── xs:  4px
├── sm:  8px
├── md:  16px
├── lg:  24px
├── xl:  32px
├── 2xl: 48px
└── 3xl: 64px

COMMON MEASUREMENTS:
├── Page padding: 16px (left-right)
├── Section margin: 24px (top-bottom)
├── Card padding: 16px
├── Card spacing: 12px (between cards)
├── Component gap: 8px
├── Button height: 56px
├── Small button height: 44px
├── Input field height: 52px
├── Icon size (standard): 24x24px
├── Icon size (large): 40x40px
├── Icon size (hero): 64x64px
└── Avatar: 56x56px (standard), 80x80px (profile)
```

## COMPONENT STYLES

```plaintext
BUTTONS:
Primary Button:
├── Background: #EC4336 (Red)
├── Text: #FFFFFF (White)
├── Height: 56px
├── Radius: 12px
├── Shadow: bottom 4px, blur 12px, opacity 15% (#000)
├── Hover: Background #D32F2F (darker)
└── Pressed: Background #B71C1C + reduced shadow

Ghost Button:
├── Background: Transparent
├── Text: #EC4336
├── Border: 2px #EC4336
├── Height: 56px
├── Radius: 12px
└── Hover: Background #FFF0EF

Outline Button:
├── Background: Transparent
├── Text: #1A1A2E
├── Border: 1.5px #E5E7EB
├── Height: 56px
├── Radius: 12px
└── Hover: Background #F9FAFB

CARDS:
Standard Card:
├── Background: #FFFFFF
├── Border: None
├── Shadow: blur 8px, y 2px, opacity 10%
├── Radius: 12px
├── Padding: 16px
└── Hover: Shadow increased, slight scale (1.02)

Elevated Card:
├── Background: #FFFFFF
├── Shadow: blur 16px, y 4px, opacity 12%
├── Radius: 12px
└── Padding: 16px

Dark Card:
├── Background: #1A1A2E
├── Text: #FFFFFF
├── Shadow: blur 16px, y 4px, opacity 15%
├── Radius: 12px
└── Padding: 16px

INPUT FIELDS:
Standard Input:
├── Background: #F9FAFB
├── Border: 1px #E5E7EB
├── Border-radius: 10px
├── Height: 52px
├── Padding: 12px 14px
├── Font-size: 14px
├── Focus: Border #EC4336, shadow blur 8px opacity 10%
└── Error: Border #F44336, bg #FEF2F2

BADGES & CHIPS:
Status Badge:
├── Height: 24px
├── Padding: 4px 12px
├── Radius: 12px (pill)
├── Font-size: 12px, weight 600
├── Available: #4CAF50 bg, white text
├── Pending: #FF9800 bg, white text
├── Rejected: #F44336 bg, white text
└── Sold: #9CA3AF bg, white text

DIVIDERS:
├── Color: #E5E7EB
├── Width: 1px
├── Margin: 16px 0
└── Opacity: 100%
```

## SHADOW SYSTEM

```plaintext
Shadows (using iOS style):
├── Subtle:   0 2px 8px rgba(0,0,0,0.08)
├── Medium:   0 4px 16px rgba(0,0,0,0.10)
├── Strong:   0 8px 24px rgba(0,0,0,0.12)
└── XStrong:  0 12px 32px rgba(0,0,0,0.15)
```

---

# 🎯 FITUR & HALAMAN (Total 12)

## HALAMAN AUTHENTICATION & ONBOARDING (4 Halaman)

### 1. Onboarding Screen (Carousel, 3 slides)
### 2. Role Select (User vs Admin)
### 3. Login
### 4. Register / SignUp

## HALAMAN UTAMA USER (8 Halaman)

### 5. Home Dashboard (Showcase Tanah Tersedia + Featured)
### 6. Browse Tanah (List/Grid dengan filter)
### 7. Detail Tanah (Full specifications & images)
### 8. Permohonan Sewa (Form & History)
### 9. Status Permohonan (Track progress)
### 10. Daftar Pembayaran & Tagihan
### 11. Payment Gateway & Confirmation
### 12. Profile & Settings

---

---

# 💡 SEMUA PROMPT AI (COPY-PASTE)

> **INSTRUCTIONS:** Copy setiap prompt di bawah ini (lengkap dengan detailnya), paste ke Figma AI Plugin (Make Design / Wireframer). Biarkan AI generate design. Kemudian lakukan manual adjustments kecil (warna, spasi, dll).

---

## ✨ PROMPT 01: ONBOARDING SCREEN (3 Slides Carousel)

```
DESIGN FIGMA AI PROMPT - ONBOARDING CAROUSEL

PROJECT: TAPATUPA - Aplikasi Sewa Tanah Digital Kabupaten Toba
DEVICE: iPhone 17 Pro (1170x2532px, safe area 44px top + 34px bottom)
DESIGN STYLE: Premium, Modern, Minimal - Inspired by Living Real Estate App

COLOR SCHEME:
├── Primary Red: #EC4336
├── Dark Navy: #1A1A2E
├── Gray: #6B7280
├── Light Gray: #F9FAFB
├── White: #FFFFFF
├── Small accent: #4CAF50 (green)

TYPOGRAPHY: Google Poppins (Bold: 800, Semi-bold: 700, Medium: 500, Regular: 400)

LAYOUT: 3-page carousel with indicator dots

═══ SLIDE 1: "Temukan Lahan Terbaik"
Zones (from top to bottom, 16px left-right padding):

[Hero Illustration Area - 45% of screen]
- Premium gradient background: #1A1A2E to transparent
- Central illustration: Minimal geometric landscape showing land/field (simple, abstract)
- Icons scattered: Small house, land plot, sun icons in subtle colors
- Colors in illustration: Use greens (#4CAF50), yellows (#FFC107), earth tones
- Style: Modern, minimalist, premium luxury feel

[Content Area - 55%]
- Top spacing: 24px
- Headline: "Temukan Lahan Terbaik" (28px, 700 weight, #1A1A2E, centered)
- Subtext: "Jelajahi tanah pilihan dengan lokasi strategis di Kabupaten Toba" (14px, 400 weight, #6B7280, centered, line-height 1.6)
- Spacing below text: 32px

[Indicator Dots - 24px margin bottom]
- 3 dots total
- Active dot (slide 1): #EC4336, size 10x10px
- Inactive dots: #E5E7EB, size 8x8px
- Spacing between dots: 8px

[Buttons Area]
- CTA Button: "Lanjut" (56px height, red #EC4336 bg, white text, 800 width-1, 12px radius, shadow subtle)
- Skip button (top-right, absolute): "Lewati" (13px, gray #6B7280, no background)
- Button spacing: 16px


═══ SLIDE 2: "Proses Mudah & Transparan"
[Hero Illustration - 45%]
- Illustration: Simple dashboard/flow diagram showing process steps
- Elements: Checklist marks, arrow flows, simple UI components
- Colors: Greens, blues, professional
- Style: Minimal line art

[Content Area - 55%]
- Headline: "Proses Mudah & Transparan" (28px, 700, #1A1A2E, centered)
- Subtext: "Ajukan permohonan, pantau status real-time, dan bayar dengan aman melalui aplikasi" (14px, #6B7280)
- Same indicator dots & buttons as Slide 1


═══ SLIDE 3: "Pembayaran Aman Terjamin"
[Hero Illustration - 45%]
- Illustration: Security/shield theme with payment elements
- Elements: Lock icon, payment card, checkmark
- Colors: Green accents, premium blues
- Style: Professional, trustworthy

[Content Area - 55%]
- Headline: "Pembayaran Aman Terjamin" (28px, 700, #1A1A2E, centered)
- Subtext: "Sistem pembayaran terenkripsi dan terlindungi. Panduan lengkap di setiap langkah" (14px, #6B7280)

[Final Buttons]
- Main CTA: "Mulai Sekarang" (56px, red bg, white, shadow)
- Secondary: "Login" (56px, outline style, gray border, red text)
- Spacing: 12px between buttons


═══ OVERALL DESIGN NOTES:
- Clean, premium aesthetic like Living app
- Use premium illustrations (not clipart)
- Smooth transitions between slides (implied)
- Padding consistency: 16px sides
- All text centered in content areas
- Icons: Modern, minimal style
- No clutter - only essential elements
- Professional photography/illustrations recommended
```

---

## ✨ PROMPT 02: ROLE SELECT SCREEN

```
DESIGN FIGMA AI PROMPT - ROLE SELECTION

PROJECT: TAPATUPA Sewa Tanah
DEVICE: iPhone 17 Pro (1170x2532px)
STYLE: Premium, Clean, Minimal

COLORS: Red #EC4336, Navy #1A1A2E, Gray #6B7280, White #FFFFFF, Light Gray #F9FAFB

═══ PAGE STRUCTURE

[Header - 20% top]
- Background: Subtle gradient from #F3F4F6 to white
- Spacing: 20px top padding
- Headline: "Pilih Peran Anda" (32px, 800, #1A1A2E, center)
- Subheadline: "Lanjutkan sebagai Penyewa atau Petugas Pemerintah" (14px, 400, #6B7280, center, 8px top margin)

[Content Area - centered, 16px left-right padding]
- Top spacing: 64px from header

[ROLE CARD 1 - PENYEWA/USER]
- Background: white
- Border: 1px #E5E7EB
- Border-radius: 16px
- Padding: 24px
- Shadow: subtle (blur 8px, y 2px, opacity 10%)
- Dimensions: Full width - 32px padding

Card content (vertical layout, centered):

1. Icon (top):
   - Large circular background: #FFF0EF (light red)
   - Icon inside: Land/property icon, 48x48px, red #EC4336
   - Margin bottom: 16px

2. Title: "Penyewa / Masyarakat" (18px, 700, #1A1A2E, centered)
   - Margin bottom: 8px

3. Description: "Cari, ajukan permohonan, dan sewa tanah dengan mudah"
   - Font: 13px, 400, #6B7280
   - Centered
   - Line height: 1.5

Additional element:
- Bottom of card: Green dot + "✓ Recommended" (10px, 600, #4CAF50, centered)

Hover state (visual only in design):
- Background: #FAFBFC
- Border: 2px #EC4336
- Slight shadow increase

- Bottom margin: 16px


[ROLE CARD 2 - PETUGAS/ADMIN]
- Same styling as Card 1

Card content:
1. Icon:
   - Circular background: #F3F4F6 (light gray)
   - Icon: Dashboard/settings icon, 48x48px, navy #1A1A2E

2. Title: "Petugas / Admin Pemerintah" (18px, 700, #1A1A2E)
3. Description: "Kelola lahan, persetujuan permohonan, dan monitor pembayaran"
   - 13px, 400, #6B7280

[Buttons - Bottom area, 16px padding]
- Continue button: "Lanjut" (56px height, red #EC4336, white text, 15px 700, full width, 12px radius, shadow)
- Top margin: 48px
- Bottom margin: 32px


═══ DESIGN NOTES:
- Premium card-based layout
- Icons should be professional, not cartoony
- All text centered
- Use proper shadows for depth
- Living app style: upscale, clean, minimal
- Hover state: subtle change
```

---

## ✨ PROMPT 03: LOGIN SCREEN

```
DESIGN FIGMA AI PROMPT - LOGIN FORM

PROJECT: TAPATUPA
DEVICE: iPhone 17 Pro (1170x2532px)
STYLE: Clean, Professional, Minimal

COLOR PALETTE: #EC4336, #1A1A2E, #6B7280, #F9FAFB, #FFFFFF, #E5E7EB

═══ FULL PAGE LAYOUT

[Header Section - 18% top]
- Background: Gradient subtle from #FFF0EF to white
- Spacing: 44px top (safe area) + 24px
- Logo/Brand: "TAPATUPA" (16px, 800, #EC4336, left-aligned, letter-spacing 0.5)
- Headline: "Masuk ke Akun" (28px, 700, #1A1A2E, left-aligned)
- Subheadline: "Akses aplikasi untuk mulai menyewa tanah" (13px, 400, #6B7280, left-aligned)

[Form Section - 60%]
- Left-right padding: 16px
- Top margin: 32px from headline

[Form Field 1 - Email/Username]
Label: "Email atau Username" (12px, 600, #1A1A2E, 8px bottom margin)
Input field:
├── Background: #F9FAFB
├── Border: 1px #E5E7EB
├── Height: 52px
├── Padding: 12px 14px
├── Radius: 10px
├── Placeholder: "Masukkan email Anda" (13px, gray)
├── Font: Poppins 14px, #1A1A2E
├── Icon (left): Mail icon, 20x20, gray
└── Focus state: Border #EC4336, subtle shadow

Bottom margin: 20px


[Form Field 2 - Password]
Label: "Password" (12px, 600, #1A1A2E, 8px bottom margin)
Input field:
├── Same styling as email field
├── Placeholder: "Masukkan password"
├── Icon (left): Lock icon, 20x20, gray
├── Icon (right): Eye toggle (show/hide), 20x20, gray
└── On hover: Make clickable for show/hide

Bottom margin: 12px


[Forgot Password Link]
Text: "Lupa password?" (12px, 500, #EC4336, link style)
Alignment: Right-aligned
Bottom margin: 32px


[Buttons - Bottom 18%]
1. Login Button:
   - Background: #EC4336
   - Text: "MASUK" white 15px 700 weight
   - Height: 56px
   - Width: Full width
   - Radius: 12px
   - Shadow: bottom 4px, blur 12px, opacity 15%
   - Hover: Background #D32F2F, shadow increased
   - Bottom margin: 16px

2. Register Link:
   - Text: "Belum punya akun? Daftar Sekarang"
   - Font: 13px, 400
   - "Belum punya akun?" in gray #6B7280
   - "Daftar Sekarang" in red #EC4336, 600 weight
   - Centered
   - Bottom margin: 24px


═══ DESIGN CHECKLIST:
- Professional, clean appearance
- Form fields: consistent styling
- Proper spacing for readability
- Shadow for depth on button
- Premium minimal aesthetic
- No unnecessary elements
- Icons: simple, professional
```

---

## ✨ PROMPT 04: REGISTER/SIGNUP SCREEN

```
DESIGN FIGMA AI PROMPT - REGISTRATION FORM (Multi-step)

PROJECT: TAPATUPA Sewa Tanah
DEVICE: iPhone 17 Pro
STYLE: Premium, Form-focused, Clean

═══ STEP 1: PERSONAL INFO (Majority of design)

[Header - 16% top]
- Font: "Daftar Akun Baru" (28px, 700, #1A1A2E, left)
- Subtext: "Lengkapi data pribadi Anda" (13px, 400, #6B7280)
- Top padding: 44px (safe) + 16px
- Back button (optional, top-left corner)
- Progress indicator: "1/3" in gray (top-right) or progress bar (red when filled)

[Form Fields - 16px left-right padding]
- Top margin: 24px

Field 1 - Nama Lengkap (Full Name):
- Label: "Nama Lengkap *" (12px, 600, #1A1A2E)
- Input: 52px height, #F9FAFB bg, #E5E7EB border
- Placeholder: "Masukkan nama lengkap"
- Radius: 10px
- Margin bottom: 16px

Field 2 - Email:
- Label: "Email *" (12px, 600)
- Input: Same styling
- Placeholder: "contoh@email.com"
- Margin bottom: 16px

Field 3 - Nomor Telepon (Phone - Optional):
- Label: "No. Telepon (opsional)" (12px, 600, gray)
- Input: Same styling
- Placeholder: "+62 812 3456 7890"
- Country code prefix: "+62" pre-filled (subtle)
- Margin bottom: 16px

Field 4 - Password:
- Label: "Password *" (12px, 600)
- Input: Same styling + Eye toggle
- Placeholder: "Min. 8 karakter"
- Helper text below: "Password harus mengandung huruf & angka" (10px, gray)
- Margin bottom: 20px

Field 5 - Konfirmasi Password:
- Label: "Konfirmasi Password *" (12px, 600)
- Input: Same (no eye toggle needed)
- Placeholder: "Ulangi password"
- Margin bottom: 20px

[Checkbox - Terms]
- Icon: Checkbox (unchecked by default), 18x18, border #E5E7EB
- Text: "Saya setuju dengan Syarat & Ketentuan" (12px, 400, #1A1A2E)
- "Syarat & Ketentuan" in red #EC4336 (clickable)
- Left margin for text: 8px from checkbox
- Margin bottom: 32px


[Bottom Buttons - 18% bottom]
- Button 1: "Lanjut ke Step 2" (56px, red bg, white, 15px 700, shadow)
  Margin bottom: 12px

- Button 2: "Sudah punya akun? Login" (12px, gray with red link)
  Centered, bottom margin: 24px


═══ DESIGN NOTES:
- Step indicator clear (1/3, 2/3, 3/3)
- Form validation states (not in this screen but prepare for)
- Helper text for password requirement
- All inputs consistent
- Clean, professional form design
- No distractions
- Focus on data input
```

---

## ✨ PROMPT 05: HOME DASHBOARD

```
DESIGN FIGMA AI PROMPT - HOME DASHBOARD (Landing/Browse)

PROJECT: TAPATUPA
DEVICE: iPhone 17 Pro (1170x2532px)
STYLE: Living App style - Premium Property Showcase

═══ PAGE STRUCTURE

[Top Bar Area - 12% height, 44px safe area, fixed]
- Background: white
- Left: Greeting text "Selamat Pagi, Ahmad" (14px, 500, #6B7280)
- Right: Bell icon (24x24, #1A1A2E) - notifications

[Hero Section - 35%]
- Background: Gradient #1A1A2E to #2C2C3E (dark premium)
- Content:
  - Headline: "Sewa Tanah Strategis" (32px, 800, white, left-aligned)
  - Subtext: "Di lokasi terbaik Kabupaten Toba" (14px, 400, white opacity 90%, left-aligned)
  - Margin: 20px left-right, 16px top-bottom
  - Search bar overlay (bottom):
    ├── Background: white
    ├── Icon (left): Search, 20x20, gray
    ├── Placeholder: "Cari nama lokasi..." (13px, #9CA3AF)
    ├── Height: 48px
    ├── Radius: 10px
    ├── Padding: 12px 14px
    ├── Position: 16px margins, floating effect (shadow)
    └── Margin bottom: -24px (overlap)

[Filter Chips - horizontal scroll]
- Below search (16px top margin to clear)
- Background labels: "Semua", "Luas 1-5m²", "5-10m²", "Dekat Jalan", "Dekat Air"
- Active chip: Red #EC4336 bg, white text
- Inactive: white bg, gray text, gray border 1px
- Height: 36px
- Padding: 8px 12px
- Radius: 18px (pill)
- Spacing: 8px between, 16px left margin
- Margin bottom: 16px

[Featured/Showcase Section]
- Title: "Pilihan Terbaik Kami" (18px, 700, #1A1A2E, left)
- Margin: 20px left

[Featured Card - Horizontal Scroll, 3+ items]
Card dimensions:
├── Width: 280px
├── Height: 300px
├── Radius: 12px
├── Shadow: Medium (blur 16px, y 4px, opacity 12%)
├── Background: white
├── Margin right: 12px (between cards), left margin: 16px for first
└── Margin bottom: 20px

Card content:

1. Image area (65% height):
   - Size: 280x195px
   - Gradient overlay: dark at bottom
   - Image: Land/property photo (professional)
   - Badges (top-right):
     ├── "BARU" (red bg, white text, 8px text)
     └── Price overlay: "Rp 500.000/bulan" (white text, bottom-right, 14px 700)

2. Info area (35% height, 12px padding):
   - Location name: "Tanah Gemuruh, Kab. Toba" (14px, 700, #1A1A2E)
   - Location description: "Dekat jalan raya, dekat air" (11px, 400, #9CA3AF)
   - Small icons: Ruler (area), Map (location), Star icon + "4.8"
   - Bottom: "Lihat Detail" link (12px, 600, #EC4336, right-aligned)


[Popular/Recent Listings - List view]
- Title: "Listing Terbaru" (18px, 700, #1A1A2E, 16px left margin)

List Item (repeating):
- Height: 100px
- Background: white
- Border: 1px #E5E7EB
- Radius: 10px
- Padding: 12px
- Margin: 16px left-right, 8px top-bottom
- Layout (horizontal):
  ├── Image (left): 80x80px, radius 8px
  ├── Content (center):
  │  ├── Name: "Lahan Mabar" (14px, 700, #1A1A2E)
  │  ├── Location: "2 km dari pusat" (12px, 400, #6B7280)
  │  └── Size/price: "5m² • Rp 300.000" (12px, 500, #EC4336)
  └── Arrow (right): Chevron, 20x20, gray


[Bottom Navigation Bar - 80px height, fixed]
- Will be included in all screens
- 5 tabs: Home (active), Search, Requests, Payment, Profile
- Icons + labels
- Active: Red #EC4336
- Inactive: Gray #9CA3AF


═══ DESIGN NOTES:
- Premium property showcase aesthetic (like Living)
- Multiple card formats for variety
- Clear CTAs for exploration
- Clean, organized layout
- Professional imagery
- Good use of white space
```

---

## ✨ PROMPT 06: BROWSE TANAH (List/Grid Filter)

```
DESIGN FIGMA AI PROMPT - BROWSE TANAH LISTINGS

PROJECT: TAPATUPA
DEVICE: iPhone 17 Pro
STYLE: Premium, Organized, Filterable

═══ PAGE STRUCTURE

[Header - 12%]
- Top safe area: 44px
- Left area: Back arrow (24x24, #1A1A2E)
- Center: "Jelajahi Lahan" (24px, 700, #1A1A2E)
- Right: Filter icon (24x24, #1A1A2E) - opens filter modal

[Search Bar - below header]
- Floating under header, 16px margins
- Background: white
- Border: 1px #E5E7EB
- Height: 48px
- Icon (left): Search, gray
- Placeholder: "Cari lokasi atau nama lahan..."
- Radius: 10px
- Shadow: subtle
- Margin bottom: 16px

[Filter Chips - horizontal scroll]
- Active filters displayed
- "Semua", "1-5m²", "5-10m²", "10-50m²", "Custom"
- Same styling as Home screen
- Option to clear all filters (small X icon)

[Sorting Dropdown]
- Appears right side: "Urutkan: Harga Terendah ▼"
- Options: Terdekat, Harga Terendah, Harga Tertinggi, Rating Tertinggi, Terbaru
- Margin: 16px right

[Main Content Area - 70%]

[LIST VIEW CARD - Repeating]
- Height: 110px
- Background: white
- Border: 1px #E5E7EB
- Radius: 12px
- Shadow: subtle
- Padding: 12px
- Margin: 12px left-right, 8px top-bottom
- Layout (row):

  Left section (20%):
  - Image: 70x70, radius 10px
  - Placeholder: #F3F4F6
  
  Middle section (60%):
  - Title: "Tanah Gemuruh" (14px, 700, #1A1A2E)
  - Location: "Kab. Toba / Dekat Jalan Raya" (12px, 400, #6B7280)
  - Details row: "5m² • Rp 500.000/bulan"
    └── Icons + text combo (12px, 500, #1A1A2E)
  - Rating: "⭐ 4.8 (24 ulasan)" (11px, #FF9800)
  
  Right section (20%):
  - Chevron or Heart icon
  - Bottom: "Lihat" text (10px, #EC4336)
  
  On tap: Navigate to Detail page


[ALTERNATIVE VIEW TOGGLE]
- Top-right (near filter):
  ├── Grid icon (active when grid view) - small
  └── List icon (active when list view) - small
- Toggle between list and grid view

[Grid View Cards - if selected]
- Dimensions: 2 columns per row
- Card height: 200px
- Image: 100%, 100px height, bottom radius 0
- Content area: 100px
- Overlaid pricing on bottom-right of image
- Title + Location + Price below


[Empty State - if no results]
- Icon: Package icon or empty box (64px, light gray)
- Text: "Tidak ada lahan yang sesuai" (16px, 700, #6B7280, centered)
- Subtext: "Coba ubah filter Anda" (13px, 400, gray)
- Button: "Reset Filter" (outline style)


[Bottom Navigation - fixed, 80px]
- Same across all screens


═══ DESIGN NOTES:
- Clean, scannable list design
- Easy filtering system
- Multiple sort options
- Professional imagery for each property
- Clear CTAs
- Toggle between views
- Responsive to filter changes
```

---

## ✨ PROMPT 07: DETAIL TANAH (Full Specifications)

```
DESIGN FIGMA AI PROMPT - DETAIL LAHAN PAGE

PROJECT: TAPATUPA
DEVICE: iPhone 17 Pro
STYLE: Premium, Detailed, Professional

═══ PAGE STRUCTURE

[Header Area - with image]
- Image carousel: 60% of viewport height (initially)
- Image: Professional land/property photo
- Overlays (on image):
  ├── Top-left: Back button (24x24 white, icon, dark bg circle)
  ├── Top-right: Share button (24x24 white)
  ├── Bottom-left: Badge "TERSEDIA" (green #4CAF50)
  └── Bottom-right: Image counter "1/5"
- Dots indicator below image: 5 dots (showing multiple images)
- Image gesture: Swipe to view more images

[Basic Info Card - overlapped, 16px top margin from image]
- Background: white
- Radius: 16px
- Padding: 16px
- Margin: 16px left-right
- Shadow: Medium
- Content:
  ├── Price: "Rp 500.000" (28px, 800, #EC4336)
  ├── Durasi: "/bulan" (14px, 400, gray)
  ├── Title: "Lahan Gemuruh Kabupaten Toba" (18px, 700, #1A1A2E)
  ├── Location: "📍 Dekat Jalan Raya Utama" (13px, 400, #6B7280)
  └── Rating: "⭐ 4.8 (24 reviews)" (12px, orange)

[Scrollable Content - below card]

[SECTION 1 - QUICK STATS]
- 4 stats in row format:
  ├── Icon + value (centered in small card)
  ├── "5 m²" (Luas)
  ├── "Datar" (Topografi)
  ├── "Produktif" (Status)
  └── "Resmi" (Sertifikasi)
- Each card: 70x70, radius 10px, light gray bg
- Text: 12px, 600, #1A1A2E

[SECTION 2 - DESCRIPTION]
- Title: "Deskripsi Lahan" (16px, 700, #1A1A2E)
- Paragraph: "Lahan strategis dengan lokasi dekat jalan raya utama, akses mudah, cocok untuk bisnis retail atau perumahan..." (13px, 400, #6B7280, line-height 1.6)
- "Baca selengkapnya ▼" if truncated

[SECTION 3 - SPECIFICATIONS]
- Title: "Spesifikasi" (16px, 700, #1A1A2E)
- Rows (vertical layout):
  ├── Label (left): "Luas Tanah" | Value (right): "5 m²"
  ├── Label: "Lebar Jalan" | Value: "3 meter"
  ├── Label: "Akses Air" | Value: "Tersedia"
  ├── Label: "Akses Listrik" | Value: "Tersedia"
  ├── Label: "Lokasi" | Value: "Kabupaten Toba"
  └── Label: "Penatus" | Value: "Pemerintah Kab. Toba"
- Dividers between rows: light gray 1px
- Padding: 12px vertical
- Font: 13px, 400

[SECTION 4 - LOCATION MAP]
- Title: "Lokasi" (16px, 700)
- Map embed (or placeholder): 100% width, 200px height, radius 12px
- Address text below: "Gemuruh, Kabupaten Toba, Sumatera Utara"

[SECTION 5 - OWNER/CONTACT INFO]
- Title: "Hubungi Pemilik/Admin" (16px, 700)
- Cards showing contact:
  ├── Admin avatar: 48x48, radius 50%
  ├── Name: "Pemerintah Kab. Toba" (13px, 700)
  ├── Role: "Official Owner" (11px, gray)
  └── Buttons: "Hubungi" (outline) + "Chat" (red bg)

[SECTION 6 - SIMILAR LISTINGS]
- Title: "Lahan Serupa" (16px, 700)
- Horizontal scroll cards (same as featured cards from Home)
- 3-5 cards showing

[SECTION 7 - REVIEWS/RATINGS]
- Title: "Ulasan" (16px, 700)
- Average rating: "4.8 ⭐" (20px, 700) + "24 ulasan"
- Review items (repeating):
  ├── Avatar: 40x40
  ├── Name: "Ahmad Syaiful" (12px, 700)
  ├── Date: "2 bulan lalu" (11px, gray)
  ├── Rating: "⭐⭐⭐⭐⭐" (small stars)
  ├── Review text: "Lahan bagus, lokasi strategis..." (12px, 400)
  └── Divider below each review


[Action Buttons - fixed bottom, 16px padding]
- Button 1: "Ajukan Permohonan Sewa" (56px, red #EC4336, white text, shadow)
  Full width
- Button 2: "Simpan ke Favorit" (48px, outline, gray border)
  Full width below Button 1
- Bottom safe area: 34px


═══ DESIGN NOTES:
- Premium, detailed property page
- Multiple images carousel
- All specs clearly displayed
- Map integration (reference)
- Social proof (reviews/ratings)
- Clear CTA for rental
- Living app aesthetic
- Professional, clean layout
```

---

## ✨ PROMPT 08: PERMOHONAN SEWA (Form & History)

```
DESIGN FIGMA AI PROMPT - RENTAL REQUEST PAGE (Tabbed)

PROJECT: TAPATUPA
DEVICE: iPhone 17 Pro
STYLE: Clean, Form-focused, Organized

═══ PAGE STRUCTURE

[Header - 12%]
- Background: white
- Title: "Permohonan Sewa" (24px, 700, #1A1A2E, left)
- Back arrow (top-left): 24x24
- Top safe area: 44px

[TABS - below header, sticky]
- Tab 1: "Riwayat" (14px, 400, active: red #EC4336, underline 2px)
- Tab 2: "Buat Baru" (14px, 400, inactive: gray)
- Background: white
- Height: 48px
- Divider below tabs: 1px #E5E7EB
- Tab spacing: Left-right padding 16px


═══ TAB 1: RIWAYAT PERMOHONAN

[Status Filter Chips]
- "Semua", "Pending", "Disetujui", "Ditolak", "Selesai"
- Same chip styling as before
- Below tabs: 12px margin

[Request History Items - vertical list]
- Height: 100px per item
- Background: white
- Border: 1px #E5E7EB
- Radius: 12px
- Padding: 12px
- Margin: 12px left-right, 8px top-bottom
- Layout (horizontal):

  Image (left):
  - 70x70, radius 8px
  - Placeholder for lahan image
  
  Content (middle):
  - Title: "Lahan Gemuruh" (14px, 700, #1A1A2E)
  - Status: "PENDING ⏳" (11px, 600, #FF9800 color)
  - Date: "Diajukan: 15 Apr 2026" (11px, 400, gray)
  - Amount: "Rp 500.000/bulan" (12px, 500, #EC4336)
  
  Action (right):
  - Status badge: Pill-shaped
    ├── Pending: Orange
    ├── Approved: Green
    ├── Rejected: Red
    └── Completed: Gray
  - Chevron: 20x20, gray


[Empty State - if no requests]
- Icon: Document/clipboard icon, 64x64, light gray
- Text: "Belum ada permohonan" (16px, 700, #6B7280)
- Subtext: "Mulai cari lahan dan buat permohonan" (13px, 400)
- Button: "Jelajahi Lahan" (red, outline)


═══ TAB 2: BUAT PERMOHONAN BARU (Form)

[Form Section - Scrollable, 16px padding]

Field 1 - Pilih Lahan:
- Label: "Pilih Lahan *" (12px, 600, #1A1A2E)
- Dropdown input:
  ├── Background: #F9FAFB
  ├── Border: 1px #E5E7EB
  ├── Height: 52px
  ├── Placeholder: "Cari & pilih lahan..."
  ├── Icon (right): Chevron down
  └── Tap: Shows searchable dropdown
- Bottom margin: 16px

Field 2 - Tanggal Mulai Sewa:
- Label: "Tanggal Mulai *" (12px, 600)
- Input: 52px, date picker
- Placeholder: "Pilih tanggal"
- Icon (left): Calendar
- Bottom margin: 16px

Field 3 - Durasi Sewa:
- Label: "Durasi Sewa (bulan) *" (12px, 600)
- Input: Number field
- Placeholder: "Contoh: 3"
- Bottom margin: 16px

Field 4 - Kebutuhan Khusus:
- Label: "Kebutuhan Khusus (opsional)" (12px, 600, gray)
- Textarea: 120px height
- Placeholder: "Jelaskan kebutuhan tambahan..."
- Radius: 10px
- Resize: vertical only
- Bottom margin: 20px

[Cost Summary Box]
- Background: #FFF0EF
- Border: 1px #FFCCCC
- Radius: 12px
- Padding: 16px
- Content:
  ├── "Tarif Per Bulan: Rp 500.000"
  ├── "Durasi: 3 bulan"
  ├── "Subtotal: Rp 1.500.000"
  ├── Line divider
  └── "TOTAL: Rp 1.500.000" (red, 18px, 700)
- Bottom margin: 20px

[Checkbox - Terms]
- "Saya setuju dengan Syarat & Ketentuan" (12px, 400)

[Action Button]
- "Ajukan Permohonan" (56px, red, white text, shadow, full width)


═══ DESIGN NOTES:
- Clear tab switching
- Easy-to-scan request history
- Form fields consistent
- Cost calculation clear
- Multiple status displays
- Professional form design
```

---

## ✨ PROMPT 09: STATUS PERMOHONAN (Tracking)

```
DESIGN FIGMA AI PROMPT - REQUEST STATUS / TRACKING PAGE

PROJECT: TAPATUPA
DEVICE: iPhone 17 Pro
STYLE: Clear, Informative, Status-focused

═══ PAGE STRUCTURE

[Header]
- Title: "Status Permohonan" (24px, 700, #1A1A2E)
- Subtitle: "Permohonan #REQ-2026-00456" (12px, 400, gray)
- Back arrow (top-left): 24x24

[Status Timeline Section - 35%]
- Background: white with subtle gradient
- Central vertical timeline visualization:
  ├── Step 1: "📋 Diajukan" (green circle check) - Completed
  │   Date: "15 Apr 2026"
  │
  ├── Step 2: "👤 Review Admin" (orange circle) - In Progress
  │   Date: "Est. 17 Apr 2026"
  │   Loading animation
  │
  ├── Step 3: "✅ Disetujui" (gray circle) - Pending
  │   Date: "Est. 20 Apr 2026"
  │
  └── Step 4: "💳 Pembayaran" (gray circle) - Pending
      Date: "Est. 21-25 Apr 2026"

Timeline styling:
- Circle: 24x24px, status-colored
- Connecting line: colored or gray
- Text: 12px, 600, #1A1A2E

[Current Status Card]
- Background: white
- Border: 2px #FF9800 (orange - pending)
- Radius: 12px
- Padding: 16px
- Margin: 16px, top margin: 24px
- Content:
  ├── Status icon: ⏳ Large (32x32)
  ├── Status title: "PENDING REVIEW" (16px, 700, #FF9800)
  ├── Description: "Permohonan Anda sedang ditinjau oleh admin pemerintah daerah"
  │   (13px, 400, #6B7280, line-height 1.5)
  ├── Divider
  └── Estimated time: "Estimasi waktu review: 2-3 hari kerja" (12px, 600, gray)


[Request Details Section]
- Title: "Detail Permohonan" (16px, 700, #1A1A2E)
- Card format:
  ├── Lahan: "Tanah Gemuruh" (14px, 700)
  ├── Lokasi: "Kab. Toba / Dekat Jalan Raya" (12px, gray)
  ├── Durasi: "3 bulan (15 Apr - 15 Jul 2026)" (12px, 400)
  ├── Tarif: "Rp 500.000/bulan" (12px, 500, red)
  └── Total: "Rp 1.500.000" (16px, 700, red)
- No border, subtle background #F9FAFB


[Activity Log / Progress Notes]
- Title: "Catatan Proses" (16px, 700)
- Timeline items:
  ├── "15 Apr 10:30 - Permohonan diterima"
  │   Admin: System
  │   Time: "2 hari lalu"
  │
  └── "15 Apr 10:31 - Dokumen sedang diverikasi"
      Admin: Hendra Simanjuntak
      Time: "2 hari lalu"

- Item styling:
  ├── Left: Avatar (32x32) or icon
  ├── Middle: Message text (12px, 400, #1A1A2E)
  ├── Right: Time (10px, gray)
  └── Divider between items


[Action Buttons - bottom]
- If status is Pending: "HubungiAdmin" (outline, 56px)
- If status is Approved: "Lanjut ke Pembayaran" (red, 56px) + "Simpan Dokumen" (outline)
- If status is Rejected: "Baca Alasan" (outline) + "Ajukan Ulang" (red)
- Bottom safe area: 34px


════════════════════════════════════════════
[CONDITIONAL VIEWS]

If APPROVED:
- Timeline: All steps completed except Payment
- Status card: Green border, "PERSETUJUAN DISETUJUI"
- CTA: Red "Lanjut ke Pembayaran" button

If REJECTED:
- Timeline: Show X on reject step
- Status card: Red border, "PERMOHONAN DITOLAK"
- Reason box: Red bg with reason text
- CTA: "Ajukan Ulang" + "Hubungi Support"

If COMPLETED:
- Timeline: All completed
- Status card: Green, "SELESAI"
- Message: "Selamat! Lahan siap untuk digunakan" 

════════════════════════════════════════════

═══ DESIGN NOTES:
- Clear status indication
- Step-by-step progress visualization
- Estimated timelines
- All relevant details visible
- Action buttons context-aware
- Professional status tracking
```

---

## ✨ PROMPT 10: PAYMENT & TAGIHAN (Invoices List)

```
DESIGN FIGMA AI PROMPT - PAYMENTS & INVOICES PAGE

PROJECT: TAPATUPA
DEVICE: iPhone 17 Pro
STYLE: Financial, Clear, Professional

═══ PAGE STRUCTURE

[Header]
- Title: "Pembayaran & Tagihan" (24px, 700, #1A1A2E)
- Back arrow (top-left)
- Notification bell (top-right)

[Summary Cards - horizontal scroll or grid 2x]
Card 1 - Total Tagihan:
- Background: #FFF0EF (light red)
- Title: "Total Tagihan" (12px, 600, #6B7280)
- Amount: "Rp 1.500.000" (20px, 700, #EC4336)
- Background: white-ish inside
- Radius: 12px
- Padding: 16px
- Width: calc(50% - 10px)

Card 2 - Sudah Dibayar:
- Background: #E8F5E9 (light green)
- Title: "Sudah Dibayar" (12px, 600, gray)
- Amount: "Rp 500.000" (20px, 700, #4CAF50)
- Same styling as Card 1

Cards together: 16px margin left-right


[Tab/Filter - Sticky below header]
- "Semua", "Belum Bayar", "Lunas"
- Same styling as previous tabs
- Margin: 16px top

[Invoice/Bill Items - vertical list]

Invoice Item (Repeating):
- Height: 100px
- Background: white
- Border: 1px left-side (4px thick, status-colored)
  ├── Belum Bayar: orange #FF9800
  ├── Lunas: green #4CAF50
- Radius: 10px
- Padding: 12px
- Margin: 12px left-right, 8px top-bottom

Item content (horizontal flex):

Left section (15%):
- Invoice image placeholder: 60x60, radius 8px
- Or icon: Receipt icon

Center section (65%):
- Invoice number: "#INV-2026-1001" (12px, 600, #1A1A2E)
- Lahan name: "Tanah Gemuruh" (13px, 500, #6B7280)
- Period: "Apr 2026" (11px, 400, gray)
- Due date: "Jatuh tempo: 30 Apr 2026" (10px, gray, conditional red if overdue)

Right section (20%):
- Amount: "Rp 500.000" (14px, 700, #EC4336)
- Status badge: "UNPAID" / "PAID"
  ├── Unpaid: Orange bg
  ├── Paid: Gray bg
  └── Text: 10px, white, pill-shaped
- Chevron: 20x20, gray


[Empty State - if no invoices]
Icon + text + button (same as before)


[Expanded Invoice Details - tappable]
If tapped, card expands to show:
- Full invoice details
- Payment method options
- "Bayar Sekarang" button (if unpaid)


═══ DESIGN NOTES:
- Clear financial overview
- Status-based styling
- Easy payment tracking
- Professional invoice display
- Summary cards for quick ref
```

---

## ✨ PROMPT 11: PAYMENT GATEWAY & CONFIRMATION

```
DESIGN FIGMA AI PROMPT - PAYMENT METHOD SELECTION & CONFIRMATION

PROJECT: TAPATUPA
DEVICE: iPhone 17 Pro
STYLE: Secure, Financial, Professional

═══ SCREEN 1: PAYMENT METHOD SELECTION

[Header]
- Title: "Pilih Metode Pembayaran" (24px, 700)
- Back arrow (top-left)

[Amount Due Card - top]
- Background: #F9FAFB
- Border: 1px #E5E7EB
- Radius: 12px
- Padding: 16px
- Margin: 16px
- Content:
  ├── "Jumlah Pembayaran:" (12px, gray)
  ├── "Rp 500.000" (24px, 700, red)
  ├── Divider
  └── "Lahan: Tanah Gemuruh | Periode: Apr 2026"

[Payment Method Cards]

Method 1 - Transfer Bank (Virtual Account):
- Background: white
- Border: 1px gray (2px if selected, red)
- Radius: 12px
- Padding: 16px
- Height: 80px minimum
- Margin bottom: 12px

Layout:
- Left: Bank icon (40x40)
- Center:
  ├── Title: "Transfer Bank / Virtual Account" (14px, 700, #1A1A2E)
  └── Bank options: "BCA, Mandiri, BRI" (12px, 400, gray)
- Right: Radio button (22x22, selected: red)

On selection: Card expands to show:
- Available banks: Grid of bank logos (selectable)
- Selected bank details (account number, account name)
- "Salin Nomor Rekening" button (outline)


Method 2 - E-Wallet:
- Icon: Mobile wallet
- Title: "Dompet Digital" (14px, 700)
- Providers: "GCash, OVO, Dana" (12px, gray)
- Same layout & interaction

Method 3 - Credit/Debit Card:
- Icon: Credit card
- Title: "Kartu Kredit / Debit" (14px, 700)
- Card networks: "Visa, Mastercard" (12px, gray)
- Same layout

[Security Message]
- Background: #E3F2FD (light blue)
- Border-left: 3px #2196F3
- Padding: 12px
- Radius: 8px
- Icon: Lock icon (16x16)
- Text: "Pembayaran Anda dilindungi dengan enkripsi SSL" (12px, 400, #1A1A2E)
- Margin: 20px 16px


[Payment CTA Button]
- "Lanjutkan Pembayaran" (56px, red, white text, shadow, full width)
- Margin: 16px, only active if method selected


═══ SCREEN 2: PAYMENT PROCESSING (Loading state)

[Header]
- Status: "Memproses Pembayaran..." (18px, 600, #1A1A2E)

[Loading Animation]
- Circular progress indicator: 80x80px, center
- Color: red #EC4336
- Rotating animation
- Below: "Mohon tunggu, jangan tutup aplikasi" (13px, 400, gray)


═══ SCREEN 3: PAYMENT SUCCESS

[Header]
- Remove back button
- Status: "Pembayaran Berhasil ✓" (24px, 700, #4CAF50)

[Success Icon & Message]
- Large checkmark: 80x80px, green #4CAF50
- Headline: "Transaksi Selesai" (22px, 700, #1A1A2E)
- Amount: "Rp 500.000" (20px, 700, #EC4336)
- Timestamp: "15 Apr 2026, 14:25" (12px, gray)

[Receipt Card]
- Background: white
- Border: 1px top, 3px #4CAF50
- Radius: 12px
- Padding: 16px
- Margin: 16px

Receipt details:
├── Invoice: "#INV-2026-1001" (monospace, 12px)
├── Lahan: "Tanah Gemuruh"
├── Period: "Apr 2026"
├── Metode: "Transfer Bank - Mandiri"
├── Waktu: Timestamp
└── Status: "LUNAS ✓" (green)

[Action Buttons]
- Button 1: "Download Bukti Pembayaran" (outline, 48px)
- Button 2: "Kembali ke Dashboard" (red, 56px, shadow)
- Margin: 16px, bottom: 34px safe area

═══ SCREEN 4: PAYMENT FAILED

[Header]
- Status: "Pembayaran Gagal" (24px, 700, #F44336)

[Error Icon & Message]
- Large X or error icon: 80x80px, red
- Headline: "Transaksi Gagal" (22px, 700)
- Error reason: "Saldo tidak cukup atau pembayaran ditolak bank" (13px, 400, red)

[Action Buttons]
- Button 1: "Coba Lagi" (red, 56px)
- Button 2: "Hubungi Support" (outline, 48px)


═══ DESIGN NOTES:
- Secure financial flow
- Clear method selection
- Professional payment interface
- Status feedback (processing, success, failed)
- Receipt generation capability
- Security assurance messaging
```

---

## ✨ PROMPT 12: PROFILE & SETTINGS

```
DESIGN FIGMA AI PROMPT - USER PROFILE & SETTINGS PAGE

PROJECT: TAPATUPA
DEVICE: iPhone 17 Pro
STYLE: Personal, Clean, Organized

═══ PAGE STRUCTURE

[Header - with gradient]
- Background: Gradient #F3F4F6 to white
- Safe area: 44px
- Title: "Profil Saya" (24px, 700, #1A1A2E)


[PROFILE CARD - Top section, 20%]
- Background: white
- Shadow: subtle
- Padding: 20px
- Radius: 16px
- Margin: 16px
- Centered content:

1. Avatar:
   - 80x80px, circular (radius 50%)
   - Background: #EC4336 or image
   - Initials: "AS" if no image, white text
   - Border: 3px white
   - Edit icon overlay (top-right): 24x24 circle, red bg

2. User info:
   - Name: "Ahmad Syaiful" (18px, 700, #1A1A2E, centered)
   - Email: "ahmad.syaiful@email.com" (12px, 400, gray, centered)
   - Member since: "Member sejak 15 Maret 2026" (11px, 400, gray, centered)

3. Edit button:
   - "Ubah Profil" link (13px, 600, red #EC4336, centered)


[MENU SECTIONS - below profile]

═══ SECTION 1: AKUN

[Menu Item 1]
- Icon (left): Person icon (24x24, gray)
- Title: "Data Pribadi" (14px, 500, #1A1A2E)
- Subtitle: "Kelola informasi pribadi Anda" (11px, 400, gray)
- Chevron (right): 20x20, gray
- Height: 56px
- Padding: 12px 16px
- Border-bottom: 1px #E5E7EB
- On tap: Navigate to edit personal data

[Menu Item 2]
- Icon: Lock icon (24x24, gray)
- Title: "Ubah Password" (14px, 500)
- Subtitle: "Perbarui password akun Anda" (11px, gray)
- Chevron (right)
- Same styling

[Menu Item 3]
- Icon: Bell icon (24x24, gray)
- Title: "Notifikasi" (14px, 500)
- Right side: Toggle switch (on/off, red when active)
- Height: 56px
- Padding: 12px 16px


═══ SECTION 2: RIWAYAT & DOKUMEN

[Menu Item 1]
- Icon: Clipboard icon
- Title: "Riwayat Permohonan" (14px, 500)
- Badge (right): "5" (12px, white text, red bg, rounded)
- Chevron

[Menu Item 2]
- Icon: File icon
- Title: "Riwayat Pembayaran" (14px, 500)
- Chevron

[Menu Item 3]
- Icon: Download icon
- Title: "Dokumen Perjanjian" (14px, 500)
- Chevron


═══ SECTION 3: PREFERENSI

[Menu Item 1]
- Icon: Globe icon
- Title: "Bahasa" (14px, 500)
- Right side: "Bahasa Indonesia" (12px, gray)
- Chevron

[Menu Item 2]
- Icon: Sun icon (for theme)
- Title: "Tema" (14px, 500)
- Right side: Toggle switch (or "Sistem")
- Toggle


═══ SECTION 4: BANTUAN & INFO

[Menu Item 1]
- Icon: Question icon
- Title: "Pusat Bantuan" (14px, 500)
- Subtitle: "FAQ dan tutorial penggunaan app"
- Chevron

[Menu Item 2]
- Icon: Chat icon
- Title: "Hubungi Support" (14px, 500)
- Subtitle: "Email, chat, atau telepon kami"
- Chevron

[Menu Item 3]
- Icon: File text icon
- Title: "Syarat & Ketentuan" (14px, 500)
- Chevron (opens external link)

[Menu Item 4]
- Icon: Shield icon
- Title: "Kebijakan Privasi" (14px, 500)
- Chevron (opens external link)


[APP INFO - Bottom]
- Version: "Versi 1.2.0" (11px, 400, gray, center)
- Build: "(Build 245)" (10px, gray)
- Last updated: "Terakhir diupdate: 14 Apr 2026" (10px, gray, center)
- Margin: 24px top


[LOGOUT BUTTON - Bottom]
- Style: Outline / Ghost
- Text: "KELUAR" (14px, 700, red #F44336)
- Background: Transparent
- Border: 2px red
- Height: 48px
- Full width with 16px margins
- Top margin: 24px
- Bottom: 34px safe area
- On tap: Confirmation dialog "Yakin ingin keluar?" + Logout


═══ MENU ITEM GENERAL STYLING:
- Background: white
- Height: 56px minimum
- Padding: 12px 16px
- Flex layout: icon | content | right-element
- Border-bottom: 1px #E5E7EB (except last)


═══ DESIGN NOTES:
- Clear menu structure
- All settings organized by section
- Edit capabilities
- Notification preferences toggle
- Help & support options
- Logout functionality
- Professional account management design
```

---

---

# 📋 GUIDELINES IMPLEMENTASI

## CARA PAKAI DOKUMENTASI INI

### Step 1: Preparation
Sebelum membuka Figma:
- ✅ Read design system (colors, typography, spacing)
- ✅ Understand all 12 screens/features
- ✅ Understand the context (Sewa Tanah, not parking)
- ✅ Inspiration: Living app (premium, accessible, beautiful)

### Step 2: Setup Figma
1. **Create new file** di Figma
2. **Canvas size**: iPhone 17 Pro (1170 x 2532 px)
3. **Create colors library** dengan warna-warna di Design System
4. **Import font** Google Poppins (weights: 300, 400, 500, 600, 700, 800)
5. **Create text styles** (H1, H2, Body, Button, etc.)

### Step 3: Generate Design dengan AI Plugin
1. **Buka Figma AI Plugin** (Make Design / Wireframer atau sejenis)
2. **Per screen**, copy full prompt dari dokumentasi ini
3. **Paste ke plugin input** field
4. **Generate** desain
5. **Manual adjust** (warna, spacing, text)
6. **Create frame** dan label (01_Onboarding, 02_RoleSelect, etc.)

### Step 4: Refinement
- Pastikan **colors match** design system
- Pastikan **typography sizes** correct
- Pastikan **spacing** konsisten (8px grid)
- Pastikan **icons** professional dan consistent
- Pastikan **buttons & inputs** proper styling

### Step 5: Quality Check
- All 12 screens complete
- All colors correct
- All typography correct
- All spacing consistent
- Navigation flows logical
- Icons professional & consistent
- Living app aesthetic achieved

### Step 6: Export & Use
- Export assets (icons, images)
- Share Figma link dengan developer
- Create prototype flows (optional)
- Document for development handoff

---

## NOTES PENTING

1. **Satu Dokumentasi Saja** - Semua prompts sudah di sini, tidak perlu file terpisah
2. **Copy-Paste Direct** - Setiap prompt sudah formatted untuk AI plugin Figma
3. **Living App Inspiration** - Design harus premium, clean, professional seperti Living
4. **Sewa Tanah Focus** - Bukan parkir atau hal lain, FOKUS SEWA TANAH saja
5. **12 Screens Total** - Authentication (4) + Main User Features (8)
6. **Design System Strict** - Ikuti warna, typography, spacing yang sudah ditentukan
7. **Icon Professional** - Icons harus berkualitas tinggi, bukan clipart
8. **Responsive** - iPhone 17 Pro only, design sudah optimized

---

## COLOR REFERENCE (Copy-Paste ke Figma)

```
Primary Red:       #EC4336
Accent Dark Red:   #D32F2F
Light Red BG:      #FFF0EF
Dark Navy:         #1A1A2E
Gray Professional: #6B7280
Light Gray:        #F3F4F6
Soft Border:       #EEEEEE
Very Light:        #F9FAFB
Pure White:        #FFFFFF
Success Green:     #4CAF50
Warning Orange:    #FF9800
Error Red:         #F44336
Info Blue:         #2196F3
```

---

## TYPOGRAPHY QUICK REFERENCE

```
Font: Google Poppins (semua weights)

Display 1:    32px, 800 - Hero sections
Heading 1:    28px, 700 - Page titles
Heading 2:    24px, 700 - Section titles
Heading 3:    20px, 600 - Sub titles
Body Large:   16px, 500 - Main content
Body Regular: 14px, 400 - Secondary
Body Small:   12px, 400 - Captions
Label:        13px, 600 - Form labels
Button:       15px, 700 - CTAs
Caption:      11px, 400 - Tiny text
```

---

## SPACING REFERENCE

```
Container padding:    16px (left-right)
Section margin:       24px (top-bottom)
Card padding:         16px
Card spacing:         12px (between cards)
Component gap:        8px
Button height:        56px
Input height:         52px
Avatar standard:      56x56px (80x80 for profile)
Icon standard:        24x24px
Grid base:            8px
```

---

Selesai! Satu dokumentasi lengkap untuk design TAPATUPA - Sewa Tanah Kabupaten Toba. 

**Jumlah Total:**
- ✅ **12 Fitur/Halaman**
- ✅ **12 AI Prompts** (semua dalam 1 file ini)
- ✅ **Design System Lengkap** (Warna, Typography, Spacing)
- ✅ **Guidelines Implementasi** (Step-by-step)
- ✅ **Inspirasi Living App** (Premium, Clean, Berkualitas)
- ✅ **iPhone 17 Pro Specs** (1170x2532px)
- ✅ **Copy-Paste Ready** (Semua prompts siap untuk AI Figma Plugin)

**Tinggal buka Figma, buka plugin AI, dan mulai generate design! 🚀**

