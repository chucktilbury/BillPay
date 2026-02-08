from system.forms import Forms
from system.logger import *
from dialogs.text_dialog import *
from dialogs.select_dialog import *

@class_wrapper
class TransactionTypesForm(Forms):
    '''
    Create the form for the Business tab under Setup.
    '''

    def __init__(self, notebook):
        self.logger.set_level(Logger.DEBUG)

        index = notebook.get_tab_index('Transaction Type')
        super().__init__(notebook.frame_list[index]['frame'], 'TransType', columns=4)
        notebook.frame_list[index]['show_cb'] = self.load_form

        wid = 50

        self.add_title('Transaction Type Setup Form')
        self.add_label('Name:')
        self.add_entry('name', 3, str)

        self.add_label('Action:')
        self.add_combo('action', 3, 'Action', 'function')

        self.add_label('Description:')
        self.add_entry('description', 3, str, width=wid)

        self.add_ctl_button('Prev')
        self.add_ctl_button('Next')
        self.add_btn_spacer()
        self.add_select_button(SelectDialog, owner=self.owner ,table=self.table, column='name')
        self.add_ctl_button('New', new_flag=True)
        self.add_ctl_button('Clear')
        self.add_ctl_button('Save')
        self.add_ctl_button('Delete')
        self.add_btn_spacer()

@class_wrapper
class AccountsForm(Forms):

    def __init__(self, notebook):
        self.logger.set_level(Logger.DEBUG)

        index = notebook.get_tab_index('Accounts')
        super().__init__(notebook.frame_list[index]['frame'], 'Account', columns=2)
        notebook.frame_list[index]['show_cb'] = self.load_form

        wid = 52
        self.add_title('Accounts Setup Form')

        self.add_label('Name:')
        self.add_entry('name', 1, str)

        self.add_label('Balance:')
        self.add_entry('amount', 1, float)

        self.add_label('Priority:')
        self.add_entry('priority', 1, int)

        self.add_label('Description:')
        self.add_entry('description', 1, str, width=wid)

        self.add_ctl_button('Prev')
        self.add_ctl_button('Next')
        self.add_btn_spacer()
        self.add_select_button(SelectDialog, owner=self.owner ,table=self.table, column='name')
        self.add_ctl_button('New', new_flag=True)
        self.add_ctl_button('Clear')
        self.add_ctl_button('Save')
        self.add_ctl_button('Delete')

