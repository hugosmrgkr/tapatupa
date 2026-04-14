# 🎨 TAPATUPA DESIGN TOKENS & QUICK REFERENCE

**Dokumentasi:** Design System Tokens  
**Target:** Figma Designers & Flutter Developers  
**Version:** 1.0  
**Updated:** 14 April 2026

---

## 🎨 COLOR PALETTE (Export as JSON/CSS)

### Primary Colors

```json
{
  "colors": {
    "primary": {
      "red": "#EC4336",
      "lightBg": "#FFF0EF",
      "description": "Brand color - energetic and professional"
    }
  }
}
```

### Semantic Colors

```json
{
  "semantic": {
    "success": {
      "value": "#4CAF50",
      "usage": "Paid status, approved, completed actions"
    },
    "warning": {
      "value": "#FF9800",
      "usage": "Pending status, limited availability"
    },
    "error": {
      "value": "#F44336",
      "usage": "Rejected, failed, error messages"
    }
  }
}
```

### Neutral Colors

```json
{
  "neutral": {
    "dark": {
      "value": "#1A1A2E",
      "usage": "Headings, main text"
    },
    "gray": {
      "value": "#8A8A9A",
      "usage": "Secondary text, labels"
    },
    "divider": {
      "value": "#EEEEEE",
      "usage": "Borders, dividers"
    },
    "dotInactive": {
      "value": "#E0E0E8",
      "usage": "Inactive UI elements"
    },
    "inputBg": {
      "value": "#F7F8FA",
      "usage": "Input field backgrounds"
    },
    "scaffoldBg": {
      "value": "#F2F4F7",
      "usage": "Page backgrounds"
    },
    "white": {
      "value": "#FFFFFF",
      "usage": "Cards, components, backgrounds"
    }
  }
}
```

### Hex Color Codes (Quick Copy)

```
#EC4336  - Primary Red
#FFF0EF  - Primary Light BG
#1A1A2E  - Dark Text
#8A8A9A  - Gray Secondary
#EEEEEE  - Divider
#E0E0E8  - Dot Inactive
#F7F8FA  - Input BG
#F2F4F7  - Scaffold BG
#FFFFFF  - White
#4CAF50  - Success Green
#FF9800  - Warning Orange
#F44336  - Error Red
```

---

## 🔤 TYPOGRAPHY SYSTEM

### Font Family

**Primary: Google Poppins**
- Free from Google Fonts
- Weights needed: 400 (Regular), 500 (Medium), 600 (SemiBold), 700 (Bold), 800 (ExtraBold)

### Text Styles Definition

```json
{
  "typography": {
    "heading1": {
      "fontFamily": "Poppins",
      "fontSize": 28,
      "fontWeight": 800,
      "lineHeight": 1.2,
      "letterSpacing": 0.5,
      "color": "#1A1A2E",
      "usage": "Page titles, main headings"
    },
    "heading2": {
      "fontFamily": "Poppins",
      "fontSize": 22,
      "fontWeight": 700,
      "lineHeight": 1.3,
      "letterSpacing": 0.3,
      "color": "#1A1A2E",
      "usage": "Section titles"
    },
    "heading3": {
      "fontFamily": "Poppins",
      "fontSize": 18,
      "fontWeight": 600,
      "lineHeight": 1.4,
      "letterSpacing": 0.2,
      "color": "#1A1A2E",
      "usage": "Subsection titles"
    },
    "bodyLarge": {
      "fontFamily": "Poppins",
      "fontSize": 16,
      "fontWeight": 500,
      "lineHeight": 1.5,
      "letterSpacing": 0,
      "color": "#1A1A2E",
      "usage": "Main content text"
    },
    "bodyRegular": {
      "fontFamily": "Poppins",
      "fontSize": 14,
      "fontWeight": 400,
      "lineHeight": 1.7,
      "letterSpacing": 0,
      "color": "#8A8A9A",
      "usage": "Supporting text, descriptions"
    },
    "bodySmall": {
      "fontFamily": "Poppins",
      "fontSize": 12,
      "fontWeight": 400,
      "lineHeight": 1.6,
      "letterSpacing": 0,
      "color": "#8A8A9A",
      "usage": "Captions, hints, metadata"
    },
    "label": {
      "fontFamily": "Poppins",
      "fontSize": 13,
      "fontWeight": 600,
      "lineHeight": 1.5,
      "letterSpacing": 0.5,
      "color": "#1A1A2E",
      "usage": "Form labels, buttons"
    },
    "button": {
      "fontFamily": "Poppins",
      "fontSize": 16,
      "fontWeight": 700,
      "lineHeight": 1.5,
      "letterSpacing": 0.5,
      "color": "#FFFFFF",
      "usage": "CTA buttons"
    }
  }
}
```

