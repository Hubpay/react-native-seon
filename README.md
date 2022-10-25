# react-native-seon

Seon SDK for React Native

Based on the publicly available native SDKs from [SEON Fraud API](https://docs.seon.io/api-reference#fraud-api):

- [Android](https://github.com/seontechnologies/seon-android-sdk-public)
- [iOS](https://github.com/seontechnologies/seon-ios-sdk-public)

## Installation

```sh
yarn add hubpay/react-native-seon#vX.X.X
```

## Usage

```js
import Seon from 'react-native-seon';

// Optional configuration
await Seon.setSessionId('CUSTOM_SESSION_ID');
await Seon.setLoggingEnabled(true /* or false */);

// Compute device fingerprint
const fingerprint = await RNSeon.getFingerprintBase64();
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
