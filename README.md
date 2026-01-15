# Cloud DevOps Platform

A starter Cloud/DevOps project: Flask app with a health endpoint.

## Run locally

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r app/requirements.txt
python app/app.py
Open:

http://localhost:5000

http://localhost:5000/health
EOF

yaml
Copy code

---

## 3) Run the app and verify it works ✅
(You already have `.venv`, good.)

```bash
source .venv/bin/activate
pip install -r app/requirements.txt
python app/app.py
In a new terminal tab:

bash
Copy code
curl -i http://localhost:5000/
curl -i http://localhost:5000/health
Stop server: Ctrl + C