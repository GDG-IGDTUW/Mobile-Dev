#  SplitSmart

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![ML Kit](https://img.shields.io/badge/ML_Kit-4285F4?style=for-the-badge&logo=google&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**AI-powered bill splitting made simple and smart** 

*Scan your bill, add friends, split instantly!*

[Features](#-features) • [Screenshots](#-screenshots) • [Installation](#-installation) • [Issues](#-open-issues) • [Contributing](#-how-to-contribute)

</div>

---

##  About The Project

**SplitSmart** is a modern, AI-powered Flutter mobile application designed to make splitting bills effortless and fair. Whether you're dining with friends, sharing travel expenses, or splitting household bills, SplitSmart handles the math with style.

### Why SplitSmart?

-  **Beautiful UI** - Eye-catching gradients and smooth animations
-  **AI-Powered** - ML Kit integration for automatic bill scanning (coming soon)
-  **Accurate** - Precise calculations including tip splitting
-  **Fast** - Split bills in seconds
-  **Modern** - Built with Flutter's latest features

### Perfect For:

- Restaurant dinners with friends
- Party and event expenses
-  Roommate bill splitting
-  Group travel expenses
-  Shared shopping trips
-  Team lunch expenses

---

##  Features

### Current Features 

| Feature | Description | Status |
|---------|-------------|--------|
|  **Smart Splitting** | Enter total amount and number of people | Working |
|  **Tip Calculator** | Quick tip buttons (5%, 10%, 15%) | Working |
|  **Precise Math** | Accurate calculations with proper rounding | Working |
|  **Beautiful UI** | Gradient cards, smooth animations | Working |
|  **Clear Results** | Visual breakdown showing totals | Working |

### Coming Soon 

| Feature | Description | Difficulty | Status |
|---------|-------------|-----------|--------|
|  **Camera Integration** | Capture bill photos | 🟡 Intermediate | Open |
|  **AI Bill Scanning** | ML Kit text recognition | 🔴 Advanced |  Open |
|  **Social Sharing** | Share via WhatsApp/social media | 🟡 Intermediate |  Open |
|  **History** | Save and review past splits | 🟡 Intermediate |  Open |
|  **Analytics** | Spending insights with charts | 🔴 Advanced |  Open |
|  **Item Split** | Assign specific items to people | 🔴 Advanced |  Open |

---

##  Screenshots

<div align="center">

###  Home Screen - Main Interface
<img src="screenshots/home_clean.png" width="300" alt="Home Screen"/>

*Clean and intuitive interface with beautiful gradient design. Features the pulsing "Scan Your Bill" button, bill details input section, and quick tip selection buttons (5%, 10%, 15%).*

---

###  Bill Input - Enter Details
<img src="screenshots/input_filled.png" width="300" alt="Bill Input Filled"/>

*Example showing ₹150 bill split among 3 people. Users can easily input the total amount and number of people using clean, focused input fields.*

---

###  Tip Selection - Choose Your Tip
<img src="screenshots/tip_selected.png" width="300" alt="Tip Selected"/>

*5% tip button selected with visual feedback. Users can quickly toggle between 5%, 10%, or 15% tip options with a single tap.*

---

###  Split Result - Per Person Amount
<img src="screenshots/result_with_tip.png" width="300" alt="Result with Tip"/>

*Beautiful gradient result card showing ₹52.50 per person for a ₹150 bill split among 3 people with 5% tip. Includes detailed breakdown showing total, number of people, and tip percentage.*

---

###  Result Breakdown - No Tip Example
<img src="screenshots/result_basic.png" width="300" alt="Basic Result"/>

*Split result without tip - ₹50.00 per person. Shows clean calculation breakdown with total amount, number of people, and 0% tip clearly displayed.*

---

###  Camera Feature - AI Scanning (Coming Soon)
<img src="screenshots/camera_message.png" width="300" alt="Camera Message"/>

*Placeholder for upcoming camera integration feature. When clicked, shows a message indicating ML Kit integration is needed. This will enable AI-powered bill scanning in future updates.*

---

###  Share Feature - WhatsApp Integration (Coming Soon)
<img src="screenshots/whatsapp_message.png" width="300" alt="WhatsApp Message"/>

*Placeholder for WhatsApp sharing functionality. Users will soon be able to share split results directly with friends via WhatsApp and other social platforms.*

</div>

---

##  Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (3.0.0 or higher) - [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (included with Flutter)
- **Android Studio** or **VS Code** with Flutter extensions
- **Android Emulator** or **Physical Device** for testing

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/SplitSmart.git
   cd SplitSmart
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # Check connected devices
   flutter devices
   
   # Run on connected device/emulator
   flutter run
   ```

4. **Build for release** (optional)
   ```bash
   # Android
   flutter build apk --release
   
   # iOS
   flutter build ios --release
   ```

---

##  Project Structure

```
split_smart/
├── lib/
│   ├── main.dart                    # App entry point, theme configuration
│   ├── screens/
│   │   └── home_screen.dart         # Main split calculation screen
│   ├── utils/
│   │   └── constants.dart           # App colors, text styles, spacing
│   ├── services/                    # Services (to be added by contributors)
│   │   ├── ml_service.dart          # ML Kit integration (Issue #8)
│   │   └── storage_service.dart     # Local storage (Issue #7)
│   └── models/                      # Data models (to be added)
│       ├── bill_item.dart           # Bill item model (Issue #9)
│       └── person.dart              # Person model (Issue #9)
├── android/                         # Android specific files
├── ios/                             # iOS specific files
├── screenshots/                     # App screenshots for README
├── test/                            # Unit and widget tests
├── pubspec.yaml                     # Dependencies and app metadata
└── README.md                        # This file
```

---

##  Open Issues

We have **10 carefully designed issues** for contributors at all skill levels!

### 🟢 Beginner Issues (Good First Issues)

Perfect for first-time contributors or those new to Flutter.

#### Issue #1: Round Off Amount to 2 Decimal Places
**What's the problem?**  
Currently, splits like ₹100 ÷ 3 show ₹33.333333 instead of ₹33.33.

**What you'll do:**
- Fix the rounding in `_calculateSplit()` function
- Use proper decimal formatting
- Test with various amounts

**Skills needed:** Basic Dart, string formatting  
**Estimated time:** 30 minutes  
**File:** `lib/screens/home_screen.dart` (line ~50)

---

#### Issue #2: Add Input Validation
**What's the problem?**  
Users can enter 0 people, negative numbers, or leave fields empty causing errors.

**What you'll do:**
- Add validation checks in `_calculateSplit()`
- Show error SnackBar for invalid inputs
- Prevent calculation when validation fails

**Skills needed:** Basic Flutter, form validation  
**Estimated time:** 45 minutes  
**File:** `lib/screens/home_screen.dart`

---

#### Issue #3: Add "Clear All" Button
**What's the feature?**  
Users need a quick way to reset all inputs and start fresh.

**What you'll do:**
- Create `_clearAll()` function
- Add OutlinedButton below Calculate button
- Clear text fields and reset state
- Hide result card

**Skills needed:** Basic Flutter widgets  
**Estimated time:** 30 minutes  
**File:** `lib/screens/home_screen.dart`

---

### 🟡 Intermediate Issues

For contributors with some Flutter experience.

#### Issue #4: Integrate Camera Functionality
**What's needed?**  
The "Scan Your Bill" button currently shows a placeholder. Make it open the camera!

**What you'll do:**
- Use `image_picker` package (already in pubspec.yaml)
- Implement camera capture in `_scanBill()` function
- Handle permissions (Android & iOS)
- Show captured image or success message

**Skills needed:** Flutter packages, async/await, platform permissions  
**Estimated time:** 2-3 hours  
**Files:** `lib/screens/home_screen.dart`, platform configs

---

#### Issue #5: Add WhatsApp Share Functionality
**What's needed?**  
Users should be able to share split results with friends via WhatsApp/social media.

**What you'll do:**
- Use `share_plus` package (already in pubspec.yaml)
- Format split result as shareable text
- Implement in `_shareResults()` function
- Test sharing to different apps

**Skills needed:** Flutter packages, string formatting  
**Estimated time:** 1-2 hours  
**File:** `lib/screens/home_screen.dart`

---

#### Issue #6: Enhance Result Card Animation
**What's needed?**  
Make the result card appearance more engaging and professional.

**What you'll do:**
- Improve animation in `_buildResultCard()`
- Add slide-up + fade effect
- Consider spring/bounce animations
- Smooth transition timing

**Skills needed:** Flutter animations, AnimationController  
**Estimated time:** 2-3 hours  
**File:** `lib/screens/home_screen.dart`

---

#### Issue #7: Add Local Storage for Split History
**What's needed?**  
Save past splits so users can review their history.

**What you'll do:**
- Create `StorageService` class
- Use `shared_preferences` package (already in pubspec.yaml)
- Save splits with timestamp after calculation
- Create methods to retrieve history
- Store last 20 splits

**Skills needed:** Local storage, JSON serialization, async/await  
**Estimated time:** 3-4 hours  
**Files:** Create `lib/services/storage_service.dart`, update home_screen.dart

---

### 🔴 Advanced Issues

For experienced contributors ready for complex challenges.

#### Issue #8: Integrate Google ML Kit for OCR
**What's the challenge?**  
Implement AI-powered bill text recognition to automatically extract amounts from scanned images.

**What you'll do:**
- Add `google_mlkit_text_recognition` to pubspec.yaml
- Create `MLService` class to handle text recognition
- Parse recognized text to find bill total
- Use RegEx to identify amounts
- Handle different bill formats
- Auto-fill amount field on success

**Skills needed:** ML Kit, computer vision, RegEx, async/await  
**Estimated time:** 6-8 hours  
**Files:** Create `lib/services/ml_service.dart`, update home_screen.dart  
**Prerequisite:** Issue #4 must be completed first

---

#### Issue #9: Add Per-Person Item Selection
**What's the challenge?**  
Build a complete feature for assigning specific bill items to specific people (e.g., "John had pizza, Sarah had pasta, they shared bread").

**What you'll do:**
- Design data models (Person, BillItem)
- Create new screen `ItemSplitScreen`
- Build UI for adding people and items
- Implement item assignment logic
- Handle shared items (split equally)
- Calculate individual totals
- Show clear breakdown

**Skills needed:** State management, data modeling, complex UI, navigation  
**Estimated time:** 8-10 hours  
**Files:** Create `lib/screens/item_split_screen.dart`, `lib/models/`, update navigation

---

#### Issue #10: Create Analytics Dashboard
**What's the challenge?**  
Build a complete analytics screen showing spending patterns with interactive charts.

**What you'll do:**
- Choose and integrate a charting library (fl_chart recommended)
- Create `AnalyticsScreen` with multiple visualizations
- Load and aggregate data from storage
- Implement at least 2 chart types (line, pie, bar)
- Show key statistics (total spent, average, etc.)
- Add date range filters
- Display recent activity list

**Skills needed:** Data visualization, charts, complex calculations, UI design  
**Estimated time:** 8-12 hours  
**Files:** Create `lib/screens/analytics_screen.dart`, update navigation  
**Prerequisite:** Issue #7 must be completed first

---

##  How to Contribute

We're excited to have you contribute! Here's the complete process:

### Step 1: Choose an Issue

1. Browse the [Open Issues](#-open-issues) above
2. Pick one that matches your skill level:
   - 🟢 **Beginner** - New to Flutter? Start here!
   - 🟡 **Intermediate** - Some Flutter experience
   - 🔴 **Advanced** - Ready for a challenge
3. Read the issue description carefully

### Step 2: Claim the Issue

1. Go to the [GitHub Issues page](https://github.com/your-username/SplitSmart/issues)
2. Find your chosen issue
3. Comment: **"I would like to work on this issue"**
4. Wait for assignment (usually within 24 hours)

### Step 3: Set Up Your Environment

```bash
# Fork the repo on GitHub (click Fork button)

# Clone YOUR fork
git clone https://github.com/YOUR-USERNAME/SplitSmart.git
cd SplitSmart

# Add upstream remote
git remote add upstream https://github.com/ORIGINAL-OWNER/SplitSmart.git

# Install dependencies
flutter pub get

# Create a new branch
git checkout -b feature/issue-number-description
# Example: git checkout -b feature/1-round-decimals
```

### Step 4: Make Your Changes

1. **Code**: Implement the feature/fix
2. **Test**: Run the app and test thoroughly
   ```bash
   flutter run
   ```
3. **Follow style**:
   - Use existing code patterns
   - Add comments for complex logic
   - Keep variable names descriptive
   - Match the existing UI style

### Step 5: Commit Your Changes

```bash
# Add your changes
git add .

# Commit with a clear message
git commit -m "Fix: Round amount to 2 decimal places (#1)"
# Or
git commit -m "Feature: Add camera integration (#4)"

# Push to your fork
git push origin feature/issue-number-description
```

### Step 6: Create Pull Request

1. Go to your fork on GitHub
2. Click **"Compare & Pull Request"**
3. Fill in the PR template:
   ```markdown
   ## Issue Number
   Closes #1

   ## Description
   Fixed decimal rounding to show exactly 2 decimal places.

   ## Changes Made
   - Updated _calculateSplit() to use toStringAsFixed(2)
   - Tested with amounts like 100÷3, 1000÷7

   ## Screenshots (if UI changes)
   [Add before/after screenshots]

   ## Checklist
   - [x] Code tested on emulator
   - [x] Follows existing code style
   - [x] No errors or warnings
   ```
4. Submit the PR!

### Step 7: Review Process

- Maintainer will review your code
- May request changes
- Make requested changes and push again
- Once approved, your PR will be merged! 🎉

---

##  Development Guidelines

### Code Style

- **Formatting**: Use `flutter format .` before committing
- **Linting**: No warnings allowed - fix all lint issues
- **Naming**: Use descriptive names (e.g., `_calculateSplit` not `_calc`)
- **Comments**: Add comments for non-obvious logic
- **TODOs**: Use format: `// TODO: Issue #X - Description`

### Testing

Before submitting PR:
```bash
# Check for errors
flutter analyze

# Format code
flutter format .

# Run the app
flutter run

# Test your specific feature thoroughly
# Test edge cases (empty inputs, large numbers, etc.)
```

### Commit Messages

Follow this format:
- `Fix: Brief description (#issue-number)`
- `Feature: Brief description (#issue-number)`
- `Update: Brief description (#issue-number)`

Examples:
- `Fix: Round amounts to 2 decimals (#1)`
- `Feature: Add camera integration (#4)`
- `Update: Improve button animations (#6)`

---

## 🛠️ Tech Stack

| Technology | Purpose | Version |
|------------|---------|---------|
| **Flutter** | UI Framework | 3.0+ |
| **Dart** | Programming Language | 3.0+ |
| **image_picker** | Camera integration | 1.0.4 |
| **share_plus** | Social sharing | 7.2.1 |
| **shared_preferences** | Local storage | 2.2.2 |
| **google_mlkit_text_recognition** | OCR (to be added) | TBD |
| **fl_chart** | Analytics charts (to be added) | TBD |

### Dependencies

Current `pubspec.yaml` includes:
```yaml
dependencies:
  flutter:
    sdk: flutter
  image_picker: ^1.0.4      # For camera
  share_plus: ^7.2.1        # For sharing
  shared_preferences: ^2.2.2 # For storage
```

Contributors will add more as needed for advanced features!

---

## 🧪 Testing

### Manual Testing Checklist

Before submitting any PR, test these scenarios:

**Basic Functionality:**
- [ ] App launches without errors
- [ ] Can enter amount and people
- [ ] Tip buttons toggle correctly
- [ ] Calculate button works
- [ ] Result card displays properly

**Edge Cases:**
- [ ] Empty inputs
- [ ] Zero values
- [ ] Negative numbers
- [ ] Very large numbers (1000000)
- [ ] Decimal inputs (100.50)
- [ ] Single person split

**UI/UX:**
- [ ] All text is readable
- [ ] Animations are smooth
- [ ] No overflow errors
- [ ] Works on different screen sizes

---

##  Contributors

A huge thank you to everyone who contributes! 🎉

<!-- This section will auto-update with contributor avatars -->
<a href="https://github.com/your-username/SplitSmart/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=your-username/SplitSmart" />
</a>

### Top Contributors
*List will be updated as contributions are merged!*

---

##  Project Stats

![GitHub Stars](https://img.shields.io/github/stars/your-username/SplitSmart?style=social)
![GitHub Forks](https://img.shields.io/github/forks/your-username/SplitSmart?style=social)
![GitHub Issues](https://img.shields.io/github/issues/your-username/SplitSmart)
![GitHub Pull Requests](https://img.shields.io/github/issues-pr/your-username/SplitSmart)

---


## 💡 Future Enhancements

Ideas for future versions (feel free to suggest more!):

- 🌍 **Multi-currency support** - Handle different currencies
- 👥 **Group management** - Save friend groups
- 📧 **Email summaries** - Send split details via email
- 🎨 **Theme customization** - Dark mode, color schemes
- 🔔 **Payment reminders** - Notify people who owe money
- 💳 **Payment integration** - Direct payment links (UPI, PayPal)
- 🗣️ **Voice input** - "Hey SplitSmart, split 500 between 4 people"
- 🌐 **Web version** - PWA for browser access
- 📱 **Widget support** - Quick access from home screen

---

##  Contact & Support

### Maintainer
**[Riya Jain]**  
Created for **[Google Developer Student Clubs (GDSC) IGDTUW]** Snowscript Open Source Contribution Event

-  Email: jain108riya@gmail.com
-  GitHub: [@your-username](https://github.com/riyajain137)
-  LinkedIn: [Your LinkedIn](https://www.linkedin.com/in/riya-jain-657721316)

---

##  Acknowledgments

- Flutter team for the amazing framework
- Google ML Kit for text recognition capabilities
- Open source community for inspiration
- All contributors who help improve SplitSmart!

---

<div align="center">

###  Star this repo if you find it helpful!

**Made with ❤️ and Flutter**

[⬆ Back to Top](#-splitsmart)

</div>
