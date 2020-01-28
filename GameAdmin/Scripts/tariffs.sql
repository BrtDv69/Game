/* Table: TARIFFS */

CREATE TABLE TARIFFS (
    ID INTEGER NOT NULL,
    NAME VARCHAR(100) NOT NULL,
    I_SPEED INTEGER NOT NULL,
    PRICE DOUBLE PRECISION NOT NULL,
    VALID INTEGER NOT NULL,
    IN_COUNT INTEGER DEFAULT 1 NOT NULL,
    COMMENTS VARCHAR(100),
    CHANGE_TIME TIMESTAMP DEFAULT 'now' NOT NULL);





/* Primary keys definition */

ALTER TABLE TARIFFS ADD PRIMARY KEY (ID);
/* Triggers definition */


SET TERM ^ ;





/* Trigger: TARIFFS_AU0 */
CREATE TRIGGER TARIFFS_AU0 FOR TARIFFS
ACTIVE AFTER UPDATE POSITION 0
as
begin
    insert into TRF_PRICE_CHANGES
   (CHANGE_TIME, OLD_VALUE, NEW_VALUE, TRF_ID)
  values
   ('now', old.PRICE, new.PRICE, new.ID);
end
^

/* Trigger: TARIFFS_BU0 */
CREATE TRIGGER TARIFFS_BU0 FOR TARIFFS
ACTIVE BEFORE UPDATE POSITION 0
as
begin
 NEW.CHANGE_TIME = 'now';
end
^


SET TERM ; ^