### Technical Elements

1. **Asynchronous Programming with `async/await`:**
   - **Description:** For handling asynchronous operations like network requests, I leveraged Swift’s `async` and `await`.
   - **Benefit:** This modern approach not only enhances code readability and maintainability but also helps avoid callback hell.

2. **State Management with `ObservableObject`, `@State` and `@Published`:**
   - **Description:** I utilised `ObservableObject` and `@Published` properties to manage state and automatically update the UI whenever the data changes.
   - **Benefit:** This ensures the UI remains consistent with the data model without requiring manual updates.

3. **Protocol-Oriented Network Layer:**
   - **Description:** The network operations are defined using a `NetworkProtocol`, with `NetworkService` conforming to this protocol.
   - **Benefit:** This abstraction allows me to easily swap out network service implementations, which is particularly useful for testing and enhancing flexibility.

4. **Dependency Injection:**
   - **Description:** Both `DetailViewModel` and `HomeViewModel` accept a network service instance via their initialisers.
   - **Benefit:** This approach enhances testability by allowing me to inject different network service implementations (e.g., mock services for unit testing).

5. **Singleton Pattern for Network Service:**
   - **Description:** I implemented the `NetworkService` as a singleton to ensure a single instance handles all network operations across the app.
   - **Benefit:** This reduces resource consumption and potential conflicts by preventing the creation of multiple instances.

6. **JSON Decoding with Key Decoding Strategy:**
   - **Description:** I used `JSONDecoder` with `keyDecodingStrategy` set to `.convertFromSnakeCase` to seamlessly map JSON keys to Swift property names.
   - **Benefit:** This simplifies JSON parsing and reduces boilerplate code, making the code more readable and maintainable.

7 **Error Handling with Custom Errors:**
   - **Description:** I implemented structured error handling using `do-catch` blocks and custom error types (`NetworkError`).
   - **Benefit:** This improves error reporting and debugging, providing clear insights into network failures and decoding issues.

8. **Unit Testing with Mock Services:**
   - **Description:** I wrote unit tests for view models using mock network services to simulate network responses.
   - **Benefit:** This ensures the reliability and correctness of the code by verifying functionality in isolation, which is crucial for maintaining a robust app.

9. **Filtering and Sorting:**
    - **Description:** The `HomeViewModel` includes functionality to filter and sort the list of Pokémon based on user input for search text and selected sorting order.
    - **Benefit:** This feature enhances the user experience by allowing users to easily find and organise Pokémon according to their preferences.




### Still to do/improvments

1. **More unit tests**
2. **UI Testing**
3. **Accessibility**
4. **Greater device support**
5. **Lazy loading of Pokemon**
6. **Local persistence with SwiftData (I did spend about 3 hours trying to get this working!!!!!!!!! :( ) **
