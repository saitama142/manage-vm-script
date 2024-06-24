# Manage VM Script

This script helps manage an Azure Virtual Machine (VM) by handling the starting, SSH connection, and shutting down of the VM. It checks the status of the VM, starts it if it is deallocated, retrieves the public IP address, connects to it via SSH, and then deallocates the VM once the SSH session is closed.

## Features

- **Start VM**: Automatically starts the VM if it is deallocated.
- **Retrieve Public IP**: Fetches the current public IP address of the VM.
- **SSH Connection**: Connects to the VM via SSH using the provided SSH key.
- **Deallocate VM**: Shuts down and deallocates the VM to stop incurring charges once the SSH session is closed.

## Prerequisites

- Azure CLI must be installed and configured. [Install Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- SSH keys must be set up and accessible.

## Setup

1. **Clone the Repository**

    ```bash
    git clone https://github.com/yourusername/manage-vm-script.git
    cd manage-vm-script
    ```

2. **Set the Environment Variables**

    Before running the script, set the following environment variables:

    ```bash
    export VM_NAME="your_vm_name"
    export RESOURCE_GROUP="your_resource_group"
    export SSH_KEY_PATH="/path/to/your/ssh_key.pem"
    export SSH_USER_NAME="your_username"
    ```

    Alternatively, you can modify the script to hardcode these values if you prefer.

## Usage

1. **Make the Script Executable**

    Ensure the script has execute permissions:

    ```bash
    chmod +x manage-vm.sh
    ```

2. **Run the Script**

    Execute the script to manage the VM:

    ```bash
    ./manage-vm.sh
    ```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