### Quick Reference

| Style | Size | Weight | Color | Usage |
|-------|------|--------|-------|-------|
| H1 | 28px | 800 | #1A1A2E | Page Title |
| H2 | 22px | 700 | #1A1A2E | Section Title |
| H3 | 18px | 600 | #1A1A2E | Subsection |
| Body L | 16px | 500 | #1A1A2E | Main Content |
| Body R | 14px | 400 | #8A8A9A | Supporting |
| Body S | 12px | 400 | #8A8A9A | Captions |
| Label | 13px | 600 | #1A1A2E | Form Labels |
| Button | 16px | 700 | #FFFFFF | Buttons |

---

## 📐 SPACING & SIZING SYSTEM

### Spacing Scale (8px grid)

```
XS:        4px   (0.5 unit)
S:         8px   (1 unit)
M:        16px   (2 units)
L:        24px   (3 units)
XL:       32px   (4 units)
XXL:      48px   (6 units)
```

### Common Spacing Values

```
Padding/Margin:
- Page padding: 16px (left-right)
- Section spacing: 24px (vertical)
- Component spacing: 12px
- Element spacing: 8px

Card spacing:
- Card padding: 16px
- Card margin: 12px (horizontal), 8px (vertical)
- Card gap: 12px (between cards)

Form elements:
- Input height: 56px
- Input padding: 12px (left-right), 14px (top-bottom)
- Label margin: 8px (top margin)
- Input gap: 20px (between inputs)
- Button height: 56px / 48px (secondary)
```

### Common Dimensions

```
Icons:
- Small icon: 20x20px
- Medium icon: 24x24px (most UI icons)
- Large icon: 40x40px (avatar alternative)
- Extra large: 64x64px (illustrations, avatars)

Avatar:
- Standard: 80x80px (profile)
- Compact: 40x40px (comments, lists)
- Extra: 120x120px (hero/detail page)

Images:
- Card image: 100% width × 160px height (2-column cards)
- Header image: 100% width × 200px height
- Thumbnail: 40x40px

Cards:
- Minimal card: 12px border-radius
- Standard card: 12px border-radius, 1px border
- Large card: 16px border-radius

Buttons:
- Standard height: 56px
- Compact height: 48px
- Minimal height: 40px
- Width: 100% (full-width) or auto
```

---

## 🎛️ COMPONENT STYLES

### Button States & Styles

```json
{
  "buttons": {
    "primary": {
      "normal": {
        "background": "#EC4336",
        "text": "#FFFFFF",
        "height": 56,
        "borderRadius": 16,
        "shadow": "blur 32px, y 16px, opacity 16%",
        "fontSize": 16,
        "fontWeight": 700
      },
      "hover": {
        "background": "#D32F2F",
        "shadow": "blur 16px, y 8px, opacity 20%"
      },
      "pressed": {
        "background": "#C62828",
        "shadow": "blur 8px, y 4px, opacity 12%"
      },
      "disabled": {
        "background": "#CCCCCC",
        "text": "#FFFFFF",
        "opacity": 0.5
      }
    },
    "secondary": {
      "normal": {
        "background": "#FFFFFF",
        "text": "#EC4336",
        "border": "2px #EC4336",
        "height": 56,
        "borderRadius": 16
      },
      "pressed": {
        "background": "#FFF0EF"
      }
    },
    "ghost": {
      "normal": {
        "background": "transparent",
        "text": "#EC4336",
        "borderBottom": "2px #EC4336"
      }
    }
  }
}
```

