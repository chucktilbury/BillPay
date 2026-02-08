# Bill Pay
Simple accounting based on Python, Sqlite, and Tkinter.

This is a simple program designed to help me organize my recurring bills and replace a spreadsheet. There is no real attempt at being a full double-entry accounting system. It just allows me to track where my money comes from and where it goes and allows me to create simple reports. This is developed on Debian flavored Linux and I have no need or intention to run it anywhere else. That having been said, it should work on any OS that has Python. This is based upon another repository of mine called Accounting. It's a fairly robust implemetation of forms for ``Tkinter`` and an abstract database for ``Sqlite3``. Every effort is made to reduce dependencies to only things that are shipped with Python in a default install. See at the end for dependencies. 

## Workflow
When the system is started the default database file is opened from the location of the executable. The user must have write permission to the directory where it is located. For me, that is ``~/bin`` and since I really don't expect any to really find this of any use, that suits me fine. If it bothers you then submit a bug via GIT. :)

The system has a menu that allows for operations related to the whole system, such as opening a different database file or backing up an existing database file. The menu system also has the entry points to operate on the tables that are shown below for ``Transactions``, ``Transaction Types``, and ``Accounts``.

* Upon startup, the ``home`` or ``root`` screen presents the availability to create a transaction.
* When the system is first installed, the user will need to create transaction types and accounts to support their needs.
* To create a transaction, the user will select a ``Type`` and enter a ``Description`` and an ``Amount``. The press the ``Commit`` button.
* To check the balances, the user will select ``Balances`` from ``Reports`` in the top menu and a scrolling list of balances will appear.

## Database
The database holds all historical and current data associated with the system. Below is a outline (WIP) of what the database contains and its function in the system.

### System
The system table has information about the current state of the system.

* Last Transaction Type -- Type of the last transaction. Used when the system is started to allow ease of use.
* Last Transaction Date -- Date of the last transaction.
* My Address -- My mailing address.

### Transactions
All entries into the database are transactions. There are 2 kinds of transactions, an input transaction and an output transaction. An output transaction subtracts from the input balance. A input transaction adds to it.

The software has the capability to create and delete transaction types and all transactions must be against an existing type.

#### Transaction type
This table holds the transaction types that are referenced by the ``transaction type attributes`` table. The actions associated with a transaction are tied to this table and so the ``action`` field has the name of an actual python function that implements the action.

This can be input, output, or something else. For example, a transaction is neither an input or an output if it only transfers funds from one account to another. Note that in the future, if we are printing checks, this will need to expand to include output destinations.

#### Transaction type
This controls what the transaction actually does in the system. If the add account ID is non-zero then the total from the transaction is added to the account. If the subtract account ID is non-zero then the total is subtracted from the specified account. One or both can be active, but it is not permissible to have neither one active. The ``action`` names an actual Python function that implements the logic for the transaction.

* Name -- This is the friendly name of the transaction. It should be one word.
* Description -- The description of the transaction type. Maybe describe what this transaction is supposed to actually do.
* Transaction Type -- Reference to the transaction type table.
* Add Account -- If the transaction is an input, then this is the account to add to. If the value is zero then ignore.
* Subtract Account -- If the transaction is an output, then this is the account to subtract from. If the value is zero then ignore.
* Transactions Count -- If there are transactions against this type then it cannot be deleted. This int is incremented when a transaction is committed against the type.
* Last Date -- The date of the most recent transaction that was committed against this type.
* Date Created -- The date that this type was created.
* Action -- The name of the Python function that implements the action for this transaction type.

#### Transactions attributes
A transaction occurs when funds move in the system. How the transaction is committed is controlled by the type.

* Transaction Type -- Points to an existing transaction type.
* Description -- Text that describes the transaction.
* Date -- The date of the transaction.
* Amount -- The amount of the transaction.
* Committed -- This boolean indicates whether the amount of the transaction has been added or subtracted according to the transaction type.

### Accounts and attributes
An account serves simply to hold totals of transactions.

* Name -- Friendly name of the account. Should be one word.
* Description -- Description of what tis account is supposed to do in the system.
* Amount -- The running total associated with the account.
* Last Date -- Date of the most recent transaction that accessed the account.
* Create Date -- Date the account was created.
* Priority -- Used to sort the accounts when the balances are displayed.

## Reports
Most reports are TBD, but at minimum, the balances of the accounts should be easy to check. Some kind of database query can be stored to generate reports. There should be some kind of mechanism in the UI to generate them.

* Display the balances. This displays all of the accounts with their name, description and current balance.
* Display transactions according to date. The idea is to display the transactions with a total so that we can know how to transfer actual money in the bank accounts.

## Dependencies
These are the dependencies for MX Linux 24. I have not tried other operating systems.

```
sudo apt install -y python3-tk python3-tktooltip python3-tktreectrl python3-ttkthemes pyinstaller
```
