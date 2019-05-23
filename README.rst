=================
Saltstack Examples
=================

Saltstack examples using Vagrant and Docker.


Instructions
============

Run the following commands in a terminal. Git, VirtualBox and Vagrant must
already be installed.

.. code-block:: bash

    git clone https://github.com/theodesp/saltstack-example.git
    cd saltstack-example
    vagrant up


This will download an Ubuntu  VirtualBox image and create three virtual
machines for you. One will be a Salt Master named `master` and two will be Salt
Minions named `minion1` and `minion2`.  The Salt Minions will point to the Salt
Master and the Minion's keys will already be accepted. Because the keys are
pre-generated and reside in the repo, please be sure to regenerate new keys if
you use this for production purposes.

You can then run the following commands to log into the Salt Master and begin
using Salt.

.. code-block:: bash

    vagrant ssh master
    sudo salt \* test.ping


To use with Docker just run

.. code-block:: bash

    docker-compose up -d
    docker-compose scale salt-minion=2
    docker exec salt-master salt "*" test.ping

To use with Terraform navigate to the `terraform` folder and follow the instruction on the readme.

To use with Packer navigate to the `packer` folder and follow the instruction on the readme.
