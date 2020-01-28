{ ************************************************ }
{ *                                              * }
{ *  Example of using Guardant protection        * }
{ *                                              * }
{ *   Created with Guardant SRC Generator beta 1 * }
{ ************************************************ }

{ -- Source sections --- }
{ -- insert it to the corresponding parts of your own source -- }
{ -- Compatible with Delphi 32-bit language -- }

function m2_CheckSTEALTHKey() : Integer;
{ -- Data section -------------------------- }
var
    szTmp : string[20];
    m2_PrivRD : longint;
    { ----- Variables ----- }
    i : Integer;
    m2_dwPubCode : longint;
    m2_dwFlags : longint;
    dwDongle : longint;
    m2_wType : word;
    m2_nNum : longint;
    m2_dwRes : longint;
    m2_dwPassword : array[0..8-1] of longint;
    m2_adwSrc0 : array[0..32-1] of longint;
    m2_adwSrc1 : array[0..32-1] of longint;
    m2_adwAddGS : array[0..32-1] of longint;
    m2_sTabPass : array[0..32-1] of byte;
    m2_sCodePass : array[0..32-1] of byte;
    m2_cbEncData : array[0..64-1] of byte;
    m2_nRet : longint;
    {  Temporary variables }
    m2_dwTmp0 : longint;
    m2_dwTmp1 : longint;
    m2_dwTmp2 : longint;
    m2_dwTmp3 : longint;

    { -- Code section --------------------------- }
    begin

        for i := 0 to (8 - 1) do begin
            m2_dwPassword[ i ] := 0;
        end; { of FOR }
        { =====================Reinit key code======================= }
        m2_PrivRD := -1729329233;
        m2_dwPubCode := 1740057516;
        m2_dwFlags := 0;
        m2_wType := 0;
        { Reinit m2_adwSrc0 Table }
        m2_adwSrc0[ 0 ] := -892926236;
        m2_adwSrc0[ 1 ] := -1425763183;
        m2_adwSrc0[ 2 ] := 734639236;
        m2_adwSrc0[ 3 ] := -304812829;
        m2_adwSrc0[ 4 ] := 1086114606;
        m2_adwSrc0[ 5 ] := -612184223;
        m2_adwSrc0[ 6 ] := -91230629;
        m2_adwSrc0[ 7 ] := -895169261;
        m2_adwSrc0[ 8 ] := -1032392626;
        m2_adwSrc0[ 9 ] := -2013364457;
        m2_adwSrc0[ 10 ] := -1188617958;
        m2_adwSrc0[ 11 ] := 1204787215;
        m2_adwSrc0[ 12 ] := -32669784;
        m2_adwSrc0[ 13 ] := -1364266835;
        m2_adwSrc0[ 14 ] := 388137405;
        m2_adwSrc0[ 15 ] := -1912597993;
        m2_adwSrc0[ 16 ] := -1624532360;
        m2_adwSrc0[ 17 ] := 114116485;
        m2_adwSrc0[ 18 ] := -1283848228;
        m2_adwSrc0[ 19 ] := -1173272029;
        m2_adwSrc0[ 20 ] := -1897353926;
        m2_adwSrc0[ 21 ] := -639827011;
        m2_adwSrc0[ 22 ] := 981688243;
        m2_adwSrc0[ 23 ] := -1912597993;
        m2_adwSrc0[ 24 ] := -1624532360;
        m2_adwSrc0[ 25 ] := 114116485;
        m2_adwSrc0[ 26 ] := -1283848228;
        m2_adwSrc0[ 27 ] := -1173272029;
        m2_adwSrc0[ 28 ] := -1897353926;
        m2_adwSrc0[ 29 ] := -639827011;
        m2_adwSrc0[ 30 ] := 981688243;
        m2_adwSrc0[ 31 ] := -1912597993;
        { Reinit m2_adwSrc1 Table }
        m2_adwSrc1[ 0 ] := 263266204;
        m2_adwSrc1[ 1 ] := 1728176254;
        m2_adwSrc1[ 2 ] := -471651596;
        m2_adwSrc1[ 3 ] := -12080035;
        m2_adwSrc1[ 4 ] := -799312998;
        m2_adwSrc1[ 5 ] := -273795597;
        m2_adwSrc1[ 6 ] := -2079869651;
        m2_adwSrc1[ 7 ] := -2050875009;
        m2_adwSrc1[ 8 ] := 2132523790;
        m2_adwSrc1[ 9 ] := 884068362;
        m2_adwSrc1[ 10 ] := 752689136;
        m2_adwSrc1[ 11 ] := -227387533;
        m2_adwSrc1[ 12 ] := 1604643994;
        m2_adwSrc1[ 13 ] := -1328332647;
        m2_adwSrc1[ 14 ] := -371395941;
        m2_adwSrc1[ 15 ] := -126932156;
        m2_adwSrc1[ 16 ] := -1757417945;
        m2_adwSrc1[ 17 ] := -985918487;
        m2_adwSrc1[ 18 ] := 1464974017;
        m2_adwSrc1[ 19 ] := -2106696984;
        m2_adwSrc1[ 20 ] := 1374522397;
        m2_adwSrc1[ 21 ] := 1746491864;
        m2_adwSrc1[ 22 ] := 923800048;
        m2_adwSrc1[ 23 ] := -126932156;
        m2_adwSrc1[ 24 ] := -1757417945;
        m2_adwSrc1[ 25 ] := -985918487;
        m2_adwSrc1[ 26 ] := 1464974017;
        m2_adwSrc1[ 27 ] := -2106696984;
        m2_adwSrc1[ 28 ] := 1374522397;
        m2_adwSrc1[ 29 ] := 1746491864;
        m2_adwSrc1[ 30 ] := 923800048;
        m2_adwSrc1[ 31 ] := -126932156;
        { Reinit m2_adwAddGS Table }
        m2_adwAddGS[ 0 ] := 1604319500;
        m2_adwAddGS[ 1 ] := -149069258;
        m2_adwAddGS[ 2 ] := 383647122;
        m2_adwAddGS[ 3 ] := -19553;
        m2_adwAddGS[ 4 ] := -379630218;
        m2_adwAddGS[ 5 ] := 1863081952;
        m2_adwAddGS[ 6 ] := -2132346282;
        m2_adwAddGS[ 7 ] := -635146265;
        m2_adwAddGS[ 8 ] := 1498389195;
        m2_adwAddGS[ 9 ] := -1656492014;
        m2_adwAddGS[ 10 ] := -133548964;
        m2_adwAddGS[ 11 ] := -186448912;
        m2_adwAddGS[ 12 ] := -1711932014;
        m2_adwAddGS[ 13 ] := 298843538;
        m2_adwAddGS[ 14 ] := 512362693;
        m2_adwAddGS[ 15 ] := 1546477345;
        m2_adwAddGS[ 16 ] := 1546477345;
        m2_adwAddGS[ 17 ] := 1546477345;
        m2_adwAddGS[ 18 ] := 1546477345;
        m2_adwAddGS[ 19 ] := 1546477345;
        m2_adwAddGS[ 20 ] := 1546477345;
        m2_adwAddGS[ 21 ] := 1546477345;
        m2_adwAddGS[ 22 ] := 1546477345;
        m2_adwAddGS[ 23 ] := 1546477345;
        m2_adwAddGS[ 24 ] := 1546477345;
        m2_adwAddGS[ 25 ] := 1546477345;
        m2_adwAddGS[ 26 ] := 1546477345;
        m2_adwAddGS[ 27 ] := 1546477345;
        m2_adwAddGS[ 28 ] := 1546477345;
        m2_adwAddGS[ 29 ] := 91675826;
        m2_adwAddGS[ 30 ] := 204100946;
        m2_adwAddGS[ 31 ] := -904915972;
        { Init m2_sTabPass table }
        m2_sTabPass[ 0 ] := 191;
        m2_sTabPass[ 1 ] := 68;
        m2_sTabPass[ 2 ] := 207;
        m2_sTabPass[ 3 ] := 51;
        m2_sTabPass[ 4 ] := 253;
        m2_sTabPass[ 5 ] := 193;
        m2_sTabPass[ 6 ] := 176;
        m2_sTabPass[ 7 ] := 59;
        m2_sTabPass[ 8 ] := 49;
        m2_sTabPass[ 9 ] := 81;
        m2_sTabPass[ 10 ] := 178;
        m2_sTabPass[ 11 ] := 207;
        m2_sTabPass[ 12 ] := 171;
        m2_sTabPass[ 13 ] := 39;
        m2_sTabPass[ 14 ] := 75;
        m2_sTabPass[ 15 ] := 228;
        m2_sTabPass[ 16 ] := 80;
        m2_sTabPass[ 17 ] := 88;
        m2_sTabPass[ 18 ] := 229;
        m2_sTabPass[ 19 ] := 73;
        m2_sTabPass[ 20 ] := 221;
        m2_sTabPass[ 21 ] := 15;
        m2_sTabPass[ 22 ] := 188;
        m2_sTabPass[ 23 ] := 5;
        m2_sTabPass[ 24 ] := 220;
        m2_sTabPass[ 25 ] := 104;
        m2_sTabPass[ 26 ] := 141;
        m2_sTabPass[ 27 ] := 45;
        m2_sTabPass[ 28 ] := 65;
        m2_sTabPass[ 29 ] := 180;
        m2_sTabPass[ 30 ] := 77;
        m2_sTabPass[ 31 ] := 162;
        { Init m2_sCodePass table }
        m2_sCodePass[ 0 ] := 180;
        m2_sCodePass[ 1 ] := 126;
        m2_sCodePass[ 2 ] := 4;
        m2_sCodePass[ 3 ] := 130;
        m2_sCodePass[ 4 ] := 87;
        m2_sCodePass[ 5 ] := 124;
        m2_sCodePass[ 6 ] := 23;
        m2_sCodePass[ 7 ] := 166;
        m2_sCodePass[ 8 ] := 186;
        m2_sCodePass[ 9 ] := 123;
        m2_sCodePass[ 10 ] := 225;
        m2_sCodePass[ 11 ] := 42;
        m2_sCodePass[ 12 ] := 138;
        m2_sCodePass[ 13 ] := 123;
        m2_sCodePass[ 14 ] := 228;
        m2_sCodePass[ 15 ] := 99;
        m2_sCodePass[ 16 ] := 124;
        m2_sCodePass[ 17 ] := 4;
        m2_sCodePass[ 18 ] := 49;
        m2_sCodePass[ 19 ] := 32;
        m2_sCodePass[ 20 ] := 37;
        m2_sCodePass[ 21 ] := 162;
        m2_sCodePass[ 22 ] := 19;
        m2_sCodePass[ 23 ] := 178;
        m2_sCodePass[ 24 ] := 3;
        m2_sCodePass[ 25 ] := 117;
        m2_sCodePass[ 26 ] := 188;
        m2_sCodePass[ 27 ] := 129;
        m2_sCodePass[ 28 ] := 113;
        m2_sCodePass[ 29 ] := 59;
        m2_sCodePass[ 30 ] := 51;
        m2_sCodePass[ 31 ] := 225;
        { Init m2_cbEncData table }
        m2_cbEncData[ 0 ] := 184;
        m2_cbEncData[ 1 ] := 79;
        m2_cbEncData[ 2 ] := 50;
        m2_cbEncData[ 3 ] := 103;
        m2_cbEncData[ 4 ] := 148;
        m2_cbEncData[ 5 ] := 75;
        m2_cbEncData[ 6 ] := 41;
        m2_cbEncData[ 7 ] := 65;
        m2_cbEncData[ 8 ] := 110;
        m2_cbEncData[ 9 ] := 62;
        m2_cbEncData[ 10 ] := 75;
        m2_cbEncData[ 11 ] := 98;
        m2_cbEncData[ 12 ] := 78;
        m2_cbEncData[ 13 ] := 16;
        m2_cbEncData[ 14 ] := 22;
        m2_cbEncData[ 15 ] := 240;
        m2_cbEncData[ 16 ] := 154;
        m2_cbEncData[ 17 ] := 242;
        m2_cbEncData[ 18 ] := 120;
        m2_cbEncData[ 19 ] := 183;
        m2_cbEncData[ 20 ] := 28;
        m2_cbEncData[ 21 ] := 26;
        m2_cbEncData[ 22 ] := 73;
        m2_cbEncData[ 23 ] := 134;
        m2_cbEncData[ 24 ] := 13;
        m2_cbEncData[ 25 ] := 245;
        m2_cbEncData[ 26 ] := 60;
        m2_cbEncData[ 27 ] := 224;
        m2_cbEncData[ 28 ] := 41;
        m2_cbEncData[ 29 ] := 42;
        m2_cbEncData[ 30 ] := 18;
        m2_cbEncData[ 31 ] := 107;
        m2_cbEncData[ 32 ] := 80;
        m2_cbEncData[ 33 ] := 112;
        m2_cbEncData[ 34 ] := 128;
        m2_cbEncData[ 35 ] := 186;
        m2_cbEncData[ 36 ] := 83;
        m2_cbEncData[ 37 ] := 240;
        m2_cbEncData[ 38 ] := 14;
        m2_cbEncData[ 39 ] := 133;
        m2_cbEncData[ 40 ] := 42;
        m2_cbEncData[ 41 ] := 6;
        m2_cbEncData[ 42 ] := 101;
        m2_cbEncData[ 43 ] := 86;
        m2_cbEncData[ 44 ] := 199;
        m2_cbEncData[ 45 ] := 40;
        m2_cbEncData[ 46 ] := 218;
        m2_cbEncData[ 47 ] := 128;
        m2_cbEncData[ 48 ] := 33;
        m2_cbEncData[ 49 ] := 19;
        m2_cbEncData[ 50 ] := 73;
        m2_cbEncData[ 51 ] := 9;
        m2_cbEncData[ 52 ] := 165;
        m2_cbEncData[ 53 ] := 26;
        m2_cbEncData[ 54 ] := 73;
        m2_cbEncData[ 55 ] := 28;
        m2_cbEncData[ 56 ] := 8;
        m2_cbEncData[ 57 ] := 50;
        m2_cbEncData[ 58 ] := 15;
        m2_cbEncData[ 59 ] := 133;
        m2_cbEncData[ 60 ] := 49;
        m2_cbEncData[ 61 ] := 148;
        m2_cbEncData[ 62 ] := 41;
        m2_cbEncData[ 63 ] := 238;
        m2_nRet := 0;
        { ---- Decoding m2_PrivRD }
        m2_nRet := nskDeCode ( 0, @m2_sCodePass , @m2_PrivRD , 4  );
        if ( m2_nRet <> 0 ) then begin
            m2_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { ------------------------------------------- }

        { ---- Decoding m2_dwPubCode }
        m2_nRet := nskDeCode ( 0, @m2_sCodePass , @m2_dwPubCode , 4  );
        if ( m2_nRet <> 0 ) then begin
            m2_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { ------------------------------------------- }

        nskSetMode ( 25, 1, 0, 0, 1, 1, 0 );
        m2_dwRes := random(65535) ;
        m2_nNum := m2_dwRes ;
        { -------------------------------------------- }
        {m2_nNum := m2_nNum mod 32;}
        m2_nNum := GetMod(m2_nNum,32);
        m2_dwTmp0 := nskCRC ( @m2_PrivRD , 4, -1 );
        if ( m2_dwTmp0 <> 1417686703 ) then begin
            m2_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        m2_dwTmp0 := nskCRC ( @m2_adwAddGS , 128, -1 );
        if ( m2_dwTmp0 <> -1346498534 ) then begin
            m2_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { ---- Decoding m2_adwSrc0 }
        { -- Init password m2_sTabPass }
        m2_nRet  := nskCodeInit  ( m2_PrivRD, 0, 1, @m2_sTabPass   );
        if ( m2_nRet <> 0 ) then begin
            m2_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { -- Decode data }
        m2_nRet := nskDeCode ( 0, @m2_sTabPass , @m2_adwSrc0 , 128  );
        if ( m2_nRet <> 0 ) then begin
            m2_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { ------------------------------------------- }

        m2_dwRes := m2_adwSrc0[ m2_nNum ];
        m2_dwTmp0 := nskCRC ( @m2_adwSrc0 , 128, -1 );
        if ( m2_dwTmp0 <> 1096811496 ) then begin
            m2_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }

        { ------- Transform function -------- }
        m2_dwTmp1 := m2_nNum + 3;
        {m2_dwTmp1 := m2_dwTmp1 mod 32;}
        m2_dwTmp1 := GetMod(m2_dwTmp1,32);
        m2_dwTmp1 := m2_adwSrc0[ m2_dwTmp1 ];
        {-- XOR operation --}
        m2_dwTmp1:=m2_dwTmp1 xor 189861426;
        {-- XOR operation --}
        m2_dwRes:=m2_dwRes xor m2_dwTmp1;
        m2_dwTmp3 := m2_dwRes + m2_dwRes;
        {-- XOR operation --}
        m2_dwRes:=m2_dwRes xor m2_dwTmp3;
        m2_dwTmp1 := 189861426 - m2_dwRes;
        m2_dwRes := m2_dwRes * m2_dwTmp1;
        m2_dwTmp3 := m2_nNum + 3;
        {m2_dwTmp3 := m2_dwTmp3 mod 32;}
        m2_dwTmp3 := GetMod(m2_dwTmp3,32);
        m2_dwTmp3 := m2_adwSrc0[ m2_dwTmp3 ];
        m2_dwTmp3 := m2_dwTmp3  * 189861426;
        m2_dwRes := m2_dwRes * m2_dwTmp3;
        m2_dwTmp3 := m2_nNum + 3;
        {m2_dwTmp3 := m2_dwTmp3 mod 32;}
        m2_dwTmp3 := GetMod(m2_dwTmp3,32);
        m2_dwTmp3 := m2_adwSrc0[ m2_dwTmp3 ];
        m2_dwTmp3 := m2_dwTmp3 + 189861426;
        m2_dwRes := m2_dwRes * m2_dwTmp3;
        {-- XOR operation --}
        m2_dwTmp2:=m2_PrivRD xor m2_dwRes;
        m2_dwRes := m2_dwRes + m2_dwTmp2;
        m2_dwTmp2 := m2_dwRes  * m2_PrivRD;
        m2_dwRes := m2_dwRes - m2_dwTmp2;
        m2_dwTmp2 := m2_nNum + 3;
        {m2_dwTmp2 := m2_dwTmp2 mod 32;}
        m2_dwTmp2 := GetMod(m2_dwTmp2,32);
        m2_dwTmp2 := m2_adwSrc0[ m2_dwTmp2 ];
        m2_dwTmp2 := m2_dwTmp2 - 189861426;
        m2_dwRes := m2_dwRes - m2_dwTmp2;
        { ---- Encoding m2_adwSrc0 }
        m2_nRet := nskEnCode ( 0, @m2_sTabPass , @m2_adwSrc0 , 128  );
        { ------------------------------------------- }

        m2_nRet := nskTransform ( m2_PrivRD, 0, 4, @m2_dwRes   );
        if ( m2_nRet <> 0 ) then begin
            m2_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { --------- End of Transform Function ------------ }
        { ---- Decoding m2_adwSrc1 }
        { -- Init password m2_sTabPass }
        m2_nRet  := nskCodeInit  ( m2_PrivRD, 0, 1, @m2_sTabPass   );
        if ( m2_nRet <> 0 ) then begin
            m2_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { -- Decode data }
        m2_nRet := nskDeCode ( 0, @m2_sTabPass , @m2_adwSrc1 , 128  );
        if ( m2_nRet <> 0 ) then begin
            m2_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { ------------------------------------------- }

        m2_dwTmp0 := nskCRC ( @m2_adwSrc1 , 128, -1 );
        if ( m2_dwTmp0 <> -892288286 ) then begin
            m2_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }

        { ------- Transform function -------- }
        m2_dwTmp0 := m2_PrivRD + m2_dwRes;
        {-- XOR operation --}
        m2_dwRes:=m2_dwRes xor m2_dwTmp0;
        m2_dwTmp0 := m2_nNum + 3;
        {m2_dwTmp0 := m2_dwTmp0 mod 32;}
        m2_dwTmp0 := GetMod(m2_dwTmp0,32);
        m2_dwTmp0 := m2_adwSrc1[ m2_dwTmp0 ];
        m2_dwTmp0 := m2_dwTmp0  * m2_PrivRD;
        m2_dwRes := m2_dwRes * m2_dwTmp0;
        { ---- Encoding m2_adwSrc1 }
        m2_nRet := nskEnCode ( 0, @m2_sTabPass , @m2_adwSrc1 , 128  );
        { ------------------------------------------- }

        m2_nRet := nskTransform ( m2_PrivRD, 0, 4, @m2_dwRes   );
        if ( m2_nRet <> 0 ) then begin
            m2_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { --------- End of Transform Function ------------ }
        m2_dwTmp1 := m2_adwAddGS[ m2_nNum ];
        m2_dwRes := m2_dwRes + m2_dwTmp1;
        {  Creating Password for data decryption }
        for i := 0 to (8 - 1) do begin
            {-- ROL operation --}
            m2_dwTmp1:=(m2_dwRes shl i) or (m2_dwRes shr (32-i));
            m2_dwTmp2 := i + 2;
            {-- ROR operation --}
            m2_dwTmp2:=(m2_dwRes shr m2_dwTmp2) or (m2_dwRes shl (32-m2_dwTmp2));
            {-- XOR operation --}
            m2_dwTmp1:=m2_dwTmp2 xor m2_dwTmp1;
            m2_dwPassword[ i ] := m2_dwTmp1;
        end; { of FOR }
        { ---- Decode main buffer using password ---- }
        m2_nRet := nskDeCode ( 0, @m2_dwPassword , @m2_cbEncData , 64  );
        m2_dwRes := nskCRC ( @m2_cbEncData , 64, -1 );
        if ( m2_dwRes <> 648099488 ) then begin
            m2_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        m2_nRet := nskEnCode ( 0, @m2_dwPassword , @m2_cbEncData , 64  );
        m2_CheckSTEALTHKey := 0;
        Exit;
    end;
