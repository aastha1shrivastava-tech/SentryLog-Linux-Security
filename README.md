# RHEL Mini Project – OnboardOps Provisioning Kit

## 1. Project Overview

The OnboardOps Provisioning Kit is a Linux system administration project developed using Red Hat Enterprise Linux (RHEL).

The project automates user account creation, group management, password policies, sudo privileges, and shared directory permissions using Bash scripting.

## 2. Problem Statement

In many organizations, creating user accounts and assigning permissions manually can lead to inconsistent access control and security issues.

This project provides a standardized approach to user and group provisioning, ensuring that every new team member receives the correct permissions and access.

## 3. Objectives

- Create and manage Linux user accounts.
- Create a common group named `devteam`.
- Configure password expiration policies using `chage`.
- Assign sudo privileges to an authorized user.
- Configure shared directory permissions.
- Implement SGID and Sticky Bit permissions.
- Configure appropriate default file permissions.
- Automate the entire process using a Bash script.

## 4. Technologies Used

- Red Hat Enterprise Linux (RHEL 10)
- VMware Workstation
- Bash Shell Scripting
- Linux User and Group Management
- Linux File Permissions
- Sudo Configuration

## 5. Commands Used

Some important Linux commands used in this project:

| Command | Purpose |
|---|---|
| `useradd` | Create user accounts |
| `groupadd` | Create groups |
| `usermod` | Modify user properties |
| `passwd` | Set user passwords |
| `chage` | Configure password aging |
| `chmod` | Change file permissions |
| `chown` | Change ownership |
| `umask` | Set default permissions |
| `visudo` | Safely configure sudo privileges |
| `id` | Display user and group information |
| `ls -ld` | Verify directory permissions |
| `sudo -l` | Check sudo privileges |

## 6. Implementation

The project is implemented through a Bash script named `provision.sh`.

The script performs the following operations:

1. Creates the `devteam` group.
2. Creates three user accounts.
3. Adds all users to the `devteam` group.
4. Configures password aging policies.
5. Grants sudo access to one authorized user.
6. Creates a shared project directory at `/shared/project`.
7. Configures SGID and Sticky Bit permissions.
8. Sets appropriate default permissions.

## 7. Verification

The configuration can be verified using:

- `id` – To verify user and group membership.
- `ls -ld /shared/project` – To verify directory permissions.
- `sudo -l` – To verify sudo privileges.
- `chage -l username` – To verify password aging policies.

Screenshots of successful execution and verification are included in the repository.

## 8. Learning Outcomes

Through this project, I gained practical experience in:

- Linux user and group administration.
- Managing file and directory permissions.
- Bash scripting and automation.
- Implementing basic Linux security practices.
- Configuring sudo privileges.
- Troubleshooting Linux administration issues.

## 9. Conclusion

This project demonstrates how Linux system administration tasks can be automated using Bash scripting.

It provides a standardized and secure approach to user provisioning and access management in a RHEL environment.
