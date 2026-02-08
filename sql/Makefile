TARGET	=	billpay.db
DEPS	=	database.sql

all: $(TARGET)

$(TARGET): $(DEPS) clean
	sqlite3 $(TARGET) < $(DEPS)
	cp $(TARGET) ..

clean:
	-rm -rf $(TARGET) ../$(TARGET)
