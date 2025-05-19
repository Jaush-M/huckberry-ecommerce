# 🏄‍♂️ **HUCKBERRY ECOMMERCE**

<div align="center">
  <img src="./docs/banner.png" alt="Huckberry Banner" width="100%" style="border-radius:8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);" />
  
  <br/>

  <h3>
    <span style="color:#38bdf8; font-weight:600;">Premium sunglasses shopping platform powered by Django & Tailwind CSS v4</span>
  </h3>
  
  [![Python](https://img.shields.io/badge/Python-3.11+-blue.svg?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
  [![Django](https://img.shields.io/badge/Django-Latest-green.svg?style=for-the-badge&logo=django&logoColor=white)](https://www.djangoproject.com/)
  [![Tailwind CSS](https://img.shields.io/badge/Tailwind-v4-38bdf8.svg?style=for-the-badge&logo=tailwindcss&logoColor=white)](https://tailwindcss.com/)
  [![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Latest-blue.svg?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
</div>

---

## ✨ **Showcase**

<div align="center">
  <table>
    <tr>
      <td width="33%" style="border: none;">
        <img src="./docs/screenshots/homepage.png" alt="Homepage" width="100%" style="border-radius:6px; border:2px solid #38bdf8" />
        <p align="center"><b>Homepage</b></p>
      </td>
      <td width="33%" style="border: none;">
        <img src="./docs/screenshots/product.png" alt="Product Page" width="100%" style="border-radius:6px; border:2px solid #38bdf8" />
        <p align="center"><b>Product View</b></p>
      </td>
      <td width="33%" style="border: none;">
        <img src="./docs/screenshots/cart.png" alt="Shopping Cart" width="100%" style="border-radius:6px; border:2px solid #38bdf8" />
        <p align="center"><b>Shopping Cart</b></p>
      </td>
    </tr>
  </table>
</div>

---

## ⚡ **Features**

<table>
  <tr>
    <td width="50%">
      <h3>🛒 Shopping Experience</h3>
      <ul>
        <li>Responsive product catalog</li>
        <li>Dynamic product filtering</li>
        <li>Secure checkout process</li>
        <li>Order history & tracking</li>
      </ul>
    </td>
    <td width="50%">
      <h3>👤 User Management</h3>
      <ul>
        <li>User registration & authentication</li>
        <li>Profile customization</li>
        <li>Wishlist functionality</li>
        <li>Saved payment methods</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td width="50%">
      <h3>🔧 Admin Controls</h3>
      <ul>
        <li>Product management</li>
        <li>Inventory tracking</li>
        <li>Order processing</li>
        <li>Customer insights</li>
      </ul>
    </td>
    <td width="50%">
      <h3>🎨 Design</h3>
      <ul>
        <li>Modern UI with Tailwind CSS v4</li>
        <li>Responsive on all devices</li>
        <li>Custom animations</li>
        <li>Accessible design patterns</li>
      </ul>
    </td>
  </tr>
</table>

---

## 🛠️ **Technology Stack**

<div align="center">
  <table width="100%">
    <tr>
      <td align="center" width="25%">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/django/django-plain.svg" width="48" height="48" alt="Django" />
        <br><strong>Django</strong>
        <br><small>Web Framework</small>
      </td>
      <td align="center" width="25%">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" width="48" height="48" alt="Python" />
        <br><strong>Python 3.11+</strong>
        <br><small>Backend Language</small>
      </td>
      <td align="center" width="25%">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/tailwindcss/tailwindcss-plain.svg" width="48" height="48" alt="Tailwind" />
        <br><strong>Tailwind CSS v4</strong>
        <br><small>Styling Framework</small>
      </td>
      <td align="center" width="25%">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg" width="48" height="48" alt="PostgreSQL" />
        <br><strong>PostgreSQL</strong>
        <br><small>Database</small>
      </td>
    </tr>
    <tr>
      <td align="center">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" width="48" height="48" alt="JavaScript" />
        <br><strong>JavaScript</strong>
        <br><small>Frontend Logic</small>
      </td>
      <td align="center">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" width="48" height="48" alt="HTML5" />
        <br><strong>HTML5</strong>
        <br><small>Markup</small>
      </td>
      <td align="center">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" width="48" height="48" alt="Docker" />
        <br><strong>Docker</strong>
        <br><small>Containerization</small>
      </td>
      <td align="center">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" width="48" height="48" alt="Git" />
        <br><strong>Git</strong>
        <br><small>Version Control</small>
      </td>
    </tr>
  </table>
</div>

---

## 📂 **Project Structure**

```
huckberry_ecommerce/
├── 📁 huckberry_site/      # Core project settings & configurations
│   ├── 📄 settings.py      # Main Django settings
│   ├── 📄 urls.py          # Top-level URL routing
│   └── 📄 wsgi.py          # WSGI application entry point
│
├── 📁 store/               # Main application module
│   ├── 📁 migrations/      # Database migrations
│   ├── 📁 templates/       # HTML templates
│   ├── 📄 models.py        # Data models (Products, Orders, etc.)
│   ├── 📄 views.py         # View controllers
│   ├── 📄 urls.py          # App-level URL routing
│   └── 📄 admin.py         # Admin panel configuration
│
├── 📁 theme/               # Tailwind configuration
│   ├── 📁 static/          # Compiled CSS & JS assets
│   └── 📄 tailwind.config.js # Tailwind settings
│
├── 📁 docs/                # Documentation assets
│   ├── 📄 banner.png       # README banner image
│   └── 📁 screenshots/     # Application screenshots
│
├── 📄 manage.py            # Django CLI entry point
├── 📄 requirements.txt     # Python dependencies
└── 📄 README.md            # Project documentation
```

---

## 🚦 **Quick Start Guide**

### 1️⃣ **Clone & Set Up Environment**

```bash
# Clone the repository
git clone https://github.com/jaush-m/huckberry-ecommerce.git
cd huckberry-ecommerce

# Set up virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### 2️⃣ **Configure Environment Variables**

Copy the example file to `.env`:

```bash
cp .env.example .env
```

Update the values in `.env` to your local configuration.

### 3️⃣ **Database Setup**

```bash
# Create and apply migrations
python manage.py makemigrations
python manage.py migrate

# Create superuser for admin access
python manage.py createsuperuser
```

### 4️⃣ **Tailwind CSS Setup**

```bash
# Install Tailwind CSS dependencies
python manage.py tailwind install

# Start Tailwind CSS build process
python manage.py tailwind start
```

### 5️⃣ **Launch the Application**

```bash
# Start development server
python manage.py runserver
```

> 🌐 Access the site at [http://127.0.0.1:8000/](http://127.0.0.1:8000/)
>
> 👩‍💼 Admin dashboard at [http://127.0.0.1:8000/admin/](http://127.0.0.1:8000/admin/)

---

## 🏗️ **Architecture Highlights**

- **🧱 MVT Pattern** – Clean separation of concerns with Django's Model-View-Template architecture

- **🗃️ Database Design** – Optimized PostgreSQL schema with proper indexing and relationships

- **🎨 Frontend Strategy** – Utility-first styling with Tailwind CSS v4 for rapid development

- **🔐 Security** – Django's robust authentication with CSRF protection and password hashing

---

## 👤 **About the Author**

<div align="center">
  <img src="https://github.com/jaush-m.png" alt="Jaushan" width="100" style="border-radius:50%; border:2px solid #38bdf8" />
  
  <h3>Jaushan</h3>
  
  <p>
    <a href="mailto:jaushvx@icloud.com">
      <img src="https://img.shields.io/badge/Email-jaushvx%40icloud.com-red?style=for-the-badge&logo=gmail&logoColor=white" alt="Email" />
    </a>
    <a href="https://github.com/jaush-m">
      <img src="https://img.shields.io/badge/GitHub-jaush--m-black?style=for-the-badge&logo=github&logoColor=white" alt="GitHub" />
    </a>
  </p>
</div>

---

<div align="center">
  <p>📝 <b>License:</b> MIT</p>
  <p>⭐ Star this repository if you find it useful!</p>
</div>