### Input Fields

```json
{
  "inputs": {
    "standard": {
      "background": "#F7F8FA",
      "border": "1px #EEEEEE",
      "borderRadius": 12,
      "height": 56,
      "padding": "12px horizontal, 14px vertical",
      "fontSize": 16,
      "textColor": "#1A1A2E",
      "placeholderColor": "#8A8A9A"
    },
    "focused": {
      "borderColor": "#EC4336",
      "shadow": "blur 8px, y 2px, opacity 8% (#EC4336)"
    },
    "error": {
      "borderColor": "#F44336",
      "borderWidth": "2px"
    },
    "label": {
      "fontSize": 13,
      "fontWeight": 600,
      "color": "#1A1A2E",
      "marginTop": 8
    }
  }
}
```

### Cards

```json
{
  "cards": {
    "standard": {
      "background": "#FFFFFF",
      "border": "1px #EEEEEE",
      "borderRadius": 12,
      "padding": 16,
      "shadow": "blur 8px, y 4px, opacity 8%"
    },
    "elevated": {
      "background": "#FFFFFF",
      "border": "none",
      "borderRadius": 16,
      "padding": 16,
      "shadow": "blur 16px, y 8px, opacity 12%"
    },
    "status_success": {
      "background": "#FFFFFF",
      "borderTop": "4px #4CAF50",
      "borderRadius": 16
    },
    "status_error": {
      "background": "#FFFFFF",
      "borderTop": "4px #F44336",
      "borderRadius": 16
    }
  }
}
```

### Shadows

```json
{
  "shadows": {
    "subtle": {
      "blurRadius": 8,
      "yOffset": 4,
      "opacity": 0.08
    },
    "medium": {
      "blurRadius": 16,
      "yOffset": 8,
      "opacity": 0.12
    },
    "strong": {
      "blurRadius": 32,
      "yOffset": 16,
      "opacity": 0.16
    }
  }
}
```

---

## 📱 DEVICE SPECIFICATIONS

### iPhone 17 Pro

```
Physical Device:
- Screen diagonal: 6.7 inches
- Resolution: 2796 x 1290 pixels (physical)
- Pixel density: 460 ppi

Figma Canvas:
- Canvas size: 1170 x 2532 px (logical pixels)
- Scale factor: 3x (1 logical pixel = 3 physical pixels)
- At 3x scale: 390 x 844 dp (device-independent pixels)

Safe Areas:
- Top (notch): 44px
- Bottom (home indicator): 34px
- Left/Right: 0px

Usable Canvas:
- Width: 1170px (full)
- Height: 2532px (full)
- Content area: 1170px × (2532px - 44px top - 80px bottom nav)

Breakpoints (if responsive):
- Header: Top 80-120px
- Content: Middle area (scrollable)
- Bottom nav: Fixed 80px at bottom
```

---

## 🗺️ SCREEN FLOW & ARCHITECTURE

### Navigation Hierarchy

```
AppStart
├── Onboarding (3 slides)
│   └── Role Select
│       ├── Login (User path)
│       │   └── Main Dashboard
│       │       ├── 05 Home/Assets
│       │       ├── 06 Requests
│       │       ├── 09 Bills
│       │       ├── 07/08 Request Detail
│       │       ├── 10/11 Payment
│       │       └── 12 Profile
│       │
│       └── Login (Admin path)
│           └── Admin Dashboard (separate)
└── Registration → Back to Login
```

### Fitur Interconnections

```
Home (05)
  ↓
  ├→ Asset Detail (optional)
  └→ Create Request (07)
       ↓
       └→ Request Detail (08)
            ↓
            ├→ Bills (09)
            │   ↓
            │   └→ Payment (10/11)
            │        ↓
            │        └→ Success/Receipt
            │
            └→ Profile (12)

Bills (09)
  ↓
  └→ Payment (10/11)
```

