# 📊 BMI Tracker - Your Personal Health Companion

A simple and user-friendly Flutter app to calculate, track, and visualize your **Body Mass Index (BMI)** over time.

---

## ✨ Features

✅ **Instant BMI Calculation** – Enter your weight & height, and get your BMI instantly.  
📈 **BMI History & Trends** – View past BMI records on an interactive graph.  
📊 **Health Tips** – Get helpful suggestions based on your BMI.  
🎤 **Voice Input** – Input your weight and height using voice commands.  
💾 **Data Persistence** – Your BMI history is saved automatically.  
🎨 **Custom Themes** – Switch between dark and light modes.

---

## 📂 Project Structure

```
📦 bmi_tracker  
 ┣ 📂 lib  
 ┃ ┣ 📂 screens            # Main app screens  
 ┃ ┃ ┣ 📜 home_screen.dart       # Main dashboard  
 ┃ ┃ ┣ 📜 history_screen.dart    # Shows past BMI records  
 ┃ ┣ 📂 utils              # Logic & services  
 ┃ ┃ ┣ 📜 bmi_calculator.dart    # BMI calculation logic  
 ┃ ┃ ┣ 📜 health_tips.dart       # Health recommendations  
 ┃ ┃ ┣ 📜 speech_input.dart      # Voice input feature  
 ┃ ┃ ┣ 📜 storage_service.dart   # Handles data storage  
 ┃ ┃ ┣ 📜 theme_provider.dart    # Theme management  
 ┃ ┣ 📂 widgets            # Reusable UI components  
 ┃ ┃ ┣ 📜 bmi_chart.dart         # Line chart for BMI trends  
 ┃ ┃ ┣ 📜 bmi_input.dart         # User input fields  
 ┃ ┃ ┣ 📜 bmi_result.dart        # BMI display component  
 ┃ ┣ 📜 main.dart          # App entry point  
```

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/your-username/bmi-tracker.git  
cd bmi-tracker
```

### 2️⃣ Install Dependencies
```sh
flutter pub get
```

### 3️⃣ Run the App
```sh
flutter run
```

---

## 🛠️ Tech Stack

- **Flutter & Dart** – Core framework
- **FL Chart** – For interactive BMI graphs
- **SharedPreferences/Hive** – Data storage
- **Speech-to-Text** – For voice input

---

🚀 Happy Tracking! Stay Healthy! 💪

---