# `srun` - Launch interactive jobs

```bash
srun --pty -t <1-digit_DAYS>-<2-digit_HOURS>:<2-digit_MINUTES> -A mjlab -c <NUMBER_OF_CORES> -N 1 --mem=<MEMORY_IN_GB>G /bin/bash
```

For example, this is a 5 hour job, with 8 cores, and 32 Gb of memory

```bash
srun --pty -t 0-05:00 -A mjlab --mem=32G -N 1 -c 8 /bin/bash
```

# `sbatch` - Launch background jobs

One way to launch background jobs is to create a script and use sbatch to launch that script. For example, if you a script called `example.sh`

```bash
#!/bin/sh
#
# Simple "example" submit script for Slurm.
#
#SBATCH --account=mjlab               # Replace ACCOUNT with your group account name
#SBATCH --job-name=example            # The job name
#SBATCH -c 1                          # The number of cpu cores to use
#SBATCH --time=1:00                   # The time the job will take to run
#SBATCH --mem=4gb                     # The memory the job will use in total
 
# Wait 30 seconds
sleep 30
 
#End of script
```

Once you create the script above in a file called `example.sh`, you run the following to launch the job:

```bash
sbatch example.sh
```

You can also use the `--wrap` option in `sbatch` to launch jobs. Using the same logic and settings as above, this would be:

```bash
sbatch --acount=mjlab --job-name=example -c 1 --time=1:00 --mem=4gb --wrap="sleep 30"
```

# `squeue` - Monitor jobs

This command is for monitoring jobs on Ginsburg, both your and others. To see all jobs running:

```bash
squeue
```

To see only your jobs:

```bash
squeue --me
```

To see all the jobs without the header (useful for piping into other programs):

```bash
squeue --me -h
```

The lack of a header could be useful for seeing how many jobs you're running:

```bash
squeue --me -h | wc -l
```

It can also be useful for filtering certain jobs. For example, if you want to find jobs running bash you could do:

```bash
squeue --me -h | grep 'bash'
```

# `df` - Check file system usage

Check how much space you're using on the file system in bytes:

```bash
df /burg/mjlab/
```

Check how much space you're using on the file system in a human readable way (gigabytes):

```bash
df -h /burg/mjlab/
```

# `du` - Check disk usage

List the file sizes for all files in `/burg/mjlab/`:

```bash
du /burg/mjlab
```

List everything in `/burg/mjlab/` in a human readable format (i.e. kilobytes, megabytes, gigabytes, etc.):

```bash
du -h /burg/mjlab
```

If you want to enforce a minimum file or directory size of 1 Gb, you can type the following (with or without the `-h`):

```bash
du -h -t 1G /burg/mjlab
```

To store this in a file to search through later (e.g. with `grep` or `awk`):

```bash
du -h -t 1G /burg/mjlab > /burg/mjlab/projects/utils/files.txt
```

# `grep` - Search for text in files

You can search for all lines that contain a specific string. For example, you can search for all lines in a bed file that contain "chr1":

```bash
grep "chr1" example.bed
```

You can use regular expressions also known as regex to search for more complicated character sequences. For example, the example above would match "chr1" but also "chr10", "chr11", and so on. We can search for just "chr1" by making our pattern (i.e. the text in the middle of the command) more specific:

```bash
grep "^chr1\s" example.bed
```

The `\s` looks for a whitespace character after chr1. The `^` ensures that we're looking for "chr1\s" at the beginning of each line. Since bed files have columns separated by tabs, this will only match lines where the the first column is "chr1". We can search for "chr1" and "chr2" like this:

```bash
grep "^chr[1|2]\s" example.bed
```

There's much more to regular expressions than this. You can learn more about the regex that `grep` uses [here](https://www.gnu.org/software/grep/manual/html_node/Regular-Expressions.html).

# `find` - Find files

The basic format for `find` is:

```bash
find <starting point> <expression>
```

There are debug options and other fancy things, but those vary between systems. You can learn about advanced stuff by entering `man find` into your terminal.

It's easiest to give examples instead of enumerating all the rules. Let's say you want to find the location of `HEK_MTOR_QC.fastq.gz` on Ginsburg. You could enter the following:

```bash
find /burg/mjlab -name "HEK_MTOR_QC.fastq.gz"
```

To find all files that end with `fastq.gz`:

```bash
find /burg/mjlab -type f -name "*.fastq.gz"
```

To find all files that end with `fastq.gz` and put the results into a new text file (the `-type f` tells find we're looking for files):

```bash
find /burg/mjlab -type f -name "*.fastq.gz" > /burg/mjlab/projects/utils/fastq_file.txt
```

In the command above, you can use any file path you want as long as you have access to it. To find all directories starting form `/burg/mjlab`

```bash
find /burg/mjlab -type d
```

To find all directories starting with `20240617_`:

```bash
find /burg/mjlab -type d -name "20240617_*"
```

To find all directories starting with `20240617_` but only look up to 4 subdirectories deep (the order of the sub-expressions matters):

```bash
find /burg/mjlab -maxdepth 4 -type d -name "20240617_*"
```

# `wc` - Count words, lines, and characters in a file or input

Count the number of lines in a text file:

```bash
wc -l file.txt
```

Count the number of lines in all text files in a directory ending with `fastq`

```bash
wc -l directory/*.fastq
```

Use `echo` and `wc` to output the number of characters in a line:

```bash
echo 'This is an example' | wc -m
```

Use `echo` and `wc` to output the number of bytes in a line:

```bash
echo 'This is an example' | wc -c
```

Use `echo` and `wc` to find number of words in a line (a word is anything separated by a space):

```bash
echo 'This is an example' | wc -w
```

# `scp` - Secure copy

See [`files.md`](/docs/files.md) for details.

# `rsync` - Remote syncing of files

See [`files.md`](/docs/files.md) for details.
