TARGET	=	billpay
DEPS	=	main.py \
			system/database.py \
			system/forms.py \
			system/logger.py \
			system/notebook.py \
			forms/trans_forms.py \
			forms/setup_forms.py \
			forms/report_forms.py \
			dialogs/base_dialog.py \
			dialogs/edit_dialogs.py \
			dialogs/select_dialog.py \
			dialogs/text_dialog.py \
			policy/transaction.py \
			widgets/form_widgets.py \
			widgets/search_widget.py

all: $(TARGET)

data:
	make -C sql

$(TARGET): $(DEPS) data
	pyinstaller -F -n $(TARGET) main.py

clean:
	-rm -rf *.spec *.db \
		dist/ \
		build/ \
		system/__pycache__/ \
		forms/__pycache__/ \
		dialogs/__pycache__/ \
		policy/__pycache__/ \
		widgets/__pycache__/ \
		__pycache__/
	make -C sql clean