# google-oauth2-motion

Authenticate to Google using OAUTH2 in your RubyMotion app.

![Screenshot](https://raw.github.com/aceofspades/google-oauth2-motion/master/screen_shot.png)

This project integrates Google open-source iOS libraries to connect your app to the plethora of services Google
offers.

## References

* http://code.google.com/p/google-api-objectivec-client/
* http://code.google.com/p/gtm-oauth2/wiki/Introduction

## Installation

1. Register your application <http://code.google.com/p/gtm-oauth2/wiki/Introduction#Registering_Your_Application>
1. Check out the source `git clone git@github.com:aceofspades/google-oauth2-motion.git`
1. `cd google-oauth2-motion`
1. `git submodule update --init`
1. Implement the bridgesupport fix under Known Issues
1. In app/controllers/main_controller.rb, fill in your Client ID and Client Secret from the previous step
1. Build and run the app `rake`

If you see `Error: invalid_client` then may not have properly registered/configured your Client ID and Secret.

## Known Issues

I have not been able to determine why this fresh build produces the following error:

  `Objective-C stub for message 'authForGoogleFromKeychainForName:clientID:clientSecret:' type '@@:@@@' not precompiled. Make sure you properly link with the framework or library that defines this message.`

Installing a good copy of the bridge support file for the goole api addresses this:

  `cp Source.bridgesupport-for-google-api-objectivec-client vendor/google-api-objectivec-client/Source/Source.bridgesupport`

If anyone has a solution, please file an issue.
