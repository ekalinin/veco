Veco — Wrapper for the most popular version control systems
===========================================================

**Veco** — is a set of shell-scripts to standardize and facilitate
the work in the console with the basic version control systems.

Why
---

Sooner or later, every developer is faced with a problem, if you
work on multiple projects, each of which is controlled by
different version control systems.

"Switch" between such projects can sometimes become a problem,
as the developer begins to confuse the names of commands. The main
purpose of the **veco** is to free you from having to switch between
different commands of the different version control systems.

**Veco** provides a single point of entry and the same commands for
the basic version control systems. At the same time, do not lose the
opportunity to "forwarding" the relevant options for a particular
implementation of a command for each version control system.


How to install
--------------

First of all, you need to download the repository itself::

    $ git clone git@github.com:ekalinin/veco.git
    $ cd veco

If you want to global install (for all users), then execute the
following command::

    $ sudo make install

If you want to install only for one specific user (for example,
just do not have root-rights), then do the following::

    $ make install prefix=$HOME

Autocompletion can also be enabled in two ways.
Global::

    $ sudo cp ./bash_completion/vc /etc/bash_completion.d

Local::

    $ echo ". `pwd`/bash_completion/vc" >> ~/.bashrc


How to use
----------

Show all commands, which **veco** supports::

    $ vc commands 
    commit
    log
    push
    create-ignorefile
    installed
    add
    type
    up
    merge
    status
    version
    commands
    diff


To find out what version control systems are installed in the system,
and which of them can be operated with **veco**, do the following::

    $ vc installed 
    svn
    hg
    git

To find out what version control system used in the current directory,
do the following::

    $ vc type
    git

With the rest of the commands should be no problems, as their names speak
for themselves. Here is an example of a typical session::

    $ vc status
    $ vc diff
    $ vc add vc-commit vc-installed vc-log vc-merge vc-push vc-up
    $ vc diff --staged
    $ vc commit -m "0.3.0: added commands: commit/push/installed/log/merge/up"
    $ vc push


Dependencies
------------

**Veco** depends on only one third-party script — ``colordiff``.


Supported version control systems
---------------------------------

At the moment **veco** is tested to work with the following systems:

  * subversion / svn
  * mercurial / hg
  * git


Acknowledgements
----------------

I want to thank `@nvie`_ for his project `gitflow`_. The basic idea
for the implementation of the commands is taken from this project.

.. _@nvie: https://github.com/nvie
.. _gitflow: https://github.com/nvie/gitflow


License
-------

MIT (see LICENSE_).

.. _LICENSE: https://github.com/ekalinin/veco/blob/master/LICENSE
