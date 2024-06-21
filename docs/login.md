# Getting access to Ginsburg

Ask Marko to fill out a form which requests access to the Ginsburg HPC. The link for this form can be found [here](https://www.cuit.columbia.edu/shared-research-computing-facility). At the time of writing this the link says "If you are interested in free HPC access, please submit a request form". Marko needs to submit this form with a short statement about what you plan to do on Ginsburg.

# How to log into Ginsburg - Basic (All Platforms)

Assuming you have access, type the following to log in from your terminal (e.g. the `Terminal` app on MacOS or `Git Bash` on Windows):

```bash
ssh <UNI>@ginsburg.rcs.columbia.edu
```

Once you type this, you'll be prompted to enter your password. In the future this may require a 2-factor authentication like Duo. When typing or copying in your password, the terminal application you're using may not display the text as you're typing or copying.

# How to log into Ginsburg - Advanced (MacOS)

If you log into Ginsburg frequently, typing in your password each time can be annoying. We can address this by creating a cryptographic, public-private key pair known as an SSH key. This SSH key can be placed in a specific location on your computer and on Ginsburg to allow password-less access in a secure way. I'll defer to the GitHub instructions located [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=mac). I'll specifically go through the MacOS instructions since that's the most common platform used by members of the lab. Feel free to contribute a Windows or Linux specific section.

## Create an SSH key

Type the following into your terminal on your computer (i.e. not Ginsburg):

```bash
ssh-keygen -t ed25519 -C "<EMAIL>"
```

Replace `<EMAIL>` with your email. This is not being used for GitHub so the specific email doesn't really matter. You'll be prompted for a name for the file and its location and a passphrase. If this is the only key pair you're making, just hit enter to use the defaults (`~/.ssh/id_ed25519` for the file + location and an empty passphrase). If you choose a different name, you will need to use the `-i` option when logging into Ginsburg. If you choose a non-empty passphrase, you'll have to type that each time you use log into Ginsburg. Logging in is secure even without a passphrase, but having a passphrase adds to the security of the login process.

## Add SSH Key to SSH agent

Run the following to add the key you made to the SSH agent:

```bash
eval "$(ssh-agent -s)"
```

## Place the public key in Ginsburg

Run this command on your computer (i.e. not on Ginsburg) to copy the public part of the key pair you made onto Ginsburg.

```
scp ~/.ssh/id_ed25519.pub <UNI>@ginsburg.rcs.columbia.edu:~/.ssh/
```

If you chose a different name or path for your SSH key, replace `~/.ssh/id_ed25519.pub` with that path. It would look something like this:

```
scp <PATH_TO_SSH_KEY> <UNI>@ginsburg.rcs.columbia.edu:~/.ssh/
```

This will place the public SSH key in the correct location for Ginsburg to search when you log in. This step will still require a password and potentially 2-factor authentication.

## Test the results

Type the following to log in as you normally would from your terminal (e.g. the `Terminal` app on MacOS or `Git Bash` on Windows):

```bash
ssh <UNI>@ginsburg.rcs.columbia.edu
```

If you chose a different name or path for your key, type the following:

```bash
ssh -i <PATH_TO_SSH_KEY> <UNI>@ginsburg.rcs.columbia.edu:~/.ssh/
```
