Bind9
=========

Installs and configures the Bind9 server. Uses "meta" dependency to install the
Bind server itself. This role does only the local configuration specific for this
particular environment. This is not an general purpose role.

Requirements
------------



Role Variables
--------------



Dependencies
------------

- dzintars.ansible.bind

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------



Author Information
------------------

Dzintars Klavins
