Introduction to Linux
=====================

Fall 2014

**Instructors**

Chris Collins, Jimmy Dorff, Drew Stinnett, et al

**Unit 1: Shell Navigation, and A Brief History of Unix**

- 1969: Unix invented at Bell Labs by Ken Thompson, Dennis Ritchie & others.
- 1971: First Edition used for text processing of patent documents.
- 1973: Fourth Edition was rewritten in C making it portable and started the OS revolution.
- 1975: Sixth Edition was made available outside of Bell Labs. BSD forks from here at Berkeley.
- 1979: Seventh Edition was improvement over all prior versions, debuted C language tools and Bourne shell.
- 1982: System III is the first public release of Unix outside of Bell Labs. SunOS and HP-UX fork from here.
- 1983: System V is the first supported release by AT&T with an installation base of 45,000.
- 1986: 4.3BSD released with TCP/IP and NFS. AIX announced by IBM. Install base 250,000.
- 1991: Linus Torvalds commences Linux Development. Solaris 1.0 debuts.
- 1994: Single Unix specification announced, separates trademark from specific code instances.
- 1994: First release of Red Hat Linux and Debian Linux, which become the dominant flavors of Linux. 
- 1995: Toy Story, first feature-length computer-animated film, produced on Solaris workstations.
- 1997: Titanic is the first major film to be majorly produced on Linux servers.
- 1999: Linux Kernel 2.2 released to celebrate Unix's 30th birthday.
- 2001: Apple releases Mac OS X, based on BSD Unix.
- 2003: Linux 2.6 kernel released. Red Hat creates RHEL and Fedora.
- 2004: Ubuntu, a popular desktop Linux distribution based on Debian, first released.
- 2007: Mac OS X certified to Unix standard.
- 2010: Apple reports 50 million desktops and growing, all Certified Unix Systems.
- 2011: Linux kernel 3.2 released to mark Linux's 20th birthday.
- 2012: 500 million Android (Linux) and iOS (Darwin) devices have been sold world wide.
- 2013: All 10 of the top 10 supercomputers in the world run Linux today.

**A note on learning UNIX by Paul Murphy of ZDNet**

"Basically, to learn Unix you learn to understand and apply a small set of key ideas and achieve expertise by expanding both the set of ideas and your ability to apply them[.]"

**Command Prompt**

When you login to a system you will be presented with what is referred to as a command prompt. This usually has some basic information about you as the user, as well as the machine you are logged into and the directory you are currently in.

Example: `[user@hostname ~]$`

**Command line is awesome!!**

- Faster and easier to document, share, reproduce, automate.
- Much faster for complex or repetitive tasks. 
- Spaces and unusual characters in filenames make command line tools more difficult to use.

**ssh - Secure Shell**

Secure SHell is a protocol used to exchange data securely between systems, most commonly for interactive shell and file transfers.

On Mac OSX or other Linux or UNIX systems, simply use the ssh command to connect to remote hosts. On Windows, there are a variety of clients, one of the most popular and easy to use is Putty (freeware).

Example:

    [user@localhost ~]$ ssh netid@login.oit.duke.edu
    netid@login.oit.duke.edu's password:
    [user@compute ~]$

On the first connection to a host you will need to accept the host key  
For Mac and Linux systems, if your username is the same as your netid you can omit it

## Unit 1: Lab 0 - Creating a personal Linux VM

1. Using a web browser, go to *https://vm-manage.oit.duke.edu*
2. Login using your Duke netid.
3. Create a new project for this class.
4. Select *Ubuntu 14 Basic* for the Server.

The vm-manage web page will tell you the name for your VM. The web site will also tell you the initial username and password. You should connect via ssh.

Example: `ssh bitnami@colab-sbx-87.oit.duke.edu`

6. Once logged in via ssh, enter the `passwd` command to set a unique password.

Example:

    passwd
    Changing password for bitnami.
    (current) UNIX password:
    Enter new UNIX password:
    Retype new UNIX password:

## Unit 1: Shell Navigation

**echo**

Prints back what the user types to the screen or presents a variable in plaintext.

**Bash**

An Open Source replacement for the Bourne Shell (sh). It is the default shell on most Linux distributions currently and the one most likely to be encountered by users.

csh and tcsh are less common and have annoying differences. Google "Top Ten Reasons not to use the C shell"

**Tab Completion**

Working with the command line can be daunting when used to a GUI (graphical user interface). By using tab completion, you can minimize the amount of text you have to type by pressing [TAB] to complete what you have already partially typed. On modern systems with advanced tab completion you can auto-complete remote filesystems, command syntax, and more.

**history**

The history command is very useful to see what commands you have run in the past, and keeps by default the last 1000 lines entered at the prompt.

This can be a security hazard though, as sometimes people accidentally type their passwords on the command line, and if someone happens to shoulder-peek whilst you are browsing your history it could be compromised.

*Useful switches:*

    -c    clears history
    -d    followed by a line number, clears the history from that line up only

**man**

Shows the manuals for commands.

Man can be your best friend when you are unfamiliar with commands in unix. You can run man followed by any command and see a comprehensive manual of the command and all options you can run it with.

Sometimes manuals can be lengthy and the amount of information you need is not easily discernible, as such, short form help can be found often by trailing a command with `-?` or `--help`.

