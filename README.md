# ToDo CheckMate - iOS App

A simple **iOS ToDo app** built with **SwiftUI** that interacts with a NestJS + MongoDB backend for user authentication and todo management.

---

## Features

- User **Sign Up** with email and password  
- User **Login**  
- Navigate to **Home Page** after successful login  
- Real-time **feedback messages** for errors or success  
- Loading indicators during network calls  
- Modular architecture with **MVVM pattern** (`ViewModel` handles API calls)  

> Note: Currently, this project handles only **authentication flow**. ToDo CRUD operations can be integrated in the HomePage later.

---

## Technologies Used

- **SwiftUI** — For declarative UI and navigation  
- **MVVM Pattern** — For separation of UI and business logic  
- **Async/Await Networking** — Using `URLSession` for API calls  
- **Codable** — For parsing JSON request and response  
- **Haptics** — For error notifications (`UINotificationFeedbackGenerator`)  

---

## Configuration

Before running the app, make sure your **backend API** is running and accessible at the URLs used in the ViewModel:  

```text
Signup URL: http://localhost:4000/auth/signup
Login URL:  http://localhost:4000/auth/login
```
Replace ```localhost``` with your backend server address if testing on a real device or simulator on another machine.

## Running the App

1. Open `ToDo.xcodeproj` or `ToDo.xcworkspace` in Xcode.  
2. Ensure the **iOS target** matches your simulator or device.  
3. Run the app by pressing **Cmd + R**.  
4. Test the **signup** and **login** flows.  
5. Make sure the **NestJS backend** is running on the correct port.
