# Flutter Experiment 1 – Working with Widgets and Layouts

**Course Code**: 24CS2016  
**Project Name**: `widget_layout`  
**Expected Result**: A fully functional Flutter student profile & dashboard interface utilizing `Container`, `Row`, `Column`, `Expanded`, `Card`, and `ListView`.

---

## 📌 Project Overview & Structure

This project implements all 10 steps outlined in Experiment 1 of the Flutter Lab Manual:

- **Step 4 – Basic Flutter Scaffold**: `MaterialApp` with `Scaffold` and `AppBar` titled **"Student Profile"**.
- **Step 5 – Column Widget**: Main vertical arrangement of student details.
- **Step 6 – Container Widget**: Custom styled profile container (`padding: 20`, `margin: 10`) displaying student information (**Raj**, **Computer Science and Engineering**, **Flutter Laboratory**).
- **Step 7 – Row Widget**: Action bar with `MainAxisAlignment.spaceEvenly` containing interactive icons (`Icons.home`, `Icons.person`, `Icons.settings`).
- **Step 8 – Card Widget**: Highlight card featuring `ListTile` (`Icons.book`, title: **Flutter**, subtitle: **Mobile Application Development**).
- **Step 9 – Expanded & ListView**: Scrollable list of enrolled courses (`Flutter`, `Cloud Computing`, `Programming`, `Web Technologies`, `Database Management`).

---

## 🚀 How to Run Locally

### Option 1: Using Flutter CLI
```bash
# 1. Fetch dependencies
flutter pub get

# 2. Run in Google Chrome (Web)
flutter run -d chrome

# 3. Or run on connected device/emulator
flutter run
```

### Option 2: Zero-Dependency Standalone Browser Preview
Simply double click or open `web/preview.html` in any web browser to interact with the exact live UI preview without needing Flutter installed locally!

---

## 🌐 Remote Push & GitHub Pages Deployment

This repository comes pre-configured with a **GitHub Actions automated workflow** (`.github/workflows/deploy.yml`) that builds the Flutter Web application and deploys it to GitHub Pages automatically on every push!

### Option A: Using the `deploy.sh` Helper Script
```bash
./deploy.sh
```
Follow the interactive prompt to enter your GitHub repository URL (e.g. `https://github.com/username/widget_layout.git`). The script will initialize git, stage, commit, and push automatically.

### Option B: Manual Push Steps
```bash
# 1. Initialize Git repository
git init
git branch -M main

# 2. Stage and commit
git add .
git commit -m "Initial commit: Flutter Experiment 1 Student Profile"

# 3. Add remote GitHub repository
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git

# 4. Push to main branch
git push -u origin main
```

---

## ⚙️ Enabling GitHub Pages in GitHub Settings

1. Open your repository on **GitHub.com**.
2. Go to **Settings** -> **Pages**.
3. Under **Build and deployment**:
   - **Source**: Select `Deploy from a branch`.
   - **Branch**: Select `gh-pages` and `/ (root)` folder.
4. Click **Save**.

Your Flutter application will be live at:
`https://YOUR_USERNAME.github.io/YOUR_REPOSITORY/`
