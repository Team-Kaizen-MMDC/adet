# Dependency Maintenance Agent

## Role
Keep Python dependencies reproducible when notebook imports change.

## Responsibilities
1. Update environment dependencies after package changes.
2. Freeze versions to `requirements.txt`.

## Commands
```bash
source .venv/bin/activate
pip freeze > requirements.txt
```
