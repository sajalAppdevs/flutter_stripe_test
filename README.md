# Flutter Stripe Test

A Flutter application demonstrating integration with Stripe and Razorpay payment gateways. This project serves as a template for implementing secure payment processing in Flutter applications.

## Features

- Stripe payment integration
- Razorpay payment integration
- Environment variable configuration
- Toast notifications for payment status
- Material Design UI components

## Prerequisites

Before you begin, ensure you have the following installed:
- [Flutter](https://flutter.dev/docs/get-started/install) (SDK version >=3.2.5 <4.0.0)
- [Dart](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- A Stripe account for API keys
- A Razorpay account for API keys

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/flutter_stripe_test.git
   cd flutter_stripe_test
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Create a `.env` file in the assets folder with your API keys:
   ```env
   STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key
   STRIPE_SECRET_KEY=your_stripe_secret_key
   RAZORPAY_KEY_ID=your_razorpay_key_id
   RAZORPAY_KEY_SECRET=your_razorpay_key_secret
   ```

4. Run the application:
   ```bash
   flutter run
   ```

## Dependencies

- flutter_stripe: ^11.1.0 - For Stripe payment integration
- razorpay_flutter: ^1.3.6 - For Razorpay payment integration
- flutter_dotenv: ^5.1.0 - For environment variable management
- fluttertoast: ^8.2.4 - For toast notifications
- http: ^1.2.0 - For making HTTP requests

## Project Structure

```
flutter_stripe_test/
├── lib/
│   ├── main.dart
│   └── ...
├── assets/
│   └── .env
├── android/
├── ios/
└── test/
```

## Testing

Run the tests using:
```bash
flutter test
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Flutter Documentation](https://docs.flutter.dev/)
- [Stripe Flutter Documentation](https://stripe.com/docs/stripe-react-native)
- [Razorpay Documentation](https://razorpay.com/docs/)
