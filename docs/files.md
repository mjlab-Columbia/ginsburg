There are 3 ways to move files between your computer and Ginsburg. Those are: Globus, `scp`, and `rsync`. Each has its tradeoffs so use whatever fits your needs.

# Globus

Globus is the easiest way to transfer individual files into and out of Ginsburg. Globus is a web-based tool to see and transfer files from your local computer to Ginsburg and vice versa. To use Globus:

1. Navigate to (Globus)[https://auth.globus.org] and click "Log In" in the top right corner. 
2. In the "Use your existing organizational login" section, enter "Columbia University" and click Continue. 
3. Login with your UNI information and do 2-factor authentication if required. 
4. You'll be asked to accept some data sharing terms with Globus. You can select whether you want to be asked each time or agree to share for every subsequent login. Click "Accept" in the bottom to continue. 
5. At the top, you'll see a search bar with "Collection" written to the left of the search bar. Type "Columbia Ginsburg" and it should be the first entry. If you're unsure about the collection, look for this id: `dc2e4d79-8ccc-4adf-a26e-e13f05862b67`
6. From here you'll see the `/burg` directory (even though the "Path" text field says `/`). Navigate to `mjlab/` to find our lab's directory.
7. You can download a file by selecting the checkbox and then clicking the download button on the right side of the screen. You can also upload to the folder you're currently in by clicking upload on the right side.

Note that Globus only lets you download and upload individual files, not directories/folders. A way around this is to use `tar` to create an archive file from a directory, upload/download that, and then extract the `tar` file on your computer or on Ginsburg (depending on the direction of transfer).

# `scp`

Secure copy (`scp`) is an analog of the copy command (`cp`). To transfer from your computer to a location on Ginsburg:

```bash
scp <LOCAL_FILE_PATH> <UNI>@ginsburg.rcs.columbia.edu:<REMOTE_FILE_PATH>
```

For example, if you want to transfer a file called `table.csv` located in your home directory (`~`) to `/burg/mjlab/projects` you would type:

```bash
scp ~/table.csv <UNI>@ginsburg.rcs.columbia.edu:/burg/mjlab/projects/
```

Conversely, if you want to transfer a file from Ginsburg to your computer:

```bash
scp <UNI>@ginsburg.rcs.columbia.edu:<REMOTE_FILE_PATH> <LOCAL_FILE_PATH>
```

For example, if you want to transfer a file called `table.csv` located in `/burg/mjlab/projects` to your home directory (`~`) you would type:

```bash
scp <UNI>@ginsburg.rcs.columbia.edu:/burg/mjlab/projects/table.csv ~/
```

# `rsync`

`rsync` is a remote synchronization command. There are a lot of options, but the most common use case is synchronizing a directory between Ginsburg and your computer (or vice versa). To synchronize the directory `/burg/mjlab/projects/test/` to your home directory on your computer you can enter:


```bash
rsync -av dsg2157@ginsburg.rcs.columbia.edu:/burg/mjlab/projects/test/ ~/test
```

The `a` option is an abbreviation of multiple options, but basically it copies everything, preserves the permissions of the files, and uses the time modified to determine whether to sync each file and directory. Note that the trailing `/` in the `test` is important. Without it, the command would create another directory within `~/test` called `test`. So without the `/`, you would get `~/test/test`. 

If you want to synchronize `~/test` from your computer to `/burg/mjlab/projects/test`

```bash
rsync -av ~/test/ dsg2157@ginsburg.rcs.columbia.edu:/burg/mjlab/projects/test 
```
