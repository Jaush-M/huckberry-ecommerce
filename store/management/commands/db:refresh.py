from django.core.management.base import BaseCommand
from django.core.management import call_command
from django.conf import settings
import os


class Command(BaseCommand):
    help = "Fully reset the database: flush, migrate, seed"

    def handle(self, *args, **kwargs):
        self.stdout.write(self.style.WARNING("⚠️ Resetting the database..."))

        # Flush: wipe all data
        call_command("flush", "--noinput")

        # Delete all migration files except __init__.py
        self.stdout.write("🧹 Cleaning old migrations...")
        for app in settings.INSTALLED_APPS:
            if "store" in app:  # Adjust this for other apps if needed
                app_path = os.path.join(
                    settings.BASE_DIR, app.split(".")[-1], "migrations"
                )
                if os.path.isdir(app_path):
                    for f in os.listdir(app_path):
                        if f != "__init__.py" and f.endswith(".py"):
                            os.remove(os.path.join(app_path, f))

        # Make fresh migrations
        call_command("makemigrations")
        call_command("migrate")

        # Seed the database
        self.stdout.write("🌱 Seeding data...")
        call_command("db:seed")

        self.stdout.write(
            self.style.SUCCESS("✅ Database reset and seeded successfully.")
        )
