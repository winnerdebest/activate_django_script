# Django Startup Script (Windows)

This repository contains a custom Windows batch script (`start.bat`) that automates the setup and launch of a Django development server. It ensures your environment is ready, dependencies are installed, and your project is running — all with a single double-click.

---

## 🚀 Features

- ✅ Checks for existing virtual environment (`env/`)
- 🔄 Automatically creates the environment if it doesn’t exist
- 📦 Installs `virtualenv` if it's missing
- 🧪 Installs Python dependencies from `requirements.txt`
  - Skips install if `requirements.txt` hasn’t changed (for faster startup)
- 🌐 Automatically opens the default browser to `http://127.0.0.1:8000`
- 🛠️ Launches the Django development server

---

## 📝 How to Use

1. Place the `start.bat` file in the root directory of your Django project (where `manage.py` and `requirements.txt` live).
2. Make sure your `requirements.txt` is up to date.
3. Double-click `start.bat` or run it from the terminal:
   ```cmd
   start.bat
````

That’s it — your dev server will start and your browser will open automatically.

---

## 📁 Folder Structure Example

```
myproject/
├── env/                 # Automatically created virtualenv folder
├── manage.py
├── requirements.txt
├── start.bat            # This script
├── app/
│   └── ...
└── ...
```

---

## 💡 Notes

* This script is **pure Windows CMD** — no PowerShell or third-party dependencies.
* If `requirements.txt` is changed, it will automatically re-install dependencies.
* If it's unchanged, it skips the install step to save time.
* Works best on Windows 10 and up.

---

## 🔐 Optional Improvements

* Auto-run `python manage.py migrate`
* Add `.env` file auto-detection and loading
* Add support for custom ports

Let me know if you’d like to contribute or suggest improvements!

---

## 🧑‍💻 Author

Built by [@winnerdebest](https://github.com/winnerdebest) — feel free to fork, improve, or open issues.

```
