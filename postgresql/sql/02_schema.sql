CREATE TABLE POSITION
(
  POSITION_ID bigint NOT NULL,
  SYMBOL CHAR(6) NOT NULL,
  TRADED_AMOUNT bigint,
  COUNTER_TRADED_AMOUNT bigint,
  PNL bigint,
  REFERENCE_PNL bigint,
  TIME TIMESTAMP NOT NULL
);

CREATE SEQUENCE POSITION_SEQ START WITH 10 INCREMENT BY 1 CACHE 1;

CREATE FUNCTION TRIGGER_INSERT_POSITION_ID () RETURNS TRIGGER
  AS
  $BODY$
DECLARE
BEGIN
  if (NEW.POSITION_ID is null) then
      NEW.POSITION_ID = nextval
  ('POSITION_SEQ');
end
if;
    RETURN NEW;
END
  $BODY$
  LANGUAGE 'plpgsql';


CREATE TRIGGER insert_position_id
  BEFORE
INSERT ON
POSITION
FOR
EACH
ROW
EXECUTE PROCEDURE TRIGGER_INSERT_POSITION_ID
();

ALTER TABLE ONLY POSITION
ADD CONSTRAINT PK_POSITION PRIMARY KEY
(POSITION_ID);

CREATE UNIQUE INDEX UX_POSITION_SYMBOL_TIME ON POSITION(SYMBOL, TIME);
