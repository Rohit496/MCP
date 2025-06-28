# Sample LuxeHotel - Luxury Hotel Management System

Welcome to LuxeHotel, a comprehensive hotel management system designed to streamline operations and enhance guest experiences.

## Overview

LuxeHotel is a modern hotel management solution that helps hotel staff manage reservations, room assignments, guest services, and more. The system is built with a focus on user experience, efficiency, and reliability.

## Features

- Room Management

  - Room inventory tracking
  - Room status monitoring
  - Room type categorization
  - Maintenance scheduling

- Reservation System

  - Online booking
  - Reservation management
  - Guest information tracking
  - Booking history

- Guest Services
  - Check-in/Check-out management
  - Guest profile management
  - Special requests handling
  - Loyalty program integration

## Getting Started

### Installation

1. Clone the repository:

```bash
https://github.com/Salesforce-Developer9/Roomie-Agent.git
```

## Contributing

We welcome contributions to LuxeHotel! Please read our contributing guidelines before submitting pull requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

# For All Orgs

```
{
  "servers": {
    "salesforce": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@salesforce/mcp",
        "--orgs",
        "ALLOW_ALL_ORGS",
        "--toolsets",
        "all"
      ]
    }
  }
}

```

# For Specific Org

```
{
  "servers": {
    "salesforce": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@salesforce/mcp",
        "--orgs",
        "DEFAULT_TARGET_ORG",
        "--toolsets",
        "all"
      ]
    }
  }
}

```
