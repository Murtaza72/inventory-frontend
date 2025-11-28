# Flutter Frontend for Inventory Management

## Setup Instruction

1. Clone this repo to your local machine, ensure the flutter is installed and configured properly. Refer [here](https://flutter.dev/).
2. `flutter pub get`
3. `flutter build apk --dart-define=API_URL=IP_ADDR:3000`
4. `IP_ADDR` is the localhost ip addr of your machine and can be found on windows by running `ipconfig` in `cmd`

The apk that I have provided is the release build, but it might not work as intended because my local ip was use while building the apk.

## Comments

I have tried implementing the frontend to the best of my knowledge and then some, but due to the time constraints and difficulties with the shared_prefrences library, I was not able to completely integrate the frontend with the backend.

Therefore these things may not work or reflect onto the database:

1. Adding or editing the product
2. Adding the order
3. Validation errors generated when performing above actions
4. User Authentication
