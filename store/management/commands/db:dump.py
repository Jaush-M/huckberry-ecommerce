from django.core.management.base import BaseCommand
import os
from environs import Env


class Command(BaseCommand):
    help = "Dump PostgreSQL DB using pg_dump"

    def handle(self, *args, **kwargs):
        env = Env()
        env.read_env()

        app_name = env.str("APP_NAME")

        db_user = env.str("DB_USERNAME")
        db_name = env.str("DB_DATABASE")
        db_host = env.str("DB_HOST")
        db_port = env.str("DB_PORT")

        dump_file = f"{app_name}_dump.sql"

        command = f"pg_dump -U {db_user} -h {db_host} -p {db_port} -d {db_name} > docs/db_dump/{dump_file}"

        self.stdout.write(f"Running command: {command}")
        os.system(command)
