# 📰 Netlify – Flutter News App

Netlify is a sleek and responsive Flutter mobile application that delivers the latest and trending technology news from around the world. It supports bookmarking articles, searching keywords, multiple themes (light/dark), and multiple locales (e.g., Arabic and English).



## 🎥 Demo Video

[![Watch Demo](https://img.youtube.com/vi/9TwKUTgZ-yU/0.jpg)](https://www.youtube.com/shorts/9TwKUTgZ-yU)

---

## ✨ Features

- 📰 Fetch latest technology news
- 🔍 Search articles by keyword
- 🌙 Dark and light theme support
- 🌐 Multi-language support (English, Arabic, ...)
- ⭐ Bookmark and unbookmark favorite articles
- 🌐 Offline connectivity indicator

---

## 📦 Packages Used

- [`dio`](https://pub.dev/packages/dio) – HTTP client
- [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv) – Load `.env` variables
- [`Cubit`](https://pub.dev/packages/flutter_bloc) state management solution
- [`connectivity_plus`](https://pub.dev/packages/connectivity_plus) – Internet connection tracking

---

🚀 Getting Started
1. Clone the Repository
```bash
git clone https://github.com/devJimmy990/x_projects_task.git
cd x_projects_task
```
2. Get an API Key
- Visit [`NewsAPI.org`](https://newsapi.org/), create an account, and get your API_KEY.
- Add your API key to the appropriate file. For example:
    - lib/core/network/endpoints.dart

💡 Make sure not to commit your API key to version control if it's sensitive.