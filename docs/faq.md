# I can't log into Ginsburg, what do I do?

First, check whether you have access. If you don't have access, refer to [`docs.md`](/docs/login.md) for instructions on how to gain access. If you haven't set up the SSH key login method, you know you have access, and you are off campus, you might need to use Columbia's VPN (i.e. this is the Cisco AnyConnect Client at the time of writing this).

# We're reaching the storage limit on Ginsburg, how can find the largest files?

## With `du` only

You can use the `du` command directly to find large files. For example, to list the file sizes for all files in `/burg/mjlab/` you type the following:

```bash
du /burg/mjlab
```

This will list every file in `/burg/mjlab/` in bytes. To list everything in `/burg/mjlab/` in a human readable format (i.e. kilobytes, megabytes, gigabytes, etc.), type the following:

```bash
du -h /burg/mjlab
```

If you want to enforce a minimum file or directory size of 1 Gb, you can type the following (with or without the `-h`):

```bash
du -h -t 1G /burg/mjlab
```

If you want to store this in a file to search through later (e.g. with `grep` or `awk`), you can do the following:

```bash
du -h -t 1G /burg/mjlab > /burg/mjlab/projects/utils/files.txt
```

You can use whatever file path you want, just make sure you have permissions to write to that location.

## With `du` + `find`

If you know what types of files you're looking for, using `find` in conjunction with `du` can make the search process faster. For example, let's say we want to find all gzipped fastq files and their file sizes within `/burg/mjlab`.

```bash
find /burg/mjlab -type f -name "*.fastq.gz" -exec du -h {} \;
```

The command works as follows: 

1. The command starts looking in `/burg/mjlab` (first argument to `find`)
2. It looks for files not directories (`-type f`)
3. It looks for anything ending with `fastq.gz` (`-name *.fastq.gz`)
4. When it finds a file matching conditions (1), (2), and (3) it replaces `{}` with the name of the file and runs `du /burg/mjlab/<path to the file>`
5. We have to end with `\;` because we want to tell `-exec` when the command part ends but we don't want it to interpret `;` as part of the command.

Similar to just the `du` command you can store this into a file for later use.

```bash
find /burg/mjlab -type f -name "*.fastq.gz" -exec du -h {} \; > /burg/mjlab/projects/utils/fastq_files.txt
```

If you want to "dry run" this command, add `echo` in front of `du`. The modified command would be:

```bash
find /burg/mjlab -type f -name "*.fastq.gz" -exec echo du -h {} \;
```

Sometimes it can be easier to search for directories that you know are large, but you don't know where they are. The following command looks for directories with at least 1 Gb of files and prints their size in a human readable format

```bash
find /burg/mjlab -type d -exec du -h -t 1G {} \;
```

Again, you can direct this into a file with the `>` operator, also called the redirect operator. You can learn more about redirection [here](https://www.gnu.org/software/bash/manual/html_node/Redirections.html).

```bash
find /burg/mjlab -type d -exec du -h -t 1G {} \; > /burg/mjlab/projects/utils/large_directories.txt
```

Once you find the largest files you can either move them or delete them using `rm` or move them using `scp` or `rsync`. See `files.md` for more information on how to move files in and out of Ginsburg.

# How fast can files be transferred in and out of Ginsburg?

1 gigabit is the highest bandwidth you can expect transferring files into or out of Ginsburg. 1 gigabit (Gbit) per second is equivalent to 125 megabytes per second (1 byte = 8 bits). Realistically, you might experience slower speeds than this since network interfaces are not perfect and there's some loss due to reading and writing the files. The practical limit would be ~940 megabit (Mbit) which is 117-118 megabytes per second.

# Should I run fewer big jobs or many smaller jobs?

A user can run 50 jobs concurrently, so you should do whatever maximizes the number of concurrent jobs given that there's availability on Ginsburg. For example, if you have 100 files to align via `STAR`, it would be better to give more cores to each job because you can only run 50 at a time. Providing more cores allows each job to finish more quickly which minimizes the time other jobs are waiting in queue. In reality, you'll likely be constrained by other people and existing jobs more often than the hard limits imposed by Ginsburg.

# How does our lab's reserved node work?

We have a node (`g182`) for which we have priority access. It's easiest to illustrate this with some scenarios. Let's assume the reserved node has no jobs running on it. If someone from our lab queues a job and someone outside of our lab queues a job at the exact same time, the job from our lab would get priority and run first. If a job is already running on the reserved node, a job queued from someone in our lab will go to the top of the queue (i.e. it'll be run next no matter who else is queued up). If nobody from our lab has queued anything for the reserved node, other people's jobs on Ginsburg can use that node.