**Hotkeys and Shortcuts:**

    CTRL+R            Dynamically search your command history
    CTRL+E            Move cursor to the end of the line
    CTRL+A            Move cursor to the beginning of the line
    CTRL+W            Delete previous word
    CTRL+C            Kill the current command
    CTRL+P            Recall the previous command from history
    ALT+. (period)    Insert the last parameter from the previous command
    CTRL+D            Exit/logoff
    Up/Down Arrows    Scroll through command history

**~/.bashrc and ~/.bash_profile**

These files are scripts which are executed whenever you log in or open a new terminal. They are used to configure your environment, set the PATH variable, or run commands.
They are used somewhat differently on various systems, but for most uses the ~/.bashrc file should be used for adding functionality.

**$PATH**

$PATH is a variable specified usually in the ~/.bashrc, that tells your session how to interact with the filesystem, usually where non-standard items are located, and in what order to process them. 

This is useful when a program is already installed on the system, but you would like to compile or run a newer or different version without modifying the program which is already installed. You can install that program in your home directory, then modify your PATH to include the path to the program you installed.

In this example, python 2.4.3 is installed in /usr/bin, and python 2.7.3 is installed in /usr/local/bin. By modifying the order that these directories appear in the PATH variable, a different version of the program will be called when simply executing its name:

    [user@compute01 ~]$ echo $PATH
    /usr/bin:/usr/local/bin:/home/user/bin
    [user@compute01 ~]$ which python
    /usr/bin/python
    [user@compute01 ~]$ python
    Python \*\*2.4.3 (#1, Jun 18 2012, 08:55:23)\*\*
    [GCC 4.1.2 20080704 (Red Hat 4.1.2-52)] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    >>>

    [user@compute01 ~]$ echo $PATH
    /usr/local/bin:/usr/bin
    [user@compute01 ~]$ which python
    /usr/local/bin/python
    [user@compute01 ~]$ python
    Python \*\*2.7.3 (default, Aug 17 2012, 17:43:15)\*\*
    [GCC 4.1.2 20080704 (Red Hat 4.1.2-52)] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    >>>

## Unit 1: Lab 1 - Accessing a remote console, playing around

1. Open up a terminal window and ssh into the host provided.
2. Once there echo your path.
3. Open the manual for the echo command.
4. Find out the option to make a new line above your echo statement.
 
## Unit 2: Basic File System Functionality
 
**pwd**

Print name of current Working Directory.

Example:

    [user@compute ~]$ pwd
    /home/user

**cd**

Change Directory. Changes the current working directory.
 
Example:

    [user@compute ~]$ cd /nfs/labs
    [user@compute labs]$

**Relative Paths and Absolute Paths**

A relative path is a path which is relative to your current working directory (does not begin with a leading slash). Relative paths sometimes start with a single dot or a double dot, indicating the current directory or the parent directory.

     ./    (Current directory)
    ../    (One directory up)

Example:

    [user@compute chilab1]$ pwd
    /nfs/labs/chilab
    [user@compute chilab]$ cd ../ohlerlab
    [user@compute ohlerlab]$ pwd
    /nfs/labs/ohlerlab

**Application Paths**

When typing a command, the shell searches directories in the path (a list of directories) in order for commands matching the name you typed. The first one found gets executed.

All users have a default path that the system knows to look in when searching for executables. If you would like to find out what your current paths are set to you can always echo back the $PATH system variable.

Example:

    [user@compute ~]$ echo $PATH
    /usr/sbin:/bin:/usr/kerberos/bin:/usr/local/bin:/usr/bin

**which**

which is a command used to locate executables.

If there are multiple executables with the same name in different directories in your path, which can be used to identify which one will be executed when you type the command.

Example:

    [user@compute ~]$ which matlab
    /usr/local/bin/matlab

**Executing**

In a unix environment, you execute a program by typing out the full path to it. In order to run matlab, you can type `/usr/local/bin/matlab`, or if your current working directory is the directory `/usr/local/bin`, you can use a relative path and type `./matlab`, or if it is in one of your application paths ($PATH) above, you simple have to type `matlab`.

**ls**

Displays a listing of files and directories.

*Useful switches:*

    -l    Long directory listing. Prints more detail such as file size, ownership, permissions
    -h    Print human-readable sizes on a long listing
    -a    Shows all files and folders including hidden ones (which begin with the period character)
    -d    When used to list a directory, lists the directory entry itself instead of its contents.

Examples:

    [user@compute labs]$ ls
    barda    dietrichlab  itlab        nevinslung  tianlab

    [user@compute ~]$ ls -l /nfs/labs/
    total 132
    drwxrws--- 17 root barda     4096 Jun 29 12:27 barda
    lrwxrwxrwx 1 root root       31 Jan 16 2012 benfeylab -> /nfs/igsp/benfey_sas/benfeylab/

    [user@compute labs]$ ls -l -h -d barda/
    drwxrws--- 17 root barda 4.0K Jun 29 12:27 barda

**File Permissions**
 
Permissions are displayed as 10 bits in the leftmost column on a long directory listing, and describe who can read, write, and execute the file or directory. They are divided into sections:

    | Info | User | Group | Other |
    |   -  |  --- |  ---  |  ---  |

These spaces will usually be populated with the characters "r" (read), "w" (write), and "x" (execute) and determine what a user is able to do with the file or folder. The info bit usually will be blank, or have a letter d if it is a directory, or if there are some other special permissions present.

Example: Running our `ls -l` command above we see the following for this folder.

    [user@compute ~]$ ls -l
    total 8
    drwxr-xr-x 2 steve visitors 4096 Apr 25 12:20 expt
    drwxr-xr-x 3 steve visitors 4096 Apr 17 21:04 R

In this example, there are two directories listed. They are directories as indicated by the "d" in the info bit. The user (steve) has full permissions (read/write/execute), and the group (visitors) can read and execute (but not write), and everyone else can also read and execute (but not write).

For a file, execute permission means that it can be executed as a program or script. For a directory, execute permission (along with read permission) means that the contents of the directory can be read and listed.

**mkdir**

Creates a new empty directory.

**touch**

Performs a write operation to a file without writing any actual data. Creates a file if it does not exist, or updates the modified timestamp on a file that already exists.

Useful for creating a blank file or updating a timestamp.

Example:

    [user@compute ~]$ ls foo
    ls: foo: No such file or directory
    [user@compute ~]$ touch foo
    [user@compute ~]$ ls -l foo
    -rw-r--r-- 1 user staff 0 Jul 31 12:22 foo

**cp**

Copy a file or directory.

*Useful switches:*

    -v                     Prints a line for every file copied
    -R, -r, --recursive    Recursively copy directories and all of their content - Use care with this one

Example:

    [user@compute ~]$ cp -v foo bar
    'foo' -> `bar'

    [user@compute ~]$ ls -l foo bar
    -rw-r--r-- 1 user staff 0 Jul 31 12:23 bar
    -rw-r--r-- 1 user staff 0 Jul 31 12:23 foo

**mv**

Moves or renames a file (which is actually the same operation in UNIX).

*Useful switches:*

    -v                   Verbose. Prints a line for every file moved
    -i, --interactive    Prompt before overwriting

Example:

     [user@compute ~]$ mv -v foo foo_moved
     `foo' -> `foo_moved'
     [user@compute ~]$ ls -l foo foo_moved
     ls: foo: No such file or directory
     -rw-r--r-- 1 user staff 0 Jul 31 12:23 foo_moved

**rm**

Removes (deletes) a file

*Useful switches:*

    -r, -R, --recursive    Recursively remove directories and their contents - USE EXTREME CARE
    -i, --interactive      Prompt before overwriting
    -f, --force            Without notice plow through, very dangerous
    -v, --verbose          Prints a line for every file removed/deleted.

**rmdir**

Removes an empty directory

Sometimes a directory will seem empty but not be, you may need take a closer look with `ls -al`

**w**
 
Show who is logged on (and what command they are running), system uptime, and load average. Optionally provide a username to view only their sessions.

Example:

    [user@compute ~]$ w user
    13:34:49 up 76 days, 25 min, 26 users, load average: 0.04, 0.01, 0.00
    USER   TTY   FROM       LOGIN@  IDLE  JCPU  PCPU WHAT
    user   pts/8           12:15  0.00s 0.03s 0.00s w user

**id**

Prints information for yourself or another user. It will give you the user's unique ID number, and all the groups that the user is a member of along with their associated group ID numbers. This can help you identify permissions for file and directory access.

Example:

    [user@compute ~]$ id

uid=5555(user) gid=1000(professors)

[user@compute ~]$ id joe

uid=1234(joe) gid=1000(professors) groups=1000(professors),1056(igsp),1029(willardlab),1088(genomic-handbook)

- 
  - A similar tool is whoami, which simply displays your own username. Example:

[user@compute ~]$ whoami

user

- getent

- 
  - Getentries from a system database, such as passwd (user list), group (group list), and other system files.
  - Most commonly, this is used to find group membership. If you want to see which users are members of a specific group, then you can use getent to get entries in the group database.
  - Example:

[user@compute ~]$ getent group chilab

chilab:\*:1041:gml7,cs80,jwu7,jdoss,xt2,mmk24,les36,jb279,mjv10,mh180,

cl215,sl238,chi00002,ljo6,avc2,jel2,mh309,cl26,cl262

- finger

- 
  - Finger is used to point at someone's username and find out a human readable response on who they are if you don't recognize their system id.
  - Example: I see on a server that user svu is running lots of jobs, but that username is quite cryptic. I try id first, to see which lab he is affiliated with but that doesn't help, and that is where finger comes in:

[user@compute ~]$ id svu

uid=5555(svu) gid=400(visitors) groups=400(visitors)

[user@compute ~]$ finger svu

Login: svu              Name: Steve User

Directory: /home/svuShell: /bin/bash

Last login Wed Aug 1 23:34 2012 (EST) on pts/5 from localhost.

eNo mail.

No Plan.

- chmod

- 
  - Change mode, is a command used to modify permissions on a file. If you would like to share your files with another user in your group, you can modify the permissions to grant read, write, or execute the file.
  - Useful Switches:
    u (User)
    g (Group)
    o (Other)
    + (Add Permission)
     (Remove Permission)
    r (read)
    w (write)
    x (execute)

  - Example:

[user@compute ~]$ ls -l largefile.10g

-rwx------. 1 user research 10737418240 Jul 2 08:46 largefile.10g

The user above has the file largefile.10g that he would like to share with other people in the group "research" so that they can read and write to the file. This is where chmod comes in:

[user@compute ~]$ chmod g+rw largefile.10g

[user@compute ~]$ ls -l largefile.10g

-rwxrw----. 1 user research 10737418240 Jul 2 08:46 largefile.10g

The g+rw means that for the g roup, add ( + ) r ead and w rite permission. This results in the file having read, write, and execute permissions for the user, and read and write for the group.

- chown

- 
  - Change Owner, is a command used to modify the owner of a file. This usually can only be performed on a system where you have administrative rights and can switch files from one user to another.
  - Example:

[user@compute ~]$ chown user2 largefile.10g

[user@compute ~]$ ls -l largefile.10g

-rw-r--r-- 1 user2 staff 10737418240 Sep 6 11:38 largefile.10g

- chgrp

- 
  - Change Group, is a command used to modify the group that can read a file. You can only switch group ownerships on a file that you are the owner of.
  - Example:

[user@compute ~]$ chgrp group2 largefile.10g

[user@compute ~]$ ls -l largefile.10g

-rw-r--r-- 1 user group2 10737418240 Sep 6 11:38 largefile.10g

- Octal Permissions

- 
  - Another way to modify permissions that you will often see is to use octal numbers to do so. Each value r, w, x is equivalent to a number which, when all permissions are set, add up to 7 (full permission).
    - 
      - 4 = read
      - 2 = write
      - 1 = execute

  - Example: If we wanted to grant read and write permissions to the research group like we did with our example above, we could also do the following:

[user@compute ~]$ chmod 760 largefile.10g

[user@compute ~]$ ls -l largefile.10g

-rwxrw---- . 1 user research 10737418240 Jul 2 08:46 largefile.10g

       

The 760 tells us that the user field should have an octal count of 7, (read+write+execute), the group field should have a count of 6, (read+write) and the other field should have a count of 0.

Day 1 Lab 2: Working with Files in the Filesystem

- Open the terminal application
- Change your workstation to the /tmp directory.
- Run id on your username, write down your primary group.
- Make a directory named Lastname\_Firstname.
- List the permissions on this directory.
- Modify the permissions where others can enter the directory but not edit it's contents.
- Change inside of the directory.
- Create an empty file named foo.
- Copy this file to a new file named bar.
- Move this file to a new file named baz.
- Modify the permissions so that only you can read foo.
- Modify the permissions on baz to allow anyone to edit it. (not a good idea in the real world)

- At the end you should have 3 deliverables:
  - A folder with your name, with permissions set correctly.
  - A primary empty file with that only you can read.
  - A secondary empty file that anyone can edit.

Day 2

Unit 3: _Interactions With Data and Disk Storage_

- Mount Point
  - A mount point is a directory or location in the local filesystem that you can use to mount either a remote directory or local device to access the files available there.

- NFS -- Network File System

- 
  - NFS is a protocol which allows remote file storage to be available (mounted) on another machine. Most Linux servers use NFS for home directories and many of their storage options.

- Disk Usage & Quotas
  - Knowing how much total space is available, how much is used, and how much is free is critical to working with data. For network storage, you probably have a quota assigned as well, which limits the amount of space an individual user can use on the storage volume. A few tools you can use to see the space available to you on a system are as follows:
  - df     Disk File System Info
    This is used to see the entire size of a local volume or disk, and what is available, like I said above this may not be helpful to individual users, as a DF can report many terabytes available in a volume when in fact the user quota is much lower.
      - Useful flags
        - -h -- human-readable (converts byte values to MB, GB, etc.)
        - -T "Type" -- lists the type of filesystem

  - du    Disk Usage
    This is used to count out the size of a particular directory, if you know the quota or volume size this will tell you what particular files or folders are using up specifically.
      - Useful flags
        - -h "human readable" -- converts sizes to GB
        - -s "summary" -- only shows top folder size.

  - Reading files

- 
  - cat
    Short for Concatenate, originally intended to combine two files into one long file to browse, many people use it for a simple output of the entire contents of a file. It's useful in a graphical terminal because once a file or files are catted out, you can browse up and down them with your mouse.

  - less & more
    These programs are intended for the reading of longer files. More will display the contents of a file, and at what place you are in the file via percentage, near the bottom, and allow you to move only downward through the file one page at a time with the space bar. Less on the other hand is actually more... it allows for advanced functionality, using the arrow keys to traverse up and down a file.

  - diff
    This is a program that will point out lines that are different if you have two files, or copies of the same file and want to see what the differences are.
    Useful Switches
      - -y -- Displays contents side by size and points out differences.
      - -q -- Only displays that they are differently quickly.
      - -b -- Ignore extra lines or whitespace.

  - head & tail
    head and tail are quick file readers, displaying respectively the top (head) or bottom (tail) sections of a file. By default it shows 10 lines, but the -n switch can set the number of lines to be shown.
    Examples:

[user@compute ~]$ tail /usr/share/dict/words

Zythia

zythum

Zyzomys

Zyzzogeton

zyzzyva

zyzzyvas

ZZ

Zz

zZt

ZZZ

[user@compute ~]$ head -n15 /usr/share/dict/words

1080

10-point

10th

11-point

12-point

16-point

18-point

1st

2

20-point

2,4,5-t

2,4-d

2D

2nd

30-30

[user@compute ~]$ tail -n2 /usr/share/dict/words

zZt

ZZZ

- Command Output Redirection
  - Redirection can be used to take the output of a command and write it into to a file instead of standard output (the terminal). There are two types of file redirection, one for overwrite and one for append.
    > -- a single arrow is used to create a file, or overwrite the contents of an existing file if necessary. This is good for sanity checks, many people will have a program that writes out a new file with a specific output and check back against it.
    >> -- a double arrow is used to append to an existing file, very useful for logs, or continuing records so you can just add lines to the end.

  - In this example, we use the df command to show the disk usage for the user's home directory and saves the output into a file called my\_quota.txt:

[user@compute ~]$ df -h ~ > my\_quota.txt

[user@compute ~]$ cat my\_quota.txt

Filesystem      Size Used Avail Use% Mounted on

san01a.igsp.duke.edu:/vol/central\_sata/data

           4.7T 2.7T 2.0T 58% /nfs/central

- Text Editors
  - Most configuration files, scripts, and system files are plain text and will need to be edited. There are a variety of text editors available on UNIX, which one you use is largely up to individual preference. To open a file, simply type run your editor of choice followed by the file (or files) you'd like to edit.
  - nano / pico
    Nano, as found on linux, or Pico as found on Mac OS and other proprietary systems, are nearly identical text editors and are a great editing tool for those new to UNIX. It has a handy command reference displayed which shows common commands, making it more intuitive than vi/vim.
    Useful keys:
      - CTRL+O -- save
      - CTRL+W -- search
      - CTRL+V -- page down
      - CTRL+Y -- page up
      - CTRL+X -- exit

  - vi / vim
    The default editor on most unix/linux systems, and the editor of choice of many system administrators and programmers, including the instructors of this course. It is very powerful and has many shortcuts and built in functions that can make file editing efficient.
    This program is so complex that many classes and books have been designed for the sole purpose of teaching its advanced functions. While it does have a high initial learning curve, a little time spent up front to get past the initial learning curve can be worthwhile, as its basic functions can be useful even to the more casual user.

  - emacs
    Emacs is also an advanced editor, and one preferred by many programmers and systems administrators as it contains an executable shell to work from while editing.

  - Opening
    In order to open most files in a unix system, you just type the name of the editor you wish to use, and then follow with the filename.

  - Saving
    In order to save, most of the editors have a write out function as defined in the Useful Keys section above.

- File Extensions
  - Unlike Windows, where every file has an extension identifying its type, most files in a unix filesystem do not, and are just defined by their permissions, all files can be opened with one of the text editors above, but many cannot be read or edited this way, a compiled binary file will appear as gibberish to most people.

- File Compression
  - Tar
    The main UNIX archive utility that will allow you to store many files and directories into a single file, while optionally compressing them in the process. Compression methods include GZ (GZip) or BZ2 (BZip2). Using compression can drastically shrink the file size, which is useful when archiving or transferring data across the internet. Many applications (and source code) are distributed inside these archives.
    Useful flags
      - 
        - c (create) create a new archive
        - x (extract) extract or expand an archive file
        - j (bz2 format) if compressed
        - z (gzip format) if compressed
        - v (verbose) will list files in and out of archive
        - f (file name) the file you want to open, or save to

- 
  - 
    Example: A user has a directory full of files which can be cumbersome to send over email as individual files. Using tar and bz2 compression, the directory can be compressed into a single file that can then be easily emailed:

[user@compute ~]$ du -hs unix101/

24M unix101/

[user@compute ~]$ tar -cjvf unix101.tar.bz2 unix101/

unix101/

unix101/intro/

unix101/intro/file\_layout.html

unix101/intro/index.html

unix101/intro/dilbert-unix.png

unix101/intro/style.css

unix101/intro/agenda.html

unix101/intro/parts.html

unix101/intro/parts.png

...

..

.

[user@compute ~]$ du -hs unix101.tar.bz2

5M unix101.tar.bz2

- 
  - Zip -- also available are the commands zip and unzip which are used for manipulating zip files, the common compression/archiving format on Windows and other platforms.
    Useful flags
      - 
        - r (recursive) must be used to grab all sub-files in a folder you want to zip
        - 9 (maximum compression) will zip it as low as possible, but take longer

- 
  - 
    Example: Same as above but with zip. (Note, it shows you compression numbers per file. Neat.)

[user@compute ~]$ du -hs unix101/

24M unix101/

[user@compute ~]$ zip -r9 unix101.zip unix101

adding: unix101/ (stored 0%)

adding: unix101/intro/ (stored 0%)

adding: unix101/intro/file\_layout.html (deflated 36%)

adding: unix101/intro/index.html (deflated 48%)

adding: unix101/intro/dilbert-unix.png (stored 0%)

adding: unix101/intro/style.css (deflated 50%)

adding: unix101/intro/agenda.html (deflated 56%)

adding: unix101/intro/parts.html (deflated 36%)

adding: unix101/intro/parts.png (deflated 1%)

adding: unix101/intro/multitask2.html (deflated 40%)

adding: unix101/intro/file\_layout\_2.html (deflated 36%)

…

[user@compute ~]$ du -hs unix101.zip

5M unix101.zip





Day 2 Lab 1: Modifying Our Files

- Use head on the standard dictionary for 100 words and redirect them into your file foo.
- Use tail on the standard dictionary for 500 words and redirect them to your baz file.
- Find out the size of each of these files and append that to a new file called sizes.
- Now using echo, write the console output "My name is lastname\_firstname" over the contents of the baz file.
- Using an editor modify the file to add a period at the end of the line.
- Save the file.
- Find out the size of the file and also redirect that to the file called sizes.
- Make a new directory called archive, and copy each of the 3 files into the archive.
- Create and bzip this archive file to a file called archive.tar.bz2.
- Find out of the size of the archive file and append it to the sizes file.
- Delete your archive folder.
- Create a new folder called archive2 and extract your archive there.
- Use diff and display the differences of sizes file in your primary directory, and the one in the archive.





Unit 4: Exploring Methods of Data Transference

- Data Transfer

- 
  - scp
    Secure Copy transfers file(s) to or from a remote host via the SSH protocol. Therefore, you can transfer data into and out of nearly any server with SSH configured (see how SSH is incredibly useful?).
    Example:

[user@compute ~]$ scp largefile.10g user@compute2.igsp.duke.edu:/home/user/

largefile.10g    100%  10GB 21.4MB/s  07:59  

- 
  - sftp
    Secure FTP is designed for secure file transfer (also over SSH, but requires more configuration on the server), and is run in an interactive mode with commands.

  - wget
    Web Get is a handy program that downloads a file from a web site or FTP server. For example, if you find a download link to a .tar file containing a program you'd like to install on a server, simply copy the URL from your browser and paste it to your terminal after the wget command, and it will download that file to the remote server in the current directory.

  - rsync
    Remote Sync-is a very powerful tool for transferring, replicating, and verifying a set of files from one directory to another, often over a network (using, you guessed it, SSH). rsync is also able to resume an interrupted transfer, which is very handy when a multi-gigabyte transfer fails at 97%.
    Useful flags:
      - -r -- recursive
      - -P -- enable resuming partially transferred files and show progress of transfers
      - -a -- archive mode: attempts to preserve file ownership, permissions, timestamps, and implies recursive copying (-r). This is useful when making a backup of a large directory or an entire computer.

    Example:

user@localhost ~ $ ls -l foo/

bar baz testfile

user@localhost ~ $ rsync -Pa foo compute01.igsp.duke.edu:

sending incremental file list

foo/

foo/bar

    3765 100%  0.00kB/s  0:00:00 (xfer#1, to-check=2/4)

foo/baz

    2825 100% 183.92kB/s  0:00:00 (xfer#2, to-check=1/4)

foo/testfile

    1778 100% 115.76kB/s  0:00:00 (xfer#3, to-check=0/4)

sent 8594 bytes received 73 bytes 17334.00 bytes/sec

total size is 8368 speedup is 0.97

- Version control
  - Projects involving multiple authors often use a version control system to keep track of changes. The most common version control system at the moment is git.
  - git
    git clone: creates a local copy of an online git repository.
    Example:

[user@compute ~]$ $ git clone https://github.com/scipy/scipy

Cloning into 'scipy'...

remote: Counting objects: 91976, done.

remote: Compressing objects: 100% (31/31), done.

remote: Total 91976 (delta 14), reused 2 (delta 0)

Receiving objects: 100% (91976/91976), 49.29 MiB | 5.83 MiB/s, done.

Resolving deltas: 100% (70684/70684), done.

Checking connectivity... done.

Day 2 Lab 2: Transferring Data Amongst Remote Hosts

- Open a shell on your local lab workstation.
- Download a file from the following web link:
- http://www.tbi.univie.ac.at/~ronny/RNA/packages/source/ViennaRNA-2.1.3.tar.gz
- Make note of the time it takes to complete the download.
- We will use this file for a later lab.



Unit 5_: Advanced File System Management_

- Hardlink
  - A link (ln) or hard link is basically a reference to an inode address and a block of data on the disk. Most files will only ever have one, but there are instances when multiple can be useful.
  - Every hard link that points to the same file can be read and written to, and modifies the same underlying data inside the file. The exception to this are permissions; each hard link can have distinct, separate permissions.
  - Hard links do not take up additional space in the filesystem, since they all point to the same data. This is contrary to making a copy of a file, whereas that will take up twice the amount of space on the filesystem.
  - A file remains as long as there are at least one hard link pointing to it. Once the last hard link is deleted, the file is officially deleted and the space it previously consumed is freed.

- Symlink
  - A symbolic link (ln -s) also referred to as a soft link, is similar to a shortcut in Windows. It points to the original location of a file, but if the destination file is moved or deleted, the link will be broken.
  - A symlink can be deleted with no affect to the original file. Editing the data within the file from either the symlink or the file itself, will modify the original file.

- find
  - find is a program that searches through one or more directories of a filesystem and reports files matching the specified criteria. Criteria could be file name, date, owner, permission, type, etc.
  - Example:

[user@compute ~]$ find ~ -name large\*

/home/user/largefile.10g

- locate
  - Locate is similar to find, except it searches a precompiled database index of all files on the system instead of actually looking at the filesystem itself. This makes locate much faster than find; in most cases, it is instantaneous.
  - Typically, the locate database is updated once per day by an automated task set by the system administrator. Because of this, the results from locate can be out of date if there have been changes made to the file(s) since the database was updated. Use find for the most up-to date information.

- Pipes 
  - A pipe (|) is a method by which output from one command is used as the input for another command. This enables powerful processing of text, or streaming data from one program to another.

- grep
  - Utility for searching text for lines matching basic text or regular expressions.
  - grep can be most useful in its simplest form when piping a command to grep and searching for a string of text. Example:

[user@compute ~]$ df -h | grep scratch

/dev/sda7       44G  11G  32G 25% /scratch

Piping the output of df to grep with the expression 'scratch' will show any lines containing that string, in this case the /scratch mountpoint. This simple use can be applicable in many cases. Try some on your own.

- 
  - Useful flags:
    v -- invert match (show only lines which do not match the expression)
    An, -Bn, -Cn -- show surrounding n line(s) around the matching text (Above, Below, or Context [above and below])
    i -- ignore case (case insensitive search)

- Regex
  - Regular Expressions are a concise and flexible means to "match" for strings of text, such as particular characters, words, or patterns of characters. It can really help when searching logs and databases for entries or like entries.
  - Because of their complexity, we will only touch on regular expressions by their use in other programs. See the links in External Resources section for more info.

- sed
  - Stream Editor - is a utility that parses text and can apply transformations to that text as defined by regular expressions. It reads input from a pipe or from a file and applies a regular expression to each line and outputs them to stdout.
  - Example:

[user@compute ~]$ cat my\_quota.txt

Filesystem      Size Used Avail Use% Mounted on

san01a.igsp.duke.edu :/vol/central\_sata/data

           4.7T 2.7T 2.0T 58% /nfs/central

[user@compute ~]$ sed 's/san01a/newserver/' my\_quota.txt

Filesystem      Size Used Avail Use% Mounted on

newserver .igsp.duke.edu:/vol/central\_sata/data

           4.7T 2.7T 2.0T 58% /nfs/central

- awk
  - Awk is a tool used as a data extraction and and reporting tool, often taking in values from StdOut and separating lines into different fields via a specified separator and allowing you to report back a specific field.
  - Example: I can list all group members with getent, but it gives me other info as well, if I just want the members, I can use awk to parse out that info, using the colon as the separator, and listing field 4.

[user@compute ~]$ getent group chilab

chilab:\*:1041:gml7,jwu7,jdoss,xt2,mmk24,cl215,chi00002,ljo6,jel2,mh309,cl26,cl262,avc2

[user@compute ~]$ getent group chilab | awk -F: '{print $4}'

gml7,jwu7,jdoss,xt2,mmk24,cl215,chi00002,ljo6,jel2,mh309,cl26,cl262,avc2



- Checksums
  - A checksum (or hash sum) is a small snippet of text computed from an arbitrary block of data for the purpose of detecting accidental errors that may have been introduced during its transmission or storage. The integrity of the data can be checked at any later time by recomputing the checksum and comparing it with the stored one. If the checksums match, the data was almost certainly not altered.
  - Some popular hash algorithms include: MD5, cksum, SHA-1, SHA-256
  - MD5 is commonly used as it gives a good balance of performance (little time taken to generate a hash on large data) and collision resistance (likelihood that two different files will calculate to the same hash value). Example:

[user@localhost ~]$ md5sum foo.txt

37c4b87edffc5d198ff5a185cee7ee09 foo.txt

[user@localhost ~]$ mv -v foo.txt foo2.txt

`foo.txt' -> `foo2.txt'

[user@localhost ~]$ md5sum foo2.txt

37c4b87edffc5d198ff5a185cee7ee09 foo2.txt

Notice, after moving the file, the hash sum is the same, because the contents are identical and the file integrity is intact. Now instead if we edit the contents just by adding one character, we get a drastically different checksum value:

[user@localhost ~]$ md5sum foo.txt

37c4b87edffc5d198ff5a185cee7ee09 foo.txt

[user@localhost ~]$ vi foo.txt

[user@localhost ~]$ cat foo.txt

x The quick brown fox jumps over the lazy dog

[user@localhost ~]$ md5sum foo.txt

1dcf0a9446176bee28ee29464400da86 foo.txt

Just adding a single character to the beginning of the file causes the checksum to be drastically different, thus indicating a modification to the contents of file.

Unit 6_: Advanced Application Management_

- Checking Machine Resources
  - Besides disk space, there are other resources on a server which you should be aware of when running applications, especially computationally intensive ones. Resources to consider include CPU, RAM (memory), and network bandwidth.
  - ps - Processes
    A program that lists running processes on the system.
    Useful flags:
      - -e -- show all processes, including those owned by others
      - -u -- sort by user
      - -f -- full format listing
      - -x -- show all processes
      - -H -- show a tree view of child/parent process hierarchy

    Can be used in conjunction with grep similar to the example provided above to locate a particular program or programs started by a user. 

  - free
    Tool to see the amount of memory (RAM) and swap space available and in use on the system.
    Note that the way the Linux kernel allocates memory, free (and other utilities) may report that nearly all of your RAM is being used. This is not entirely true; Linux uses inactive memory to cache files very intelligently. However, if an application needs that memory, it will quickly release it from filesystem cache. For a more usable number, refer to the "-/+ buffers/cache" line to see how much RAM is available for applications, excluding the filesystem buffers.
    Useful flags:
      - -g -- number in gigabytes (most useful in today's machines)

  - top 
    An interactive program that provides a dynamic real-time view of a running system, including processes, CPU usage and the type of its use, memory, and swap consumption. It also allows you to interact with processes so that they can be killed or reniced (assuming the user has permission).

- Managing Processes
  - kill
    Just as it describes, a command used for killing an active process abruptly. Often used by administrators for cleaning up rogue jobs, but regular users can also control their own jobs with this command as well.
    This command requires you to specify the PID of the process to be killed (this can be found with the ps command).
    Useful flags:
      - -STOP -- suspends the process exactly as it is
      - -CONT -- resume a previously STOP'd process
      - -9 -- This is the most forceful method for killing a process

  - pkill
    Similar to kill though it will allow you to search for processes based on specific terms such as user.
    Useful flags
      - -u -- user, pkill - u userid will kill all jobs by that user.

  - killall
    Kills all processes with the same name (not by PID).
    Most flags of the kill process work with killall as well.

  - Job Control
    UNIX systems have built-in support for running multiple processes at once from the same console through job control. Jobs can be launched in the background, then the user able to issue more commands while the background job runs. Backgrounded jobs will continue to output to your terminal.
    Note that backgrounded jobs will NOT continue to run after disconnecting or logging out of the server. For this functionality, see nohup or screen.
    This method is fairly crude, and has substantial limitations. For more full-featured interactive process management, see screen.
    Useful commands:
      -  & -- Runs  in the background
      - , CTRL+Z -- Stops command and puts in background
      - jobs -- List processes under job control with associated job IDs
      - fg  -- Bring to foreground and resume execution
      - bg  -- Resume execution in background

    Example:

[user@compute ~]$ ./run.sh

2012-10-01 12:15:32 INFO: Running iteration 1 of 5...

2012-10-01 12:15:37 INFO: Running iteration 2 of 5...

^Z

[1]+ Stopped         ./run.sh

[user@compute ~]$ jobs

[1]+ Stopped         ./run.sh

[user@compute ~]$ fg 1

./run.sh

2012-10-01 12:15:47 INFO: Running iteration 3 of 5...

^Z

[1]+ Stopped         ./run.sh

[user@compute ~]$ bg 1

[1]+ ./run.sh &

[user@compute ~]$ 2012-10-01 12:15:54 INFO: Running iteration 4 of 5...

[user@compute ~]$ free -m

      total    used    free   shared  buffers   cached

Mem:     32185   31032    1152     0    339   29315

-/+ buffers/cache:    1377   30807

Swap:    32765    779   31985

[user@compute ~]$ 2012-10-01 12:15:59 INFO: Running iteration 5 of 5...

2012-10-01 12:16:04 INFO: Done!

[1]+ Done          ./run.sh

[user@compute ~]$

In the above example, the program run.sh was executed normally, then stopped with CTRL+Z . The jobs command showed the job in a stopped state. fg command starts the command executing again in the foreground, where it is once again stopped with CTRL+Z . bg is then used to resume execution in the background this time, which allows the user to run any other commands they like - in this case, free -m is used to check the memory usage. The run.sh script continues to run in the background, outputting text onto the console, until completing and exiting.



- 
  - screen / tmux - the best thing since self-slicing bread
    Allows you to connect and disconnect from long running processes and monitor the output. Good online "cheat sheets". 

Unit 7 : Simple system administration

- Admin access    Making changes to the operating system components affects all users. As such, it requires administrator rights on the Linux system. On your class virtual machines you have admin access via the sudo command. On real production systems you will probably not have admin access and will need to request changes.
- apt & yum - installing software
  - Linux software is mostly provided by a distribution. Software is arranged into packages and groups of packages. This is kind-a like an "app store", but everything is free and kept upto date by the distribution.
  - Examples: On Red Hat Linux distributions, use yum:yum install scipy
  - Examples: On Ubuntu / Debian distributions, use apt:apt-get install python-numpy

Day 2 Lab 3: Building a Program from Source

- Building an application from source.
  - The best practice is to use software provided by the Linux distribution. However, sometimes specialized research software isn't packaged in a common distribution like Ubuntu. Also, you may need a new or experimental version of an application or you may need to modify the source code.
  - In such cases, users may need to compile these programs from their source code and install the binary application in their home directory to be used.
  - Your linux system must have a C compiler and basic software build tools. To install these execute:    sudo apt-get install build-essential
  - Typically, compiling from source code involves the following basic steps:
    Download and extract the source code
    Run the configure script: ./configure
    Compile the program: make
    Install the program: make install

  - The configure script will typically define variables such as where to find dependencies and where to install the resulting executable and library files. It will usually produce a text file called a Makefile, that you can use to build the application.
    Useful flags:
      - --prefix -- allows a user to specify the directory to place outputs in once built.

  - make
    Is the unix command to take the information from the make file and using the resident compiler (usually gcc) build the application from the source libraries provided in the package. 
      - test -- a user can run make test to check that the program compile correctly.
      - clean -- a user can run make clean to clean up any leftovers from a prior failed build of the software.
      - install -- a user can have make install the binaries and libraries to the appropriate locations as defined by the configure -- prefix option.

- Building "ViennaRNA"
  - using our source code we downloaded on day two, run a checksum that the archive is intact
  - it should have the following checksum: 93297d5ee34567d5307bf537801fe381
  - nce we know it's good, extract the tar.gz archive
  - enter the extracted archive directory with cd
  - execute the configure program, with a prefix of $HOME
  - execute make on the newly generated makefile
  - make install
  - edit your path so that $HOME/bin is preferred
  - logout and back in to refresh ~/.bashrc
  - run which RNAfold to check

execute programggGgg
