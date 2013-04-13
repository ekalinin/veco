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

    $ make install-local

Next, add the following lines to your ``~/.bashrc``::

    # set PATH so it includes user's private bin if it exists
    if [ -d "$HOME/bin" ] ; then
        PATH="$HOME/bin:$PATH"
    fi

Autocompletion can also be enabled in two ways.
Global::

    $ sudo make install-completion

Local::

    $ make install-completion-local

Next, add the following lines to your ``~/.bashrc``::

    if [ -f "$HOME/bash_completion.d/vc" ] ; then
        . $HOME/bash_completion.d/vc
    fi


How to use
----------

Show all commands, which **veco** supports::

    $ vc list-commands 
    installed
    push
    switch
    create-ignorefile
    commit-and-push
    merge
    help
    branch
    branches
    list-commands
    commit
    version
    blame
    add
    type
    init
    status
    qstat
    diff
    rm
    log
    clone
    revert
    up


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

Here is one example of the veco's usage (custom bash prompt):

.. image:: https://raw.github.com/ekalinin/veco/master/bash_prompt/bash-promp-example.png

Full example text see in bash_promp_ directory.

.. _bash_prompt: https://github.com/ekalinin/veco/tree/master/bash_prompt


Dependencies
------------

**Veco** depends on only one third-party script — ``colordiff``.
(You can easy install it, for example: ``sudo apt-get install colordiff``)

This dependency is optional. If ``colordiff`` is not installed then
for ``git`` will be used native color output and for others there
will be no color output.


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
