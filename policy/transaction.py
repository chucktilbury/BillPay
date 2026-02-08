from tkinter.messagebox import showwarning, showerror, showinfo
from system.database import Database
from system.logger import *

@class_wrapper
class Transactions(object):
    '''
    This class Implements the transactions for the system.
    '''

    def __init__(self):
        '''
        This class implements the transactions for the system. The names that
        appear in this class are referenced by the database to actually enter
        the code.
        '''

