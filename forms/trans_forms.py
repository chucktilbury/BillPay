from system.forms import Forms
from system.logger import *
from dialogs.edit_dialogs import *
from dialogs.select_dialog import *

@class_wrapper
class TransactionsForm(Forms):

    def __init__(self, notebook):
        self.logger.set_level(Logger.DEBUG)

        index = notebook.get_tab_index('Transactions')
        self.logger.debug('tab index = %d'%(index))
        super().__init__(notebook.frame_list[index]['frame'], 'Account')
        notebook.frame_list[index]['show_cb'] = self.load_form

        width1 = 70
        width2 = 28

        self.add_title('Run a transaction')