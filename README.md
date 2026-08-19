# SmartMed by Yuliia Zhuravel

A Flutter-based healthcare application for doctor discovery, appointment booking, and visit management.

The project demonstrates production-oriented Flutter development practices with a focus on scalable architecture, maintainable code, reusable UI components, responsive layouts, predictable state management, and automated testing.

## Features

* Doctor discovery and search
* Medical specialty browsing
* Doctor information
* Appointment booking and management
* Upcoming appointments
* Visit history
* Payment management
* User account and profile
* Responsive UI
* Reusable UI components
* Structured navigation
* Automated testing

## Screenshots

### Onboarding Screen

<img width="300" alt="OnBoarding" src="https://github.com/user-attachments/assets/44661305-2696-4596-99da-fbac9cb1f6bd" />


### Home Screen

<img width="300" alt="Home" src="https://github.com/user-attachments/assets/10cbe9b1-f531-4322-b0c1-97391e4eb6d2" />


### Doctor Search Screen

<img width="300" alt="Doctor search screen" src="https://github.com/user-attachments/assets/e5cdd34f-6f5f-4cec-8bbc-8dc1c75160b7" />


### Appointment Screen

<img width="300" alt="Appointment screen" src="https://github.com/user-attachments/assets/9353f8d3-1939-4c65-b5c2-70f3d451f4b3" />


### Visit History Screen

<img width="300" alt="Visit history screen" src="https://github.com/user-attachments/assets/9a85de10-3ac1-4d93-adf4-0366eb7dda96" />


### Account Screen

<img width="300" alt="Account screen" src="https://github.com/user-attachments/assets/48151dfe-f481-46da-9603-c1d9a6518ff8" />


### Payment Screen

<img width="300" alt="Payment screen" src="https://github.com/user-attachments/assets/78f554df-b4e2-4e8a-beb0-dc01417a2c95" />



## Tech Stack

* **Modular Architecture** — separation into independent packages/modules
* **Flutter / Dart**
* **BLoC & Cubit** — state management
* **GetIt** — dependency injection
* **Beamer** — navigation
* **Repository Pattern** — data access abstraction
* **bloc_test** — BLoC testing

## Architecture

The application follows a layered architecture with clear separation of responsibilities:

```text
lib/
├── domain/
│   ├── entities/
│   ├── irepositories/
│   ├── iservices/
│   └── ...
│
├── infra/
│   ├── data/
│   ├── helpers/
│   ├── initializations/
│   ├── services/
│   └── ...
│
├── presentation/
│   ├── blocs/
│   ├── cubits/
│   ├── navigation/
│   ├── views/
│   └── ...
│
├── app.dart
└── main.dart
```

The architecture is designed to keep business logic, data access, and presentation concerns separated while allowing individual layers to evolve independently.

## State Management

The project uses **BLoC and Cubit** for predictable and testable state management.

BLoC is used for feature-level business logic and event-driven state transitions, while Cubit is used for simpler state management scenarios.

## Dependency Injection

**GetIt** is used for dependency injection and centralized dependency registration.

This helps reduce coupling between components and makes application services and repositories easier to test and replace.

## Testing

The project includes automated tests for presentation-layer logic, including BLoC state transitions and repository interactions.

Testing tools include:

* `flutter_test`
* `bloc_test`
* fake repository implementations

## Project Structure

The project follows a modular architecture managed with **Melos**, allowing the application to be split into independent and reusable packages.

The main application is organized around three layers:

* **Domain** — application entities and abstractions
* **Infrastructure** — data, services, mocks, and initialization
* **Presentation** — UI, state management, navigation, and configuration

This structure provides clear separation of responsibilities and makes individual modules easier to maintain, test, and extend.

### Prerequisites

* Flutter SDK
* Dart SDK
* Android Studio or Xcode

## Project Highlights

* Modular project structure managed with Melos
* Independent and reusable packages
* Scalable Flutter architecture
* BLoC/Cubit state management
* Dependency injection with GetIt
* Repository-based data access
* Reusable and modular UI components
* Responsive layouts
* Structured navigation
* Automated testing
* Production-oriented development practices

## Design Credits

The UI design was adapted from an existing design concept - [design source](https://www.behance.net/gallery/231465463/Orionix-Modern-Surgery-Mobile-App-UIUX-Design).
  

## Author 

**Yuliia Zhuravel**

Mobile Developer (Android, Flutter). 
