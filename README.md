#Snapgrid

## Objective
SnapGrid is a Flutter application that allows users to browse and view photos in a grid layout. It leverages the Splash Photo API to fetch and display photos with their titles. Users can scroll through the grid, tap on a photo to view it in full screen, and see additional details like the description and author.




## Flutter Setup and Dependencies

To set up and run the Snapgrid App on your local machine, follow these steps:

1. Ensure you have Flutter and Dart SDK installed. If not, refer to the official Flutter documentation to install the Flutter SDK for your operating system. [Flutter documentation](https://flutter.dev/docs/get-started/install).

2. Clone the repository to your local machine using the following command to clone the the SnapGrid repository:

```bash
git clone https://github.com/Raks-Javac/SnapGrid.git
```

3. Navigate to the project directory 

```cd SnapGrid
```

4.  After cloning navigate to the project directory, fetch the required dependencies by running using 

```
flutter pub get 
```

5. Set up any necessary configuration files, such as API keys or environment variables. Refer to the provided documentation or contact the development team for more details.

6. Launch the app on your preferred emulator or connected device using the following command:


```
flutter run 
```




## Code Structure

The codebase of the Snapgrid App is structured as follows:

- `/core`: Contains the core components and utilities of the application.
  - `/storage`: Handles storage-related functionality.
  - `/network`: Manages network-related operations.
  - `/utils`: Houses utility functions and helper classes.
  - `/extensions`: Contains extension functions with names ending in "Extensions".
  - Other helper functions: Additional helper functions used throughout the app.

- `/app_locator`: Contains the main app folder and its dependencies.
  - Main app class: Contains the entry point of the application.

- `/features`: Contains individual features of the app, organized into subfolders.
  - `/views`: Holds the view components related to each feature.
  - `/provider`: Contains the controllers or presenters associated with each feature.
  - `/repository`: Manages data retrieval and manipulation for each feature.
  - Feature main `/widgets`: Contains reusable widgets specific to each feature.

- `/shared`: Contains shared resources and widgets.
  - `/resources`: Houses assets, colors, typography, and theme-related files.
  - `/widgets`: Contains reusable widgets used throughout the app.
    - Widget naming convention: Widgets are prefixed with "SgWidgets".

## Contributing as a team member

We welcome contributions to the Snapgrid Merchant App. To contribute, please follow these guidelines:

1. Fork the repository and create a new branch for your changes


2. Implement your changes, ensuring adherence to the established code style and guidelines.


3. Commit your changes with descriptive commit messages e.g "git commit -m "Add feature: Description of your changes" "


4. Push to your branch 



5. Open a pull request against the /dev branch in the repository, clearly describing the changes made and their purpose and the lead developer would pick it up from there.


