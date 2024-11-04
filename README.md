# Car Rental App

## Project Description
This project is a cross-platform mobile application developed in Flutter developed as part of the MSE800 Software Engineering course at Yoobee College. This app offers a user-friendly interface, real-time booking, and secure data management, designed to meet the modern demands of users and enhance the client’s competitive edge in the car rental market.

## Features
- User Registration & Authentication: Secure login and registration with future OAuth2 integration for added security.
- Car Search & Booking: Browse available cars, filter by location and date, and book with ease.
- User Profile Management: Manage user information and view booking history.
- Scalability & Microservice Architecture: A backend designed for scalability using Spring Boot microservices.

## Tech Stack
- Frontend: Flutter
- Backend: Spring Boot (Microservices)
- Database: MySQL (Primary RDBMS), Redis (Caching)
- Containerization: Docker for managing and deploying microservices
- Version Control: Git

## Getting Started

Follow these instructions to set up and run the project locally.

### Prerequisitesx
- Flutter: [Install Flutter](https://docs.flutter.dev/get-started/install?gad_source=1&gclid=Cj0KCQjw1Yy5BhD-ARIsAI0RbXZyD93XJx-PqqjwAdGbW2mRWcyTXKcxarjeQ_rPF0ufLURAwDkfuu8aAjAaEALw_wcB&gclsrc=aw.ds)
- Android Studio/Xcode: For running on Android/iOS emulators
- Docker: To run backend services as containers (if using Docker)

### Installation
1. Clone the Repository
```
git clone https://github.com/junwchoi85/car_rental_app.git
```

2. Install Dependencies
```
flutter pub get
```

3. Set Up the Backend
- For detailed backend setup, see the [Backend Repository](https://github.com/junwchoi85/car_rental_microservices.git).

4. Run the App
```
flutter run
```

## Credit

We would like to acknowledge the following individuals for their contributions to this project:
- [Jun Hwan Choi] : Software Architect, Developer

## Contributing

Contributions are welcome! Please fork the repository and create a pull request to contribute.

## License

MIT License

Copyright (c) 2024 Jun Hwan Choi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
