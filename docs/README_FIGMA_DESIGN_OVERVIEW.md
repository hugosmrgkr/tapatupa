# 🚀 TAPATUPA FIGMA DESIGN PROJECT - COMPLETE DOCUMENTATION OVERVIEW

**Status:** ✅ READY TO START DESIGN  
**Version:** 1.0 - Complete Documentation Suite  
**Date Created:** 14 April 2026  
**Platform:** Figma + AI Plugin (Make Design / Wireframer)  
**Device:** iPhone 17 Pro (1170 x 2532 px)  
**Total Files:** 4 comprehensive guides

---

## 📚 DOKUMENTASI YANG TELAH DIBUAT

Kami telah menyiapkan **4 file dokumentasi lengkap** yang saling melengkapi:

### 1️⃣ **FIGMA_AI_DESIGN_PROMPTS.md** 
**→ File Utama: Panduan Lengkap Setiap Fitur**

📄 **Isi:**
- Design System Komprehensif (Warna, Typography, Spacing, Shadows)
- 13 fitur dengan prompt DETAIL & PANJANG untuk setiap halaman
- Penjelasan mendalam tentang layout, component, dan interaksi
- Design context & rationale untuk setiap halaman
- Navigation flow & footer component

📋 **Kapan digunakan:**
- Referensi detail saat membuat design
- Memahami design rationale di balik setiap halaman
- Dokumentasi lengkap untuk team

---

### 2️⃣ **COPY_PASTE_PROMPT_LIBRARY.md**
**→ File untuk Copy-Paste LANGSUNG ke Figma AI Plugin**

📄 **Isi:**
- Semua 13 prompt sudah DIRINGKAS & DIOPTIMALKAN
- Format: ---START--- sampai ---END--- untuk easy copy-paste
- Setiap prompt sudah disesuaikan untuk AI plugin
- Ringkasan batch (Auth, Main Features, Navigation)
- Usage instructions yang jelas

📋 **Kapan digunakan:**
- **INI FILE YANG AKAN SERING DIPAKAI**
- Buka file ini saat design di Figma
- Copy 1 prompt, paste ke Figma AI plugin
- Repeat untuk semua 13 halaman

---

### 3️⃣ **DESIGN_TOKENS_QUICK_REFERENCE.md**
**→ Mini Reference Guide untuk Designers & Developers**

📄 **Isi:**
- Warna palette (JSON + Hex codes siap copy)
- Typography specifications (Font, sizes, weights)
- Spacing system & common dimensions
- Component styles (Buttons, Inputs, Cards, Shadows)
- Device specs (iPhone 17 Pro measurements)
- Color validation checklist
- Export formats untuk Flutter/Web

📋 **Kapan digunakan:**
- Quick lookup saat butuh nilai spesifik
- Share ke developer untuk implementation
- Color/typography validation
- Create design tokens file

---

### 4️⃣ **FIGMA_IMPLEMENTATION_CHECKLIST.md**
**→ Checklist & Workflow Project Management**

📄 **Isi:**
- Pre-design checklist (setup & validation)
- Fitur-by-fitur generation checklist (13 items)
- Workflow timeline (3 hari, dibagi per batch)
- Quality assurance checklist per fitur
- Global consistency validation
- Handoff checklist untuk developers
- Troubleshooting guide

📋 **Kapan digunakan:**
- Planning & project management
- Track progress (mark off completed items)
- Quality control sebelum handoff
- Workflow timeline reference

---

## 🎯 QUICK START: LANGKAH-LANGKAH MEMULAI

### HARI 1: Setup & Onboarding Screens (2 jam)

```
1. Buka Figma → Create new file
   Canvas size: 1170 x 2532 px (iPhone 17 Pro)

2. Setup Color Library
   - Baca: DESIGN_TOKENS_QUICK_REFERENCE.md (Warna section)
   - Input semua 13 warna ke Figma color styles
   
3. Setup Typography
   - Import Google Poppins font dari Google Fonts
   - Create text styles di Figma (H1, H2, Body, Button, dll)
   
4. Generate PROMPT 01 - Onboarding
   - Buka: COPY_PASTE_PROMPT_LIBRARY.md
   - Cari: "PROMPT 01: ONBOARDING SCREEN"
   - Copy prompt (dari ---START--- ke ---END---)
   - Buka Figma AI Plugin
   - Paste prompt
   - Generate!
   - Create frame bernama: "01_ONBOARDING"
   
5. Manual Adjust Onboarding
   - Sesuaikan warna ke palette (gunakan color styles)
   - Adjust typography (gunakan text styles)
   - Fix spacing (harus kelipatan 8px)
   - Add illustrations atau placeholder images
   
6. Lanjut: PROMPT 02 (Role Select) & PROMPT 03 (Login) & PROMPT 04 (Registration)
   - Ulangi step 4-5 untuk ketiga prompt ini
   
7. Check: FIGMA_IMPLEMENTATION_CHECKLIST.md
   - Mark "✅ Complete" untuk setiap prompt yang selesai
```

