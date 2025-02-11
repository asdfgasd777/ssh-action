# ssh-action

This repository contains a custom GitHub Actions action to perform SSH connections to remote servers and execute commands. It is based on using `sshpass` to automate the SSH connection using a password.

## Features

- **Automatic SSH connection**: Uses `sshpass` to enable SSH connection to a remote server without manual intervention.
- **Remote command execution**: Executes any provided command as a parameter on the remote server via SSH.
- **Parameter customization**: Allows you to provide information such as password, username, host IP, SSH port, and the commands to execute as parameters to the action.
- **Log readability improvements**: Adds line breaks before and after the SSH command execution for better readability in GitHub Actions logs.


## Usage

### 1. Prerequisites

Before using this action, ensure you have the following:

- **SSH access to the remote server**: You will need the user password to establish the SSH connection.
- **GitHub Actions**: This action must be used within a GitHub Actions workflow.

### 2. Input Parameters

- `user` (required): Username for the SSH connection.
- `password` (required): Password of the user for the SSH connection.
- `host` (required): IP address or domain name of the server you want to connect to.
- `port` (optional, default 22): SSH port on the remote server.
- `commands` (required): Commands to be executed on the remote server. This can include multiple commands separated by newlines.

### 3. Example Usage in a GitHub Actions Workflow

```yaml
name: SSH Connection and Command Execution

on:
  push:
    branches:
      - main

jobs:
  ssh-job:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Execute SSH commands using ssh-action
        uses: asdfgasd777/ssh-action@v1
        with:
          user: ${{ secrets.SSH_USER }}
          password: ${{ secrets.PASSWORD }}
          host: ${{ secrets.SSH_HOST }}
          port: 22
          commands: |
            echo "Starting SSH connection"
```
### 4. Workflow Description

- **name: Execute SSH commands using ssh-action**: In this step, we use the ssh-action to connect to the remote server, pass the commands we want to run, and get the output in GitHub Actions logs.
- **secrets.PASSWORD, secrets.SSH_USER, secrets.SSH_HOST**: These are secret values stored in your GitHub repository secrets. **Never hardcode passwords or keys directly into your YAML file.**
- **commands**: The commands you want to run on the remote server. These can be any commands supported by the target system.

## License

This project is licensed under the MIT License.
