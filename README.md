<<<<<<< HEAD
# cadt-backend-evaluation

This repository is used for submitting and reviewing classroom assignments.  
Each student will submit their work via **Pull Request (PR)** from their **forked repository**.  
Feedback will be provided directly in the PR.

---

## Folder Structure

Each student must submit their work in the following directory format:

```
W<week_number>/g<group_number>/<student_id>/
```

**Example:**

```
W1/g1/SE323253/
```

✅ Only modify your assigned folder.  
❌ Do NOT change other folders or shared files.

---

## How to Submit Your Assignment

1. **Fork** this repository to your GitHub account.
2. **Clone** your fork:
   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   ```
3. **Create a new branch** for your submission:
   ```bash
   git checkout -b week1-SE323253
   ```
4. **Add your assignment** inside your designated folder.

   > **⚠️ Important:**  
   > Do **NOT** commit or push your `node_modules` folder or other dependencies.  
   > Make sure your `.gitignore` file includes `node_modules/`.

5. **Commit and push** your changes:
   ```bash
   git add .
   git commit -m "Week 1 assignment - SE323253"
   git push origin week1-SE323253
   ```
6. **Open a Pull Request** from your forked branch to the `main` branch of the **original repo**.
   - Go to your fork on GitHub.
   - Click the **"Compare & pull request"** button.
   - Ensure the base repo is the **original class repo**, and the base branch is `main`.
   - Add a **meaningful title** (e.g., `Week 1 Submission - SE323253`).
   - In the PR description, you can write any notes or explanations.

---

## Avoiding Conflicts & Merge Issues

To prevent your PR from being unmergeable:

- **Keep your fork up to date** with the original repo:
  ```bash
  git remote add upstream https://github.com/<classroom-org>/<repo-name>.git
  git fetch upstream
  git rebase upstream/main
  ```
- **Do not modify folders or files that are not assigned to you.**
- If your PR shows conflicts, **rebase and resolve locally**, then force push:
  ```bash
  git rebase upstream/main
  git push --force
  ```

---

## Good Submission Practices

To keep the repository clean and organized, please follow these guidelines:

- **Only add your exercise folders** (e.g., `EX-1`, `EX-2`, etc.) inside your designated folder.  
  ❌ Do **NOT** include extra folders like `startcode`, `ex1`, `ex2`, `.DS_Store`, `.zip` files, or any unrelated files.
- For each exercise, if you need to answer questions, **create a Markdown file** named `answer.md` inside the corresponding exercise folder (e.g., `EX-1/answer.md`).  
  ❌ Do **NOT** submit answers as PDFs, Word documents, or other formats.
- **Keep your folder structure and file naming consistent** for easier review and feedback.
- Double-check that your submission only contains the required files and folders before committing.

**Example of a correct submission structure:**
```
W1/g1/SE323253/
  ├── EX-1/
  │     ├── answer.md
  │     └── (your code files)
  └── EX-2/
        ├── answer.md
        └── (your code files)
```

---

## Feedback Process

- Teachers will review your PR and leave comments.
- You can push updates to the same branch to address the feedback.
- Once approved, your PR will be merged.

---
=======
# W3---PRACTICE---LAYERED-ARCHITECTURE
>>>>>>> 80a973490fdeabe946f33c8232ccbcf5e713d90a