### HARI 2: Main Feature Screens (3 jam)

```
8. Generate PROMPT 05-09 (Home, Requests, Create Request, Detail, Bills)
   - Ulangi copy-paste → generate → adjust untuk 5 halaman ini
   
9. Generate PROMPT 10-11 (Payment)
   - 2 halaman penting untuk payment flow
   
10. Generate PROMPT 12 (Profile)
    - User profile & settings halaman
    
11. Quality Check: FIGMA_IMPLEMENTATION_CHECKLIST.md
    - Per Fitur validation checklist
    - Pastikan warna, typography, spacing konsisten
```

### HARI 3: Navigation & Finalization (2 jam)

```
12. Generate PROMPT 13 (Bottom Navigation Bar)
    - Reusable component yang akan ditambah ke setiap halaman
    
13. Add navigation bar ke semua halaman
    - Copy komponen navigation ke frame 01-12
    
14. Global Consistency Check
    - Gunakan: FIGMA_IMPLEMENTATION_CHECKLIST.md → "Per Fitur validation"
    - Bandingkan semua 13 halaman side-by-side
    - Pastikan styling konsisten
    
15. Final Polish
    - Adjust spacing, shadows, font sizes
    - Test prototype interactions (jika perlu)
    
16. Export & Handoff Prep
    - Follow: FIGMA_IMPLEMENTATION_CHECKLIST.md → "Handoff checklist"
    - Export assets
    - Create component library
    - Share Figma link dengan team
```

---

## 📊 RINGKASAN FITUR & MAPPING

| # | Fitur | File | Device | Status |
|----|-------|------|--------|--------|
| 01 | Onboarding (3 slides) | onboarding_screen.dart | iPhone 17 Pro | ✅ Prompt |
| 02 | Role Select | role_select_login.dart | iPhone 17 Pro | ✅ Prompt |
| 03 | Login | login.dart | iPhone 17 Pro | ✅ Prompt |
| 04 | Registration | registrasi.dart | iPhone 17 Pro | ✅ Prompt |
| 05 | Home / Assets | aset_retribusi.dart | iPhone 17 Pro | ✅ Prompt |
| 06 | Requests List | permohonan.dart | iPhone 17 Pro | ✅ Prompt |
| 07 | Create Request | permohonan.dart (form) | iPhone 17 Pro | ✅ Prompt |
| 08 | Request Detail | detail_permohonan.dart | iPhone 17 Pro | ✅ Prompt |
| 09 | Bills List | tagihan.dart | iPhone 17 Pro | ✅ Prompt |
| 10 | Payment Methods | pembayaran.dart | iPhone 17 Pro | ✅ Prompt |
| 11 | Payment Confirmation | pembayaran-tagihan.dart | iPhone 17 Pro | ✅ Prompt |
| 12 | User Profile | user_profile_page.dart | iPhone 17 Pro | ✅ Prompt |
| 13 | Bottom Navigation | main_navigation.dart | iPhone 17 Pro | ✅ Prompt |

**TOTAL: 13 Fitur = 13 Prompt AI**

---

## 🎨 DESIGN SYSTEM DI SATU LAYAR

### Warna Utama

```
Primary Red:     #EC4336  (Brand - Buttons, Highlights)
Light Red BG:    #FFF0EF  (Soft backgrounds)
Dark Text:       #1A1A2E  (Headings, Main text)
Gray Second:     #8A8A9A  (Supporting text)
White:           #FFFFFF  (Cards, sections)
Scaffold BG:     #F2F4F7  (Page background)
Input BG:        #F7F8FA  (Form inputs)
Border:          #EEEEEE  (Dividers, borders)
Success:         #4CAF50  (Approved, Paid)
Warning:         #FF9800  (Pending, Limited)
Error:           #F44336  (Rejected, Failed)
```

### Typography Stack

```
Poppins 800 - 28px → H1 (Page Title)
Poppins 700 - 22px → H2 (Section Title)
Poppins 600 - 18px → H3 (Sub Title)
Poppins 500 - 16px → Body Large (Main text)
Poppins 400 - 14px → Body Regular (Secondary text)
Poppins 400 - 12px → Body Small (Captions)
Poppins 700 - 16px → Button (CTA)
Poppins 600 - 13px → Label (Form labels)
```

