# User Details App

This application demonstrates user details management with features including Store Payment Data in wallet with persistence using Sqflite. The app is designed with a responsive UI and implements Bloc architecture with Flutter Bloc for state management.
<p align="center">
  <img src="https://github.com/user-attachments/assets/c160998b-e900-46f9-b0a1-1eba0a448a06" width="30%" style="margin-right: 16px;" />
  <img src="https://github.com/user-attachments/assets/96df1c7f-ccda-4257-ae24-e916c8aba9af" width="30%" style="margin-right: 16px;" />
  <img src="https://github.com/user-attachments/assets/84315fb2-d7bc-458d-9982-cda3aa5a114c" width="30%" />
</p>



## Features

1. **Login**:
   - User Login And Register With Data Persistance.
2. **Fetch User Details**:
   - Retrieves user details from an API and displays them in a `ListView`.
3. **Add Payment**:
   - Add Form for data input.
4. **Responsive Design**:
   - Ensures a user-friendly design that adapts to various screen sizes.

## Architecture

- **Bloc Architecture**:
  - Bloc pattern for clean separation of concerns.
- **State Management**:
  - Utilizes Bloc for efficient state management and navigation.

## Permissions

- Write Permission
- Read Permission

## Setup Instructions

### Prerequisites

1. **Flutter SDK**: Ensure Flutter is installed on your system. [Install Flutter](https://flutter.dev/docs/get-started/install)
2. **API Endpoint**: Replace the placeholder in the `ApiService` with your actual API URL.
3. **Emulator/Device**: Ensure you have a connected device or emulator with the required permissions enabled.

### Installation

1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```
2. Navigate to the project directory:
   ```bash
   cd user_details_app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Generate required files for Hive (if using):
   ```bash
   flutter packages pub run build_runner build
   ```
5. Run the app:
   ```bash
   flutter run
   ```


### Responsive Design

- The app adapts seamlessly to different screen sizes and orientations.

## Dependencies

- **Bloc**: State management and navigation.
- **Sqflite**: Local storage for uploaded images.
- **Permission Handler**: Managing app permissions.
- **Intl**: For accessing the gallery and camera.

## Troubleshooting

1. **Permission Issues**:
   - Ensure all required permissions are granted.
   - Use the app settings to manually enable permissions if needed.

2. **API Connectivity**:
   - Check the API endpoint configuration in the `ApiService`.
   - Verify network connectivity.

3. **Storage Persistence**:
   - Ensure Hive/Sqflite is configured correctly.
   - Rebuild the project if necessary after any storage-related changes:
     ```bash
     flutter clean && flutter pub get
     ```

## Contributions

Feel free to fork the repository and submit pull requests for improvements or feature additions.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

