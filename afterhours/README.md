# 🌙 AfterHours

**AfterHours** is a reflective, story-driven Flutter application that transforms how users think about their day.  
Instead of filling forms or journaling mechanically, users **experience their day as a narrative**, guided by a visual character and subtle animations.

---

## ✨ Core Idea

> _Your day isn’t data. It’s a story._

AfterHours helps users:
- Choose a character that represents them
- Capture the emotional arc of their day
- Reflect through short story-like prompts
- See their responses unfold as a narrative, not a list

---

## 🎭 Key Features

### Character-Driven Experience
- Users select a visual character
- The character stays with them throughout the story
- Character motion adapts to the user’s mood

### Mood Arc Selection
- Users express how the day felt overall
- The selected mood subtly affects animations and posture

### Story-Based Flow
- Day is broken into acts (Beginning, Shift, Weight, Carry)
- One act per screen — no overwhelming forms

### Animated Story Reveal
- Scenes appear one by one
- Calm transitions and gold accent dividers
- Emphasis on readability and emotional pacing

### Pure Flutter Implementation
- No backend
- No ML
- No assets (characters drawn using `CustomPainter`)
- Fully offline

---

## 🛠 Tech Stack

- **Flutter (Material 3)**
- **Dart**
- Custom animations using:
  - `AnimationController`
  - `AnimatedSwitcher`
  - `CustomPainter`

---

## 🧠 Design Philosophy

- Minimal UI with intentional spacing
- Dark theme with gold accents for calm focus
- Subtle animations instead of loud effects
- Characters as emotional anchors, not gimmicks

This project prioritizes **experience design over feature count**.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed
- Any Flutter-supported IDE

### Run Locally
```bash
flutter pub get
flutter run