### Spacing & Sizing

```
Grid: 8px (XS=4, S=8, M=16, L=24, XL=32, XXL=48)
Page padding: 16px (left-right)
Section spacing: 24px (vertical)
Component spacing: 12px
Button height: 56px
Input height: 56px
Icon size: 24x24px (standard), 64x64px (large)
Border radius: 16px (buttons), 12px (cards, inputs), 8px (small)
```

---

## 🔄 WORKFLOW REKOMENDASI

### **Opsi 1: Sequential (Safer, Recommended untuk first-time)**

```
Hari 1 → Generate 4 Auth screens (01-04)
Hari 2 → Generate 6 Main features (05-10)
Hari 3 → Generate 2 More (11-12) + 1 Component (13)
```

**Kelebihan:** Lebih stabil, time untuk QA, tidak overload  
**Waktu:** ~2-3 hari full

### **Opsi 2: Parallel (Faster dengan multiple designers)**

```
Designer 1 → Auth batch (01-04)
Designer 2 → Main batch (05-09)
Designer 3 → Payment & Profile (10-12)
All        → Component & Integration (13)
```

**Kelebihan:** Lebih cepat, parallel working  
**Waktu:** ~1 hari full  
**Catatan:** Koordinasi lebih ketat soal consistency

---

## 📋 CHECKLIST SEBELUM MULAI

- [ ] Figma account sudah siap & akses full
- [ ] Figma AI Plugin (Make Design / Wireframer) sudah terinstall
- [ ] Google Poppins font sudah download / tersedia
- [ ] iPhone 17 Pro ukuran sudah dipahami (1170x2532px)
- [ ] Warna palette sudah dikonfirmasi dengan team
- [ ] Semua 4 dokumentasi file sudah dibaca preview-nya
- [ ] COPY_PASTE_PROMPT_LIBRARY.md sudah di-bookmark
- [ ] FIGMA_IMPLEMENTATION_CHECKLIST.md sudah disiapkan untuk tracking
- [ ] Team sudah aligned dengan timeline (1-3 hari)
- [ ] Backup plan kalau AI plugin error (manual design fallback)

---

## 🆘 TRIK JIKA AI TIDAK GENERATE SEMPURNA

### Jika Generated Design Kelihatan Odd:

1. **Sub-prompt yang lebih simpel:**
   - Bagi prompt menjadi dua bagian yang lebih kecil
   - Generate top section, kemudian bottom section terpisah

2. **Refinement prompt:**
   - "Ubah [komponen] menjadi [spesifikasi detail]"
   - "Perbesar button menjadi 56px"
   - "Hilangkan icons, ganti dengan text labels"

3. **Manual adjustment:**
   - Handle design tokens (warna, typography) secara manual
   - AI layout diterima, custom styling manual

4. **Fallback ke manual:**
   - Jika AI stuck, design manual berdasarkan prompt
   - Figma fitur "wireframing" bisa membantu

---

## 🎯 QUALITY CONTROL POINTS

**Setelah setiap 3 halaman dihasilkan:**

- [ ] Warna sudah match palette (bukan off-palette colors)?
- [ ] Typography ukuran benar (28, 22, 18, 16, 14, 12)?
- [ ] Spacing mengikuti 8px grid?
- [ ] Buttons 56px height, radious 16px?
- [ ] Inputs 56px height, radious 12px, padding 12px?
- [ ] Cards memiliki subtle shadow?
- [ ] Semua text readable (contrast OK)?

**Sebelum di-deliver ke developer:**

- [ ] Semua 13 halaman DONE
- [ ] Konsistensi visual across semua pages
- [ ] Bottom navigation ada di setiap halaman (01-12)
- [ ] Component library dibuat (buttons, inputs, cards, badges)
- [ ] Color styles & text styles di-apply ke semua elements
- [ ] Frame naming konsisten (01_*, 02_*, dll)
- [ ] No loose elements (semua dalam groups/components)
- [ ] Export assets ready (PNGs, SVGs)

---

## 📤 SETELAH DESIGN SELESAI

### Deliverables untuk Developer:

1. **Figma File Link**
   - Shared dengan developer team
   - Inspect mode enabled (so they can get specs)

2. **Color Tokens**
   - Export sebagai: colors.json, colors.dart, colors.css
   - Dari: DESIGN_TOKENS_QUICK_REFERENCE.md

3. **Typography Specs**
   - Font family: Poppins
   - All sizes & weights documented
   - Line heights & letter spacing specified

