# Xiaomi Bloatware Removal

## Disclaimer: Use this instructions at your own risk. I am not responsible for anything that can happen as a result of following this instructions.

# Option 1:

### Using a graphical interface: https://github.com/Szaki/XiaomiADBFastbootTools

This option is great for who just wants to get it done and don't like to tinker with the terminal.

# Option 2:

### Using a more complete tool but terminal based: https://gitlab.com/W1nst0n/universal-android-debloater

This option is heavy on the terminal, requires more understanding of how the tool works.

# Option 3:

### Terminal based, simple and probably universal method:

These instructions are standard enough that will probably work with any other brand/model if the Android version is not too old. Just the packages name are different from brand/model, but the backup and removal process is the same.

# What you will need

### Install ADB Tools

On Linux (Debian / Ubuntu)

```
sudo apt install android-sdk-platform-tools
```

### Prepare the Phone

- Connect the phone to the computer via cable
- Enable Developer Options from the About Phone option
- Go to Advanced Options > Developer Options and activate USB Debugging.
- Log out of Google / Xiaomi accounts.

Now open a terminal windows and type:

```
adb devices
```

A window should pop up on the phone requesting permission, press OK to give yourself permission to access the phone.

# Start with the backups

**I recommend you do both methods!**

## 1st Backup Method

We will start by creating a full package backup, this backup will not include system apps, for that we will have another step.

```
adb backup -f "backup.ab" -all -apk -nosystem
```

Will ask again for permission to backup your phone, confirm.

We use -nosystem flag to avoid backing up system apps because restoring this backup including the system apps allegedly can cause instability issues.

In the next step we will backup all apps, this time one by one, including system apps. If you need to replace a package do it with these.

## 2nd Backup Method

This script (backup_packages.sh) will backup individual packages.
You can find it on the repo file list, download it and run it inside the folder where you want to store your backups.

It will create a file named package_list.txt and paste all packages name found on your phone, for me was ~300 packages.

Then will start the backup of all those packages, and for that will request permission. It will require one by one, so for me I had to press a button ~300 times so it could backup all packages.

```
bash backup_packages.sh
```

This is boring, could be automated but when i find other people massive scripts i get a bit worried so i prefer to have it as simple and step by step as possible.

# Check what can be removed

I'm developing my own list for **Mi 8 Lite** aka **Platina** or for **Redmi Note 7** aka **Lavender**, i guess anyone with this devices can follow the same exact steps and will have similar results as me, you can check inside **device_list** for the lists of devices and what packages where removed on each one.

Feel free to remove more or less depending on what you wish to archive. Just remember to search about each package you wish to remove, if its "safe" or not. I mean if something goes wrong you can just factory reset the phone and have it all back but lets avoid that as much as possible. Using our lists you will have a head start on what was/is safe to remove.

Lists:

- Mi 9 (Cepheus) miui_bloatware_list from:
  (https://gist.github.com/enkeys/ba8c84da1d507605254b4025cfc219bc)
- Mi 8 Lite (Platina)
- Redmi Note 7 (Lavender)

If you create your list feel free to make a pull request to add your list with a link here and add the list to the folder **device_list**.

# Now removing packages

### Enter shell with the command:

```
adb shell
```

### Remove a package:

```
pm uninstall -k --user 0 <package_name>
```

Just change <package_name> with the name of the package.

Example:

```
pm uninstall -k --user 0 com.facebook.system
```

# Profit!

Feel free to participate and make your methods public so others can also benefit from your time and we all can use our phones like they where supposed to be, bloat free.