---

## ✅ VALIDATION CHECKLIST FOR AI GENERATION

When AI generates each screen, validate against:

### Layout Validation
- [ ] All elements positioned according to specifications
- [ ] Margins/spacing follow 8px grid
- [ ] Border radius applied correctly
- [ ] Element hierarchy clear and scannable

### Color Validation
- [ ] Primary red (#EC4336) used consistently
- [ ] Status colors correct (Success green, Warning orange, Error red)
- [ ] Neutral colors used appropriately
- [ ] No off-palette colors used

### Typography Validation
- [ ] Font styles match specifications
- [ ] Text contrast sufficient (WCAG AA minimum)
- [ ] Font sizes correct per specifications
- [ ] Line heights proper (1.2-1.7 range)

### Component Validation
- [ ] Buttons have correct styling
- [ ] Input fields consistent
- [ ] Cards follow template
- [ ] Icons 24x24px or as specified
- [ ] Shadows applied (if applicable)

### Interactive Validation
- [ ] Button states visible (hover, pressed, disabled)
- [ ] Input focus states clear
- [ ] Empty states designed
- [ ] Loading states included
- [ ] Error states shown

### Accessibility Validation
- [ ] All interactive elements have sufficient size (min 44x44px)
- [ ] Text readable (good contrast)
- [ ] Form labels clear and associated
- [ ] No color-only information (also use text/icons)

---

## 📤 EXPORT FORMATS FOR DEVELOPERS

### For Flutter Development

```dart
// colors.dart
class AppColors {
  static const Color primary = Color(0xFFEC4336);
  static const Color primaryBg = Color(0xFFFFF0EF);
  static const Color dark = Color(0xFF1A1A2E);
  static const Color gray = Color(0xFF8A8A9A);
  // ... etc
}

// text_styles.dart
class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    fontFamily: 'Poppins',
  );
  // ... etc
}
```

### For CSS/Web

```css
:root {
  --color-primary: #EC4336;
  --color-primary-bg: #FFF0EF;
  --color-dark: #1A1A2E;
  /* ... */
  
  --spacing-xs: 4px;
  --spacing-s: 8px;
  --spacing-m: 16px;
  /* ... */
  
  --font-size-h1: 28px;
  --font-weight-bold: 700;
  /* ... */
}
```

---

## 📊 QUICK STAT SUMMARY

| Metric | Value |
|--------|-------|
| Total Screens | 13 |
| Total Prompts | 13 |
| Device | iPhone 17 Pro (1170x2532px) |
| Primary Color | #EC4336 (Red) |
| Font Family | Google Poppins |
| Grid System | 8px |
| Border Radius (main) | 16px |
| Button Height | 56px |
| Input Height | 56px |
| Navigation Height | 80px |
| Components | ~20 reusable |
| Status States | 4+ (Pending, Approved, Rejected, Done) |

---

## 🔗 RELATED DOCUMENTATION

- **Main Design Prompts:** `FIGMA_AI_DESIGN_PROMPTS.md`
- **Implementation Checklist:** `FIGMA_IMPLEMENTATION_CHECKLIST.md`
- **Project Concept:** `PROJECT_CONCEPT.md`
- **Flutter Code Styles:** `lib/styles/app_styles.dart`

---

## 📞 QUICK REFERENCE LINKS

- **Figma File:** [Link to shared Figma workspace]
- **Design System Specs:** [Link to design tokens Figma component]
- **AI Plugin:** [Make Design / Wireframer documentation]
- **Google Poppins Font:** https://fonts.google.com/specimen/Poppins
- **Figma Plugins:** https://www.figma.com/community/plugins

---

**Document Status:** ✅ Complete & Ready to Use  
**Version:** 1.0  
**Last Updated:** 14 April 2026  
**Maintained By:** Design & Development Team
