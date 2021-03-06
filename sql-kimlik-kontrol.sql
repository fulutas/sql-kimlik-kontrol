﻿CREATE FUNCTION [dbo].[KIMLIKNO_KONTROL](@TcNo Bigint)
RETURNS BIT
AS
BEGIN
DECLARE @ATCNO Bigint
DECLARE @BTCNO Bigint
DECLARE @C1    Tinyint
DECLARE @C2    Tinyint
DECLARE @C3    Tinyint
DECLARE @C4    Tinyint
DECLARE @C5    Tinyint
DECLARE @C6    Tinyint
DECLARE @C7    Tinyint
DECLARE @C8    Tinyint
DECLARE @C9    Tinyint
DECLARE @Q1    Int
DECLARE @Q2    Int
DECLARE @SONUC Bit
SET @ATCNO = @TcNo / 100
SET @BTCNO = @TcNo / 100
IF LEN(CONVERT(VARCHAR(19),@TcNo)) = 11
BEGIN
SET @C1 = @ATCNO % 10 SET @ATCNO = @ATCNO / 10
SET @C2 = @ATCNO % 10 SET @ATCNO = @ATCNO / 10
SET @C3 = @ATCNO % 10 SET @ATCNO = @ATCNO / 10
SET @C4 = @ATCNO % 10 SET @ATCNO = @ATCNO / 10
SET @C5 = @ATCNO % 10 SET @ATCNO = @ATCNO / 10
SET @C6 = @ATCNO % 10 SET @ATCNO = @ATCNO / 10
SET @C7 = @ATCNO % 10 SET @ATCNO = @ATCNO / 10
SET @C8 = @ATCNO % 10 SET @ATCNO = @ATCNO / 10
SET @C9 = @ATCNO % 10 SET @ATCNO = @ATCNO / 10
SET @Q1 = ((10-((((@C1+@C3+@C5+@C7+@C9)*3)+(@C2+@C4+@C6+@C8)) %10))%10)
SET @Q2 = ((10-(((((@C2+@C4+@C6+@C8)+@Q1)*3)+(@C1+@C3+@C5+@C7+@C9))%10))%10)
IF (@BTCNO * 100)+(@Q1 * 10)+@Q2 = @TcNo SET @SONUC = 1 ELSE SET @SONUC= 0
END
ELSE SET @SONUC = 0
RETURN @SONUC…