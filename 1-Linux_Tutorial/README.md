# Linux Basic Commands

This README file provides a brief introduction to some essential Linux commands for beginners.

## Table of Contents
1. [Navigating the File System](#navigating-the-file-system)
2. [File Management](#file-management)
3. [Directory Management](#directory-management)
4. [Permissions](#permissions)
5. [Viewing File Contents](#viewing-file-contents)
6. [System Information](#system-information)

### Navigating the File System

- To print the current working directory:

  ```
  pwd
  ```

- To change the current working directory:

  ```
  cd [directory]
  ```

- To list the contents of a directory:

  ```
  ls [options] [directory]
  ```

### File Management

- To create a new file:

  ```
  touch [file]
  ```

- To copy a file:

  ```
  cp [source] [destination]
  ```

- To move a file:

  ```
  mv [source] [destination]
  ```

- To remove a file:

  ```
  rm [file]
  ```

### Directory Management

- To create a new directory:

  ```
  mkdir [directory]
  ```

- To remove an empty directory:

  ```
  rmdir [directory]
  ```

- To remove a non-empty directory:

  ```
  rm -r [directory]
  ```

### Permissions

- To change file or directory permissions:

  ```
  chmod [permissions] [file or directory]
  ```

- To change file or directory ownership:

  ```
  chown [owner] [file or directory]
  ```

### Viewing File Contents

- To display the contents of a file:

  ```
  cat [file]
  ```

- To display the first few lines of a file:

  ```
  head [file]
  ```

- To display the last few lines of a file:

  ```
  tail [file]
  ```

### System Information

- To display system information:

  ```
  uname -a
  ```

- To display disk usage:

  ```
  df -h
  ```

- To display memory usage:

  ```
  free -h
  ```


# Linux Basic Commands - chmod and chown

This section provides an in-depth explanation of the `chmod` and `chown` commands, including examples.

## chmod - Change File and Directory Permissions

### Symbolic Mode

| Operator | Description |
| -------- | ----------- |
| `u`      | User        |
| `g`      | Group       |
| `o`      | Others      |
| `a`      | All (User, Group, and Others) |

| Permission | Description |
| ---------- | ----------- |
| `r`        | Read        |
| `w`        | Write       |
| `x`        | Execute     |

| Action | Description |
| ------ | ----------- |
| `+`    | Add permission |
| `-`    | Remove permission |
| `=`    | Set permission |

### Example

To add execute permission for the user:


```
chmod u+x [file or directory]
```

To remove write permission for the group and others:

```
chmod go-w [file or directory]
```


To set read and execute permissions for the user, and read permission for the group and others:


```
chmod u=rw,g=r,o=r [file or directory]
```

## Octal Mode

| Octal Value | Permission          |
| ----------- | ------------------- |
| `0`         | No permission       |
| `1`         | Execute             |
| `2`         | Write               |
| `3`         | Write and Execute   |
| `4`         | Read                |
| `5`         | Read and Execute    |
| `6`         | Read and Write      |
| `7`         | Read, Write, Execute|


## Octal Permissions and Examples

| Octal Value | Permission          | Description                              | Example                      |
| ----------- | ------------------- | ---------------------------------------- | ---------------------------- |
| `0`         | No permission       | No permissions are granted               | `chmod 000 file.txt`         |
| `1`         | Execute             | Execute permission only                  | `chmod 111 script.sh`        |
| `2`         | Write               | Write permission only                    | `chmod 222 file.txt`         |
| `3`         | Write and Execute   | Write and execute permissions            | `chmod 333 script.sh`        |
| `4`         | Read                | Read permission only                     | `chmod 444 file.txt`         |
| `5`         | Read and Execute    | Read and execute permissions             | `chmod 555 script.sh`        |
| `6`         | Read and Write      | Read and write permissions               | `chmod 666 file.txt`         |
| `7`         | Read, Write, Execute| All permissions (read, write, and execute)| `chmod 777 script.sh`        |

To set permissions using octal values, use the `chmod` command followed by the octal value for user, group, and others:
```
chmod [user][group][others] [file or directory]
```
Example:

To set read, write, and execute permissions for the user, read and execute permissions for the group, and read permissions for others:
```
chmod 754 script.sh
```
## Combining Octal Permissions

You can combine octal permissions to create custom permission sets for your files and directories. Each digit in the octal value represents the permissions for the user, group, and others, respectively.

### Examples

1. To set read and write permissions for the user, and read permissions for the group and others:

```
chmod 644 file.txt
```

2. To set read, write, and execute permissions for the user, and read permissions for the group and others:
```
chmod 744 script.sh
```

3. To set read and execute permissions for the user, group, and others:
```
chmod 555 script.sh
```

Remember to carefully choose permissions based on the security requirements
### Example

To set read, write, and execute permissions for the user, read and write permissions for the group, and read permission for others:

```
chmod 764 [file or directory]
```


## chown - Change File and Directory Ownership

### Syntax

```
chown [owner]:[group] [file or directory]
```

### Example

To change the owner of a file or directory to `newuser` and the group to `newgroup`:

```
chown newuser:newgroup [file or directory]
```

To change only the owner to `newuser`:

```
chown newuser [file or directory]
```

To change only the group to `newgroup`:

```
chown :newgroup [file or directory]
```

## chmod Examples for Different File Types

1. Set read-only permission for a `.pem` file:

```
chmod 400 private_key.pem
```
This restricts the `.pem` file to be readable only by the owner, ensuring the private key remains secure.

2. Set read, write, and execute permissions for the owner, and read and execute permissions for the group and others on a `script.sh` file:

```
chmod 755 script.sh

```
This allows the owner to read, write, and execute the script, while others can only read and execute it.

3. Set read, write, and execute permissions for the owner, group, and others on a `script.sh` file:

```
chmod 777 script.sh
```

This allows everyone to read, write, and execute the script, which can be a security risk and is generally not recommended.

## Additional Notes

- The `chmod` and `chown` commands can be used recursively with the `-R` option to change permissions or ownership for a directory and its contents:


```
chmod -R [permissions] [directory]
chown -R [owner]:[group] [directory]
```


- You can use the `umask` command to set default file permissions for newly created files:

```
umask [octal value]
```

- You can use the `id` command to display information about the current user and group:

```
id
```
For more information and examples, consult the `man` pages for each command:
```
man chmod
man chown
```