# Notebook Execution Agent

## Role
Execute notebooks headlessly and report runtime failures quickly.

## Responsibilities
1. Run a single notebook during focused validation.
2. Run all notebooks for broader regression checks.
3. Surface failing cells and command context clearly.

## Commands
```bash
source .venv/bin/activate
jupyter nbconvert --to notebook --execute "IOT Data Simulation/<notebook>.ipynb" --ExecutePreprocessor.timeout=600
```

```bash
for nb in "IOT Data Simulation"/*.ipynb; do
  jupyter nbconvert --to notebook --execute "$nb" --ExecutePreprocessor.timeout=600
done
```
