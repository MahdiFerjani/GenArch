# GenArch

GenArch is a command-line utility designed to facilitate Flutter developers by automating the creation of a directory structure adhering to a specific architectural pattern. By using GenArch, developers can easily scaffold the necessary folders and files needed for a specific feature in a Flutter project.

## Features

- **Automated Directory Creation**: No need to manually create directories for your Flutter feature. With GenArch, the structure is set up with a single command.
- **Flutter Project Verification**: GenArch ensures you are in the root directory of a Flutter project before proceeding.
- **Easy to Use**: Just a single command with the feature's name, and you're good to go!

## Directory Structure

GenArch generates a directory structure adhering to a specific architectural pattern for your Flutter features. The structure is organized as follows:
`
<feature_name>
├── data
│ ├── data_sources
│ ├── models
│ └── repositories
├── domain
│ ├── entities
│ ├── repositories
│ └── use_cases
└── presentation
├── bloc
├── pages
└── widgets ` 
Each directory serves a specific purpose in your Flutter project's feature development.

- **`data`**: Contains data-related components like data sources, models, and repositories.
- **`domain`**: Focuses on the core business logic, including entities, repositories, and use cases.
- **`presentation`**: Handles the user interface with bloc logic, pages, and reusable widgets.

## Environment Variables

Before using GenArch, ensure that your system's PATH environment variable includes the Dart SDK's `bin` directory. You can add the following path to your PATH environment variable:

`%USERPROFILE%\AppData\Local\Pub\Cache\bin`


## Installation

1. Install `genarch` from pub.dev or your preferred package manager.
2. Make sure the Dart SDK's bin directory is in your system's PATH.

## Usage

1. Navigate to your Flutter project directory.
2. Run the following command:

```bash
genarch <feature_name>
