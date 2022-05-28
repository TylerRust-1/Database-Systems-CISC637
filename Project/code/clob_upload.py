import cx_Oracle
import logging
import os

logging.basicConfig(level = logging.INFO)

FILE_PATH = 'clobs'
CONN_STR = os.getenv("CONN_STR")

# Make sure connection string is set up in environment variables
# Format looks like: C##_UD_XXX/C##_UD_XXX@35.172.227.182:1521/DEV
if CONN_STR == None:
    logging.error("Must define connection string for Oracle in environment variables")
    exit(1)

try:
    # Set up Oracle connection
    con = cx_Oracle.connect(CONN_STR)
    cursor = con.cursor()
    # Open image file, read the bytes, then insert it into document table
    counter = 1
    try:
        with os.scandir(FILE_PATH) as folder:
            for file in folder:
                with open (file.path, 'r', encoding="utf8") as f:
                    file_data = f.read()
                    # TODO: Other info: file_length, file_path, etc.
                    # TODO: Trigger on document_id to ensure its GUID
                    cursor.execute("""insert into rsme_clob (rsme_id, rsme_obj) \
                                      values (:rsmeid, :rsmeobj)""", rsmeid=str(counter+1), rsmeobj=file_data)
                    f.close()
                    con.commit()
                    counter += 1
    except OSError as error:
        logging.error("Unable to read file %s due to: %s", FILE_PATH, error)
    # Return rows
    cursor.execute("select * from rsme_clob")
    rows = cursor.fetchall()
    logging.info("Successfully inserted documents")
except cx_Oracle.DatabaseError as e:
    logging.error("Oracle exception: %s", e)
except AssertionError as e:
    logging.error("Not all documents inserted")
finally:
    # Close Oracle connection
    if cursor:
        cursor.close()
    if con:
        con.close()