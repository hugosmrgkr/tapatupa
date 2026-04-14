# 📋 FIGMA DESIGN CHECKLIST & TEMPLATE

**Aplikasi:** TAPATUPA  
**Device:** iPhone 17 Pro (1170 x 2532 px)  
**Status:** Implementation Guide  
**Tanggal:** April 2026

---

## ✅ PRE-DESIGN CHECKLIST

Sebelum mulai generate design di Figma AI, pastikan semua ini sudah sesuai:

### Setup Figma

- [ ] File Figma baru telah dibuat
- [ ] Canvas size: 1170x2532 px (iPhone 17 Pro)
- [ ] Color style library telah dibuat (13 warna utama)
- [ ] Typography style library dibuat (7 text styles)
- [ ] Component library setup (buttons, input, cards)
- [ ] AI Plugin sudah terinstall (Make Design / Wireframer)

### Design System Validation

- [ ] Warna Primary Red (#EC4336) setuju ✓
- [ ] Warna Background Light (#FFF0EF) setuju ✓
- [ ] Warna Dark Text (#1A1A2E) setuju ✓
- [ ] Warna Gray Secondary (#8A8A9A) setuju ✓
- [ ] Font Google Poppins sudah dipilih
- [ ] Spacing 8px grid system disetujui
- [ ] Border radius 16px, 12px, 8px konsisten
- [ ] Shadow styles sudah defined (subtle, medium, strong)

### Project Documentation

- [ ] PROJECT_CONCEPT.md dibaca & dipahami
- [ ] User flows sudah clear
- [ ] 13 fitur utama sudah mapped
- [ ] Warna & brand guidelines sudah aligned
- [ ] Device (iPhone 17 Pro) confirmed

---

## 🎨 DESIGN GENERATION TEMPLATE

Gunakan template ini untuk setiap fitur yang akan di-generate:

### Template Format

```
═══════════════════════════════════════════════════════════
FITUR: [Nama Fitur]
FILE: [nama file di project]
URUTAN: [nomor 1-13]
═══════════════════════════════════════════════════════════

FRAME NAME DI FIGMA: 
[01_ONBOARDING] atau [02_ROLE_SELECT] dll

COMPONENT DEPENDENCIES:
[ ] Primary Button style
[ ] Input Field style
[ ] Card component
[ ] Navigation bar
[ ] Status badges
[ ] Etc...

CUSTOM COLORS NEEDED:
[ ] Color A: #XXXXX (nama/usage)
[ ] Color B: #XXXXX

CUSTOM ICONS:
- Icon 1: [deskripsi]
- Icon 2: [deskripsi]

PROMPT COMPLEXITY:
[ ] Low (simple layout)
[ ] Medium (standard form)
[ ] High (complex multi-section)

ESTIMATED TIME:
- AI Generation: 2-5 min
- Manual adjustment: 5-10 min
- Review & Polish: 5 min
- Total: ~15-25 min per fitur

NOTES:
[Catatan tambahan atau edge cases]
```

---

## 📝 FITUR-BY-FITUR GENERATION CHECKLIST

### BATCH 1: AUTHENTICATION (4 Fitur)

#### ✅ 01 - ONBOARDING SCREEN

**Frame Name:** `01_ONBOARDING`

Preparation:
- [ ] Decide on 3 illustration styles (geometric, abstract, or icon-based)
- [ ] Prepare illustration colors (#EC4336, #FFF0EF, #1A1A2E)
- [ ] Decide carousel indicator style (dots vs bars)

Prompt Ready:
- [ ] Prompt dari dokumentasi sudah di-copy
- [ ] Device size confirmed: 1170x2532
- [ ] Color palette disetujui

Post-Generation:
- [ ] Customize slide content (text, descriptions)
- [ ] Add illustrations / placeholder images
- [ ] Test carousel interaction flow
- [ ] Adjust spacing & alignment if needed

---

#### ✅ 02 - ROLE SELECT SCREEN

**Frame Name:** `02_ROLE_SELECT`

Preparation:
- [ ] Get/create 2 icons (Masyarakat icon, Petugas icon)
- [ ] Icon size: 64x64px, color #EC4336
- [ ] Card design finalized

Prompt Ready:
- [ ] Prompt copied
- [ ] Colors confirmed

Post-Generation:
- [ ] Add icons to cards
- [ ] Verify tap interaction feedback
- [ ] Adjust card spacing (20px between)
- [ ] Add micro-interactions

---

#### ✅ 03 - LOGIN SCREEN

**Frame Name:** `03_LOGIN`

Preparation:
- [ ] Logo/brand text style
- [ ] Input field components ready
- [ ] Button style finalized

Prompt Ready:
- [ ] Prompt copied & ready

Post-Generation:
- [ ] Add focus states to inputs
- [ ] Verify button shadow & hover states
- [ ] Add form validation states
- [ ] Test accessibility (labels, hints)

---

#### ✅ 04 - REGISTRATION SCREEN

**Frame Name:** `04_REGISTRATION`

Preparation:
- [ ] Multi-step indicator style (dots or progress bar)
- [ ] Step 1 fields: Name, Email, Phone, Password, Confirm Password
- [ ] Terms checkbox design

Prompt Ready:
- [ ] Prompt ready

Post-Generation:
- [ ] Add form validation logic (visual)
- [ ] Create multi-step flow (Step 1 → Step 2 → Step 3)
- [ ] Add error states
- [ ] Verify spacing consistency

---

### BATCH 2: MAIN FEATURES (6 Fitur)

#### ✅ 05 - HOME / ASSET LISTING

**Frame Name:** `05_HOME_ASSETS`

Preparation:
- [ ] Prepare asset card layout (2-column or 1-column)
- [ ] Get placeholder images or image placeholders
- [ ] Rating system (stars) style
- [ ] Filter chips design

Prompt Ready:
- [ ] Prompt ready

Post-Generation:
- [ ] Add sample asset images
- [ ] Verify grid/list layout
- [ ] Test search input interaction
- [ ] Polish filter chips styling

---

#### ✅ 06 - REQUEST LIST

**Frame Name:** `06_REQUESTS_LIST`

Preparation:
- [ ] Tab styles (Semua, Pending, Approved, Rejected, Done)
- [ ] Status badge colors mapping
- [ ] Card layout for requests

Prompt Ready:
- [ ] Prompt ready

Post-Generation:
- [ ] Add tab interactions
- [ ] Verify status colors (#FF9800, #4CAF50, #F44336)
- [ ] Create empty state
- [ ] Add load more / pagination

---

#### ✅ 07 - CREATE REQUEST FORM

**Frame Name:** `07_CREATE_REQUEST`

Preparation:
- [ ] Asset dropdown design
- [ ] Date picker integration
- [ ] Textarea component style
- [ ] Cost calculation summary box

Prompt Ready:
- [ ] Prompt ready

Post-Generation:
- [ ] Add form validation
- [ ] Create date picker modal
- [ ] Add cost calculator (real-time update)
- [ ] Verify summary box styling

---

#### ✅ 08 - REQUEST DETAIL

**Frame Name:** `08_REQUEST_DETAIL`

Preparation:
- [ ] Detail sections styling
- [ ] Status card gradient colors
- [ ] Action buttons based on status
- [ ] Tariff calculation display

Prompt Ready:
- [ ] Prompt ready

Post-Generation:
- [ ] Add status-specific action buttons
- [ ] Verify all detail sections visible
- [ ] Create status-colored top border
- [ ] Polish approval/rejection info boxes

---

#### ✅ 09 - BILLS/INVOICES LISTING

**Frame Name:** `09_BILLS_LIST`

Preparation:
- [ ] Invoice card border colors (by status)
- [ ] Tab styles for bill status
- [ ] Summary box styling

Prompt Ready:
- [ ] Prompt ready

Post-Generation:
- [ ] Add sample invoice data
- [ ] Implement tab filtering
- [ ] Create empty state
- [ ] Add "Pay Now" button interactions

---

#### ✅ 10 & 11 - PAYMENT (METHOD + PROCESSING)

**Frame Name:** `10_PAYMENT_METHODS` & `11_PAYMENT_SUCCESS`

Preparation (Method Selection):
- [ ] Payment method card designs
- [ ] Bank icons / e-wallet icons
- [ ] Radio button styling
- [ ] Expandable detail sections

Preparation (Processing):
- [ ] Loading animation style
- [ ] Success/failure card designs
- [ ] Icon styles (checkmark, X)
- [ ] Action button variations

Prompts Ready:
- [ ] Both prompts copied

Post-Generation:
- [ ] Create interactive payment flow
- [ ] Add success/failure transitions
- [ ] Verify loading animation smoothness
- [ ] Create receipt download button

---

#### ✅ 12 - USER PROFILE

**Frame Name:** `12_USER_PROFILE`

Preparation:
- [ ] Avatar design (circular, with initials placeholder)
- [ ] Menu item styling
- [ ] Section dividers
- [ ] Toggle switch components
- [ ] Badge for notification counts

Prompt Ready:
- [ ] Prompt ready

Post-Generation:
- [ ] Add sample avatar with initials
- [ ] Create all menu sections
- [ ] Implement toggle switches
- [ ] Add notification badges
- [ ] Style logout button

---

### BATCH 3: NAVIGATION (1 Komponen)

#### ✅ 13 - BOTTOM NAVIGATION BAR

**Frame Name:** `13_BOTTOM_NAV` (Shared component)

Preparation:
- [ ] 5 navigation icons ready
- [ ] Active/inactive state styling
- [ ] Badge styling for notifications

Prompt Ready:
- [ ] Prompt ready

Post-Generation:
- [ ] Create as reusable component
- [ ] Add to all main pages (05-12)
- [ ] Test active state transitions
- [ ] Create notification badge variants

---

## 🎬 GENERATION WORKFLOW

### Day 1: Authentication (Batch 1)

**Timeline:** ~2 hours

```
Time    Task                          Duration
────────────────────────────────────────────
10:00   Setup Figma file              15 min
10:15   Generate Onboarding           20 min
10:35   Refine Onboarding             15 min
10:50   Generate Role Select          15 min
11:05   Generate Login                15 min
11:20   Generate Registration         15 min
11:35   Break / Review                10 min
11:45   Polish Auth screens           30 min
12:15   Document & Export             15 min
```

### Day 2: Main Features (Batch 2)

**Timeline:** ~3 hours

```
Time    Task                          Duration
────────────────────────────────────────────
10:00   Generate Home/Assets          20 min
10:20   Refine Home                   15 min
10:35   Generate Request List         20 min
10:55   Generate Create Request       25 min
11:20   Generate Request Detail       20 min
11:40   Break                         10 min
11:50   Generate Bills                20 min
12:10   Generate Payment screens (2)  40 min
12:50   Generate Profile              20 min
13:10   Break / Review                15 min
13:25   Polish all screens            30 min
13:55   Document setup                15 min
```

### Day 3: Finalization (Navigation + Polish)

**Timeline:** ~2 hours

```
Time    Task                          Duration
────────────────────────────────────────────
10:00   Generate Bottom Navigation    15 min
10:15   Create components library     30 min
10:45   Apply nav to all screens      20 min
11:05   Design consistency review     30 min
11:35   Create prototype interactions 30 min
12:05   Export & prepare handoff      25 min
12:30   Final review with stakeholders 15 min
```

---

## 🔄 QUALITY CHECKLIST - Post-Generation

### Per Fitur

- [ ] Layout matches prompt specifications
- [ ] All colors from palette used correctly
- [ ] Typography sizes accurate (28px, 22px, 16px, 14px, 12px, etc)
- [ ] Spacing matches 8px grid
- [ ] Icons are 24x24px or 64x64px as specified
- [ ] Border radius correct (16px, 12px, 8px)
- [ ] Shadows applied correctly (subtle, medium, strong)
- [ ] All text is readable (sufficient contrast)
- [ ] Forms have proper labels & placeholders
- [ ] Status badges correct colors
- [ ] Button states visible (normal, hover, active, disabled)
- [ ] Buttons have proper shadow/elevation
- [ ] Cards have proper spacing & shadows
- [ ] Empty states designed
- [ ] Loading states included (if applicable)
- [ ] Error states shown (if applicable)

### Konsistensi Global

- [ ] All buttons use same style (not mix of styles)
- [ ] All input fields consistent
- [ ] All cards consistent
- [ ] All dividers same style (#EEEEEE, 1px)
- [ ] Font sizes consistent across pages
- [ ] Spacing rhythm maintained
- [ ] Interactive elements have consistent feedback
- [ ] Color scheme consistent
- [ ] All 13 pages follow same grid system

---

## 📦 HANDOFF CHECKLIST

Ready to handoff to developers:

- [ ] All 13 screens completed
- [ ] Bottom navigation added to all main screens
- [ ] Component library created & documented
- [ ] Design system specs exported (colors, typography)
- [ ] All pages properly named & organized
- [ ] Prototypes/flows working
- [ ] Responsive behavior documented
- [ ] Assets exported (icons, images)
- [ ] Style guide PDF generated
- [ ] Figma file shared with dev team & link provided
- [ ] Developer handoff meeting scheduled
- [ ] Design tokens documented in code-friendly format

---

## 💾 FILE EXPORT FORMAT

For developers:

```
Figma File: TAPATUPA_UIDesign_iPhone17Pro_v1.0

Export Assets:
├── Icons (SVG) → /design/icons/
├── Colors.json → /design/tokens/colors.json
├── Typography.json → /design/tokens/typography.json
├── Components.pdf → /design/components/
├── Screens (PNG, 1x scale) → /design/screenshots/
└── Prototype Link → https://figma.com/proto/...
```

---

## 🆘 TROUBLESHOOTING

### Issue: AI Generated design doesn't match prompt

**Solution:**
1. Re-read prompt, check for missing details
2. Refine prompt with more specific requirements
3. Try alternative wording
4. Use "Regenerate" in Figma AI plugin
5. Manually adjust to match specifications

### Issue: Consistency problems across screens

**Solution:**
1. Create reusable components first
2. Use Figma styles for typography & colors
3. Pin all components to pixel grid
4. Use constraints to maintain responsive behavior
5. Regular visual audit (compare all 13 screens side-by-side)

### Issue: Typography rendering issues

**Solution:**
1. Ensure Google Poppins font is imported in Figma
2. Apply text styles from library
3. Manual adjustment of line-height, letter-spacing
4. Test export quality

---

## 📞 CONTACT & SUPPORT

- **Design Lead:** [Your Name]
- **AI Plugin Support:** [Plugin Documentation Link]
- **Figma Workspace:** [Share Link]
- **Questions?** Refer back to FIGMA_AI_DESIGN_PROMPTS.md

---

**Status:** ✅ Ready to Start Generation  
**Version:** 1.0  
**Last Updated:** 14 April 2026
