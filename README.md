# Xiaomi Bloatware Removal

## Disclaimer: Use this instructions at your own risk. I am not responsible for anything that can happen as a result of following this instructions.

This is how to remove Bloatware from Xiaomi phones, i have tried other methods like [Universal Android Debloater](https://gitlab.com/W1nst0n/universal-android-debloater), but i was having alot of issues with it so i did something more simple that acomplish the objective.

These instructions are standard enough that will probably work with any other brand/model if the Android version is not too old. Just the packages name are different from brand/model, but the backup and removal process is the same.

- Tested with Android 10

If you do it with other version of Android let me know.

# What you will need

### Install ADB Tools

On Linux (Debian / Ubuntu)

```
sudo apt install android-sdk-platform-tools
```

# Start with the backups

**I recommend you do both methods!**

## 1st Backup Method

We will start by creating a full package backup, this backup will not include system apps, for that we will have another step.

```
adb backup -f "backup.ab" -all -apk -nosystem
```

We use -nosystem flag to avoid backing up system apps because restoring this backup including the system apps allegedly can cause instability issues.

In the next step we will backup all apps, this time one by one, including system apps. If you need to replace a package do it with these.

## 2nd Backup Method

This script will backup individual packages.

It will create a file named package_list.txt and paste all packages name found on your phone, for me was ~300 packages.

Then will start the backup of all those packages, and for that will request permission. It will require one by one, so for me I had to press a button ~300 times so it could backup all packages.

```
bash backup_packages.sh
```

# Check what can be removed

I'm developing my own list for **Mi 8 Lite** aka **Platina**, i guess anyone with this device can use and will have similar results as me, you can check it inside the folder **device_list**.

Lists:

- Mi 9 (Cepheus) miui_bloatware_list from:
  (https://gist.github.com/enkeys/ba8c84da1d507605254b4025cfc219bc)
- Mi 8 Lite (Platina)

If you create your list feel free to make a pull request add your list with a link here or add it inside the folder **device_list**

# Now removing packages

Enter shell with the command:

```
adb shell
```

Remove a package:

```
pm uninstall -k --user 0 <package_name>
```

Just change <package_name> with the name of the package.

Example:

```
pm uninstall -k --user 0 com.facebook.system
```

# Profit!

Feel free to participate and make your methods public so others can also benefit from your time and we all can use our phones like they where suposed to be, clean of apps we dont use.
