drop TABLE if exists s1;
CREATE TABLE s1
(
    id UInt8,
    attribute1 String,
    valid_from_dttm DateTime('UTC'),
    valid_to_dttm DateTime('UTC')
)
ENGINE = TinyLog;