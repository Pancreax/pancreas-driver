# Pancreas Driver

This is a project of a loadable linux kernel module made for study purposes.
I've took by reference this [video](https://www.youtube.com/watch?v=CWihl19mJig) by the Engineer Man youtube channel.

## Compiling

To compile this module, type the following command on a terminal:

    make

## Signing the module

Based on [this](https://gist.github.com/gabrieljcs/68939c7eeadfabfdbc6b40100130270d). I think this is necessary only if your computer has secure boot enabled.

**Creating signing keys** - Need to do it only one time

The steps 1 to 4 will create the files ~/MOK.der and ~/MOK.priv that we will use every time we want to sign a module.

1: Create signing keys

    openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=Descriptive common name/"

2: Register the keys to Secure Boot

    sudo mokutil --import MOK.der

which will ask for a password to use to confirm the import in the next step.

3: Reboot and follow instructions to Enroll MOK (Machine Owner Key). [Here](https://sourceware.org/systemtap/wiki/SecureBoot) is a sample with pictures. The system will reboot one more time.

4: Confirm the key is enrolled

    mokutil --test-key MOK.der

**Signing the module** - Need to do every time the module is recompiled

Once you already have the ~/MOK.der and ~/MOK.priv files,  type the following command in the terminal:

    sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der /path/to/module.ko

## loading and removing the module

To load the module, type the following command in the terminal:

    sudo insmod pancreas.ko

This will also append the text "Hi! Pancreas is loaded!" in the file /var/log/syslog.
To remove the module, type in the terminal:

    sudo rmmod pancreas

This will also append the text "Bye! Pancreas is gone!" in the file /var/log/syslog.