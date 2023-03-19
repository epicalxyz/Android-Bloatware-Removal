# Android Bloatware Removal

## Disclaimer: Please use these instructions at your own risk. I am not responsible for any consequences that may arise from following these instructions.

# Option 1:

### Using a GUI based tool: https://github.com/0x192/universal-android-debloater

"Cross-platform GUI written in Rust using ADB to debloat non-rooted android devices."

I have not tried it myself, but it appears to be an active project with recent development.

# Option 2:

### Terminal based, simple and probably universal method:

These instructions are standard enough that they will likely work with other brand/models, as long as the Android version is not too old. However, please note that the package names may differ between brands/models, so it is important to research the packages you intend to remove before proceeding. The backup and removal process, however, should remain the same.

# Requirements:

### Install ADB Tools

On Linux (Debian / Ubuntu)

```
sudo apt install android-sdk-platform-tools
```

### Prepare the Phone

- Connect the phone to the computer via cable
- Enable Developer Options from the About Phone option
- Go to Advanced Options > Developer Options and activate USB Debugging
- Log out of Google / Xiaomi accounts

Now open a terminal windows and type:

```
adb devices
```

A window should appear on the phone requesting permission. Press "OK" to grant yourself permission to access the phone.

# Start with the backups

## **I recommend performing both backup methods to ensure that your data is safe.**

## 1st Backup Method

We will begin by creating a full package backup. However, please note that this backup will not include system apps. To back up system apps, we will need to follow an additional step.

```
adb backup -f "backup.ab" -all -apk -nosystem
```

You will be prompted again to grant permission to back up your phone. Please confirm by selecting "OK".

When backing up your phone, we will use the "-nosystem" flag to exclude system apps. It is recommended to avoid restoring a backup that includes system apps, as this can lead to stability issues.

In the next step, we will backup all apps individually, including system apps. If you need to replace a package, please use these backups.

## 2nd Backup Method

The script "backup_packages.sh" will backup individual packages. You can find it in the repository file list. Download the script and run it inside the folder where you want to store your backups.

Once executed, the script will create a file named "package_list.txt" which will list all the packages found on your phone. For me, it listed around 300 packages.

The script will then start backing up all those packages and will prompt you for permission to do so. Since it requires backing up each package individually, you may need to press a button approximately 300 times to complete the backup of all packages to your computer/laptop.

```
bash backup_packages.sh
```

I understand that the backup process may be tedious, and it is possible to automate it. However, by providing step-by-step instructions, it reduces the likelihood of errors occurring and allows for a better understanding of the backup process.

# Check what can be removed

I am developing my own list for the Mi 8 Lite (Platina) or Redmi Note 7 (Lavender). I believe anyone with these devices can follow the same steps and achieve similar results. You can check inside the "device_list" for a list of devices and the packages that were removed from each one.

You are free to remove more or fewer packages depending on what you wish to achieve. However, it is important to research each package before removing it to ensure it is safe to do so. In the event that something goes wrong, you can always factory reset your phone to restore it to its original state. However, we want to avoid this as much as possible. By using our lists, you will have a head start on which packages are safe to remove.

# Lists

List for devices with /e/OS installed. This is a universial list, you shoud have this same apps on any brand/model but still make sure you know what you want to remove from your phone.

Lists for devices with Xiaomi OS installed:

- Mi 9 (Cepheus) list [here](https://gist.github.com/enkeys/ba8c84da1d507605254b4025cfc219bc)
- Mi 8 Lite (Platina)
- Redmi Note 7 (Lavender)

# Deactivate/Remove a package:

To just deactivate an app:

```
pm disable-user --user 0 <package_name>
```

Just change <package_name> with the name of the package.

Example:

```
pm disable-user --user 0 com.facebook.system
```

### Uninstall is unsafer in case you make a mistake and remove an app that creates an issue in your device, make sure you have backed up all apps first.

To completely uninstall an app:

```
pm uninstall -k --user 0 <package_name>
```

Just change <package_name> with the name of the package.

Example:

```
pm uninstall -k --user 0 com.facebook.system
```

# Great!

We encourage everyone to participate and share their methods so that others can benefit as well. Let's work together to make our phones bloat-free,optimize their performance and privacy.
