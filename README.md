pre-commit pngquant
===================

For pre-commit see: https://github.com/pre-commit/pre-commit

For pngquant see: https://pngquant.org

### Using pngquant with pre-commit

1. Get pngquant binary and put it in your $PATH.

2. Add this to your `.pre-commit-config.yaml`:

```
repos:
  - repo: https://github.com/gdubicki/pre-commit-pngquant
    rev: ''  # Use the sha / tag you want to point at
    hooks:
      - id: pngquant
        args: [--speed=1] # these are optional
```
