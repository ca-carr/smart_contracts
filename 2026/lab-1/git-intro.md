# Git Basics in the Terminal

## 1. Check where you are and what branch you’re on

Go to the repo folder (example):

```bash
cd /workspaces/smart_contracts
```

Check your branch:

```bash
git branch
```

You should see `* main` (the `*` marks the current branch).

## 2. Always get up to date before you start working

Pull the latest changes:

```bash
git pull
```

If someone else (or you) changed the repo, this downloads and applies their updates. If `git pull` reports conflicts, stop and ask for help.

## 3. See what you have changed

Which files changed:

```bash
git status
```

See exact changes:

```bash
git diff
```

## 4. Add your changes (stage files)

You must stage files before you can commit them.

Add one file:

```bash
git add path/to/file.html
```

Or just add everything you changed:

```bash
git add .
```

Check staging:

```bash
git status
```

## 5. Commit your changes (saving a snapshot)

Make a commit with a message:

```bash
git commit -m "Update portfolio homepage"
```

Good commit messages are short and descriptive, for example: "Fix typo on About section", "Add contact links", "Change CSS styling".

## 6. Push your changes to GitHub (upload)

Upload your commits:

```bash
git push
```

Now everyone else can pull your changes.

## 7. The standard daily workflow

When you sit down to work, repeat this:

```bash
git pull
# edit files
git status
git add .
git commit -m "Describe what you did"
git push
```

## 8. If Git says “Nothing to commit”

That means you either didn’t change any files or forgot to `git add` them. Check:

```bash
git status
```

## 9. If you accidentally added the wrong file

Unstage it (remove from staging, keep your edits):

Unstage one file:

```bash
git restore --staged path/to/file
```

Unstage everything:

```bash
git restore --staged .
```

## 10. If you mess up a file and want to undo local changes

This will discard your edits in that file and restore the last committed version:

```bash
git restore path/to/file
```

Warning: this deletes your uncommitted changes to that file.

## 11. Quick reference commands (cheat sheet)

```bash
git status        # what changed?
git pull          # get latest changes from GitHub
git diff          # see exact changes
git add .         # stage everything
git commit -m " "  # commit staged changes
git push          # upload commits to GitHub
```

## 12. Common beginner rule

One person pushing to `main` for the whole class can get messy. Safer beginner setups:

- Each student works in their own copy (fork or separate repo), or
- Each student uses their own branch
