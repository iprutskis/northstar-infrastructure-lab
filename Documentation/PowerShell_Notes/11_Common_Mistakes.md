# Common Mistakes

## Read the First Error

### Problem

One error can cause many errors below it

### Solution

Always fix the first error before looking at the others

---

## Parser Errors

### Problem

A missing quote, bracket or backtick can generate multiple false errors

### Solution

Fix the parser error first, then run the script again

---

## Backtick (`)

### Problem

The backtick is not the last character on the line

### Solution

Make sure the backtick is the final character with nothing after it

---

## Active Directory Usernames

### Problem

Display Name, SamAccountName and UserPrincipalName do not match

### Solution

Verify all three values before assuming the script is wrong

Example:

Display Name

```text
Sarah Johnson
```

SamAccountName

```text
sarah.johnson
```

UserPrincipalName

```text
sarah.johnson@northstar.local
```

---

## Check the Data

### Problem

The script appears to be wrong

### Solution

Verify the input data before changing the script

Many problems are caused by incorrect data rather than incorrect code

## Today's Lessons

- Read the first parser error before fixing later errors
- A missing `=`, quote or backtick can cause multiple parser errors
- Verify Active Directory objects before assuming the script is wrong
- Verify file paths before running scripts that import or export data
- Test administration scripts more than once. A good administration script should be safe to rerun