4. **Component Library**
   - Buttons (normal, hover, pressed, disabled)
   - Input fields (normal, focused, error)
   - Cards (standard, elevated, status)
   - Badges, chips, modals, dlsb

5. **Measurement Guidelines**
   - All padding, margins, gaps
   - Border radii
   - Shadow values

6. **Responsive Notes** (if mobile + tablet)
   - This project is mobile-first (iPhone only)
   - But note when/if desktop needed

---

## 🎓 LEARNING RESOURCES REFERENCED

- **Color System:** Material Design 3 meets Brand Guidelines
- **Typography:** Google Poppins (Free font)
- **Spacing:** 8px Grid System (Industry standard)
- **Component Patterns:** Modern iOS + Material Design hybrid
- **Accessibility:** WCAG AA standards considered
- **State Management:** All interactive states documented

---

## 💬 FAQ - FREQUENTLY ASKED QUESTIONS

**Q: Berapa lama design selesai?**  
A: ~1-3 hari tergantung satu/banyak designer. Sequential: 3 hari. Parallel: 1 hari.

**Q: Bisakah saya skip beberapa halaman?**  
A: Bisa, tapi 13 halaman sudah comprehensive. Skip hanya kalau ada approval tertulis.

**Q: Bagaimana kalau AI plugin error?**  
A: Manual design berdasarkan prompt di FIGMA_AI_DESIGN_PROMPTS.md

**Q: Apakah design sudah responsive (tablet, desktop)?**  
A: TIDAK - ini iPhone-only design. Tablet/desktop perlu dokumentasi terpisah.

**Q: Bisa custom prompt untuk feature tambahan?**  
A: Bisa. Follow format dari FIGMA_AI_DESIGN_PROMPTS.md sebagai template.

**Q: Berapa ukuran Figma file nantinya?**  
A: ~10-20MB (tergantung images included). Manageable.

**Q: Boleh pakai design system lain?**  
A: Tidak recommended - ini design tokens-nya sudah final.

---

## 📞 SUPPORT & NEXT STEPS

### Jika Ada Issues:

1. **Design uncertainty?** → Refer ke FIGMA_AI_DESIGN_PROMPTS.md (section tersebut)
2. **Measurement/token?** → Check DESIGN_TOKENS_QUICK_REFERENCE.md
3. **Progress tracking?** → Update FIGMA_IMPLEMENTATION_CHECKLIST.md
4. **Prompt tidak cocok?** → Check COPY_PASTE_PROMPT_LIBRARY.md atau refine

### Next Actions:

```
✅ Baca file overview ini sepenuhnya
✅ Open 4 documentation files (di folder /docs/)
✅ Setup Figma workspace
✅ Mulai dengan PROMPT 01 (Onboarding)
✅ Update tracking di FIGMA_IMPLEMENTATION_CHECKLIST.md
✅ Iterate sesuai workflow rekomendasi
✅ QA sebelum handoff
✅ Deliver ke developer dengan semua files
```

---

## 🎉 RINGKASAN

**Anda sudah memiliki:**

✅ **Dokumentasi Lengkap** - 13 fitur, 13 prompts detail  
✅ **Prompt Ready-to-Use** - Copy-paste format  
✅ **Design Tokens Complete** - Warna, typography, spacing  
✅ **Implementation Guide** - Timeline, checklists, QA  
✅ **Device Specifications** - iPhone 17 Pro exact  
✅ **Color Palette Fixed** - Red #EC4336 + supports  
✅ **Typography System** - Poppins font + styles  

**Sekarang Anda siap untuk:**

🚀 Membuka Figma  
🚀 Generate 13 halaman design dengan AI  
🚀 Polish & koordinasi dengan team  
🚀 Deliver ke developers dengan confidence  

---

**Status Project:** ✅ READY TO GO  
**Documentation Version:** 1.0  
**Last Updated:** 14 April 2026  
**Next Review:** After first 3 pages complete

**Selamat Mengerjakan! 🎨✨**

---

📚 **File Documentation Checklist:**
- ✅ FIGMA_AI_DESIGN_PROMPTS.md (Main - 13 prompts lengkap)
- ✅ COPY_PASTE_PROMPT_LIBRARY.md (Quick ref - copy-paste)
- ✅ DESIGN_TOKENS_QUICK_REFERENCE.md (Tokens - colors, typography)
- ✅ FIGMA_IMPLEMENTATION_CHECKLIST.md (Project mgmt - tracking)
- ✅ README_OVERVIEW.md (Overview - file ini)

**Total dokumentasi:** ~25,000+ words, production-ready
