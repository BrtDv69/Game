{ ************************************************ }
{ *                                              * }
{ *  Example of using Guardant protection        * }
{ *                                              * }
{ *   Created with Guardant SRC Generator beta 1 * }
{ ************************************************ }

{ -- Source sections --- }
{ -- insert it to the corresponding parts of your own source -- }
{ -- Compatible with Delphi 32-bit language -- }

function m1_CheckSTEALTHKey() : Integer;
{ -- Data section -------------------------- }
var
    szTmp : string[20];
    m1_PrivRD : longint;
    { ----- Variables ----- }
    i : Integer;
    m1_dwPubCode : longint;
    m1_dwFlags : longint;
    dwDongle : longint;
    m1_wType : word;
    m1_nNum : longint;
    m1_dwRes : longint;
    m1_dwPassword : array[0..8-1] of longint;
    m1_adwSrc0 : array[0..32-1] of longint;
    m1_adwSrc1 : array[0..32-1] of longint;
    m1_adwAddGS : array[0..32-1] of longint;
    m1_sTabPass : array[0..32-1] of byte;
    m1_sCodePass : array[0..32-1] of byte;
    m1_cbEncData : array[0..68-1] of byte;
    m1_nRet : longint;
    {  Temporary variables }
    m1_dwTmp0 : longint;
    m1_dwTmp1 : longint;
    m1_dwTmp2 : longint;
    m1_dwTmp3 : longint;

    { -- Code section --------------------------- }
    begin

        for i := 0 to (8 - 1) do begin
            m1_dwPassword[ i ] := 0;
        end; { of FOR }
        { =====================Reinit key code======================= }
        m1_PrivRD := 1262958463;
        m1_dwPubCode := -1273193604;
        m1_dwFlags := 0;
        m1_wType := 0;
        { Reinit m1_adwSrc0 Table }
        m1_adwSrc0[ 0 ] := 1443402104;
        m1_adwSrc0[ 1 ] := -157577224;
        m1_adwSrc0[ 2 ] := -1753556888;
        m1_adwSrc0[ 3 ] := -1674022602;
        m1_adwSrc0[ 4 ] := 1697714299;
        m1_adwSrc0[ 5 ] := -466791766;
        m1_adwSrc0[ 6 ] := 286953943;
        m1_adwSrc0[ 7 ] := -447529599;
        m1_adwSrc0[ 8 ] := 255786360;
        m1_adwSrc0[ 9 ] := -1863079736;
        m1_adwSrc0[ 10 ] := -798337830;
        m1_adwSrc0[ 11 ] := 2034828084;
        m1_adwSrc0[ 12 ] := -1732480757;
        m1_adwSrc0[ 13 ] := -12044376;
        m1_adwSrc0[ 14 ] := 963657175;
        m1_adwSrc0[ 15 ] := 1603733806;
        m1_adwSrc0[ 16 ] := 1840641069;
        m1_adwSrc0[ 17 ] := -2048192593;
        m1_adwSrc0[ 18 ] := -1080416643;
        m1_adwSrc0[ 19 ] := 1194131451;
        m1_adwSrc0[ 20 ] := 150901654;
        m1_adwSrc0[ 21 ] := 1460626037;
        m1_adwSrc0[ 22 ] := 195179052;
        m1_adwSrc0[ 23 ] := 1603733806;
        m1_adwSrc0[ 24 ] := 1840641069;
        m1_adwSrc0[ 25 ] := -2048192593;
        m1_adwSrc0[ 26 ] := -1080416643;
        m1_adwSrc0[ 27 ] := 1194131451;
        m1_adwSrc0[ 28 ] := 150901654;
        m1_adwSrc0[ 29 ] := 1460626037;
        m1_adwSrc0[ 30 ] := 195179052;
        m1_adwSrc0[ 31 ] := 1603733806;
        { Reinit m1_adwSrc1 Table }
        m1_adwSrc1[ 0 ] := 906491833;
        m1_adwSrc1[ 1 ] := -1831070154;
        m1_adwSrc1[ 2 ] := 2023697415;
        m1_adwSrc1[ 3 ] := -110695684;
        m1_adwSrc1[ 4 ] := -1795698777;
        m1_adwSrc1[ 5 ] := -1443080995;
        m1_adwSrc1[ 6 ] := -1300660110;
        m1_adwSrc1[ 7 ] := -23124869;
        m1_adwSrc1[ 8 ] := 833028495;
        m1_adwSrc1[ 9 ] := -1370806080;
        m1_adwSrc1[ 10 ] := 1869297863;
        m1_adwSrc1[ 11 ] := 1244574472;
        m1_adwSrc1[ 12 ] := 772735331;
        m1_adwSrc1[ 13 ] := -335621471;
        m1_adwSrc1[ 14 ] := -299663334;
        m1_adwSrc1[ 15 ] := 276836903;
        m1_adwSrc1[ 16 ] := 561338471;
        m1_adwSrc1[ 17 ] := 477010908;
        m1_adwSrc1[ 18 ] := 673477435;
        m1_adwSrc1[ 19 ] := -1563135006;
        m1_adwSrc1[ 20 ] := -988954215;
        m1_adwSrc1[ 21 ] := -2084794747;
        m1_adwSrc1[ 22 ] := -519633872;
        m1_adwSrc1[ 23 ] := 276836903;
        m1_adwSrc1[ 24 ] := 561338471;
        m1_adwSrc1[ 25 ] := 477010908;
        m1_adwSrc1[ 26 ] := 673477435;
        m1_adwSrc1[ 27 ] := -1563135006;
        m1_adwSrc1[ 28 ] := -988954215;
        m1_adwSrc1[ 29 ] := -2084794747;
        m1_adwSrc1[ 30 ] := -519633872;
        m1_adwSrc1[ 31 ] := 276836903;
        { Reinit m1_adwAddGS Table }
        m1_adwAddGS[ 0 ] := 823328126;
        m1_adwAddGS[ 1 ] := 336358741;
        m1_adwAddGS[ 2 ] := -375731876;
        m1_adwAddGS[ 3 ] := 35766287;
        m1_adwAddGS[ 4 ] := -1113939172;
        m1_adwAddGS[ 5 ] := 107211395;
        m1_adwAddGS[ 6 ] := 1531310119;
        m1_adwAddGS[ 7 ] := 1911291484;
        m1_adwAddGS[ 8 ] := 577964234;
        m1_adwAddGS[ 9 ] := 537019929;
        m1_adwAddGS[ 10 ] := 876579815;
        m1_adwAddGS[ 11 ] := -1318607279;
        m1_adwAddGS[ 12 ] := 1384794827;
        m1_adwAddGS[ 13 ] := -1162676601;
        m1_adwAddGS[ 14 ] := 391378859;
        m1_adwAddGS[ 15 ] := 1363312807;
        m1_adwAddGS[ 16 ] := 1363312807;
        m1_adwAddGS[ 17 ] := 1363312807;
        m1_adwAddGS[ 18 ] := 1363312807;
        m1_adwAddGS[ 19 ] := 1363312807;
        m1_adwAddGS[ 20 ] := 1363312807;
        m1_adwAddGS[ 21 ] := 1363312807;
        m1_adwAddGS[ 22 ] := 1363312807;
        m1_adwAddGS[ 23 ] := 1363312807;
        m1_adwAddGS[ 24 ] := 1363312807;
        m1_adwAddGS[ 25 ] := 1363312807;
        m1_adwAddGS[ 26 ] := 1363312807;
        m1_adwAddGS[ 27 ] := 1363312807;
        m1_adwAddGS[ 28 ] := 1363312807;
        m1_adwAddGS[ 29 ] := -1800001184;
        m1_adwAddGS[ 30 ] := -651566528;
        m1_adwAddGS[ 31 ] := 1559230923;
        { Init m1_sTabPass table }
        m1_sTabPass[ 0 ] := 123;
        m1_sTabPass[ 1 ] := 228;
        m1_sTabPass[ 2 ] := 99;
        m1_sTabPass[ 3 ] := 124;
        m1_sTabPass[ 4 ] := 4;
        m1_sTabPass[ 5 ] := 49;
        m1_sTabPass[ 6 ] := 32;
        m1_sTabPass[ 7 ] := 37;
        m1_sTabPass[ 8 ] := 162;
        m1_sTabPass[ 9 ] := 19;
        m1_sTabPass[ 10 ] := 178;
        m1_sTabPass[ 11 ] := 3;
        m1_sTabPass[ 12 ] := 117;
        m1_sTabPass[ 13 ] := 188;
        m1_sTabPass[ 14 ] := 129;
        m1_sTabPass[ 15 ] := 113;
        m1_sTabPass[ 16 ] := 59;
        m1_sTabPass[ 17 ] := 51;
        m1_sTabPass[ 18 ] := 225;
        m1_sTabPass[ 19 ] := 188;
        m1_sTabPass[ 20 ] := 53;
        m1_sTabPass[ 21 ] := 68;
        m1_sTabPass[ 22 ] := 39;
        m1_sTabPass[ 23 ] := 88;
        m1_sTabPass[ 24 ] := 162;
        m1_sTabPass[ 25 ] := 15;
        m1_sTabPass[ 26 ] := 54;
        m1_sTabPass[ 27 ] := 185;
        m1_sTabPass[ 28 ] := 147;
        m1_sTabPass[ 29 ] := 33;
        m1_sTabPass[ 30 ] := 243;
        m1_sTabPass[ 31 ] := 242;
        { Init m1_sCodePass table }
        m1_sCodePass[ 0 ] := 171;
        m1_sCodePass[ 1 ] := 163;
        m1_sCodePass[ 2 ] := 74;
        m1_sCodePass[ 3 ] := 211;
        m1_sCodePass[ 4 ] := 168;
        m1_sCodePass[ 5 ] := 146;
        m1_sCodePass[ 6 ] := 89;
        m1_sCodePass[ 7 ] := 45;
        m1_sCodePass[ 8 ] := 234;
        m1_sCodePass[ 9 ] := 254;
        m1_sCodePass[ 10 ] := 117;
        m1_sCodePass[ 11 ] := 219;
        m1_sCodePass[ 12 ] := 66;
        m1_sCodePass[ 13 ] := 138;
        m1_sCodePass[ 14 ] := 47;
        m1_sCodePass[ 15 ] := 158;
        m1_sCodePass[ 16 ] := 81;
        m1_sCodePass[ 17 ] := 42;
        m1_sCodePass[ 18 ] := 10;
        m1_sCodePass[ 19 ] := 54;
        m1_sCodePass[ 20 ] := 181;
        m1_sCodePass[ 21 ] := 105;
        m1_sCodePass[ 22 ] := 22;
        m1_sCodePass[ 23 ] := 243;
        m1_sCodePass[ 24 ] := 46;
        m1_sCodePass[ 25 ] := 218;
        m1_sCodePass[ 26 ] := 80;
        m1_sCodePass[ 27 ] := 127;
        m1_sCodePass[ 28 ] := 183;
        m1_sCodePass[ 29 ] := 161;
        m1_sCodePass[ 30 ] := 31;
        m1_sCodePass[ 31 ] := 14;
        { Init m1_cbEncData table }
        m1_cbEncData[ 0 ] := 89;
        m1_cbEncData[ 1 ] := 120;
        m1_cbEncData[ 2 ] := 36;
        m1_cbEncData[ 3 ] := 255;
        m1_cbEncData[ 4 ] := 48;
        m1_cbEncData[ 5 ] := 90;
        m1_cbEncData[ 6 ] := 11;
        m1_cbEncData[ 7 ] := 171;
        m1_cbEncData[ 8 ] := 187;
        m1_cbEncData[ 9 ] := 45;
        m1_cbEncData[ 10 ] := 101;
        m1_cbEncData[ 11 ] := 135;
        m1_cbEncData[ 12 ] := 169;
        m1_cbEncData[ 13 ] := 74;
        m1_cbEncData[ 14 ] := 219;
        m1_cbEncData[ 15 ] := 167;
        m1_cbEncData[ 16 ] := 239;
        m1_cbEncData[ 17 ] := 240;
        m1_cbEncData[ 18 ] := 68;
        m1_cbEncData[ 19 ] := 112;
        m1_cbEncData[ 20 ] := 113;
        m1_cbEncData[ 21 ] := 125;
        m1_cbEncData[ 22 ] := 143;
        m1_cbEncData[ 23 ] := 196;
        m1_cbEncData[ 24 ] := 225;
        m1_cbEncData[ 25 ] := 222;
        m1_cbEncData[ 26 ] := 203;
        m1_cbEncData[ 27 ] := 219;
        m1_cbEncData[ 28 ] := 136;
        m1_cbEncData[ 29 ] := 62;
        m1_cbEncData[ 30 ] := 66;
        m1_cbEncData[ 31 ] := 52;
        m1_cbEncData[ 32 ] := 88;
        m1_cbEncData[ 33 ] := 29;
        m1_cbEncData[ 34 ] := 77;
        m1_cbEncData[ 35 ] := 88;
        m1_cbEncData[ 36 ] := 183;
        m1_cbEncData[ 37 ] := 195;
        m1_cbEncData[ 38 ] := 253;
        m1_cbEncData[ 39 ] := 7;
        m1_cbEncData[ 40 ] := 41;
        m1_cbEncData[ 41 ] := 83;
        m1_cbEncData[ 42 ] := 144;
        m1_cbEncData[ 43 ] := 176;
        m1_cbEncData[ 44 ] := 183;
        m1_cbEncData[ 45 ] := 0;
        m1_cbEncData[ 46 ] := 5;
        m1_cbEncData[ 47 ] := 211;
        m1_cbEncData[ 48 ] := 102;
        m1_cbEncData[ 49 ] := 242;
        m1_cbEncData[ 50 ] := 64;
        m1_cbEncData[ 51 ] := 242;
        m1_cbEncData[ 52 ] := 24;
        m1_cbEncData[ 53 ] := 217;
        m1_cbEncData[ 54 ] := 226;
        m1_cbEncData[ 55 ] := 84;
        m1_cbEncData[ 56 ] := 252;
        m1_cbEncData[ 57 ] := 85;
        m1_cbEncData[ 58 ] := 164;
        m1_cbEncData[ 59 ] := 166;
        m1_cbEncData[ 60 ] := 184;
        m1_cbEncData[ 61 ] := 47;
        m1_cbEncData[ 62 ] := 94;
        m1_cbEncData[ 63 ] := 42;
        m1_cbEncData[ 64 ] := 198;
        m1_cbEncData[ 65 ] := 114;
        m1_cbEncData[ 66 ] := 9;
        m1_cbEncData[ 67 ] := 117;
        m1_nRet := 0;
        { ---- Decoding m1_PrivRD }
        m1_nRet := nskDeCode ( 0, @m1_sCodePass , @m1_PrivRD , 4  );
        if ( m1_nRet <> 0 ) then begin
            m1_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { ------------------------------------------- }

        { ---- Decoding m1_dwPubCode }
        m1_nRet := nskDeCode ( 0, @m1_sCodePass , @m1_dwPubCode , 4  );
        if ( m1_nRet <> 0 ) then begin
            m1_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { ------------------------------------------- }

        nskSetMode ( 25, 1, 0, 0, 1, 1, 0 );
        { ---- Random by dongle TRANSFORM function --- }
        m1_nRet := nskTransform ( m1_PrivRD, 2, 4, @m1_dwRes   );
        if ( m1_nRet <> 0 ) then begin
            m1_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        m1_nNum := word(m1_dwRes) ;
        { -------------------------------------------- }
        {m1_nNum := m1_nNum mod 32;}
        m1_nNum := GetMod(m1_nNum,32);
        m1_dwTmp0 := nskCRC ( @m1_PrivRD , 4, -1 );
        if ( m1_dwTmp0 <> 1417686703 ) then begin
            m1_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        m1_dwTmp0 := nskCRC ( @m1_adwAddGS , 128, -1 );
        if ( m1_dwTmp0 <> 284713420 ) then begin
            m1_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { ---- Decoding m1_adwSrc0 }
        { -- Init password m1_sTabPass }
        m1_nRet  := nskCodeInit  ( m1_PrivRD, 0, 1, @m1_sTabPass   );
        if ( m1_nRet <> 0 ) then begin
            m1_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { -- Decode data }
        m1_nRet := nskDeCode ( 0, @m1_sTabPass , @m1_adwSrc0 , 128  );
        if ( m1_nRet <> 0 ) then begin
            m1_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { ------------------------------------------- }

        m1_dwRes := m1_adwSrc0[ m1_nNum ];
        m1_dwTmp0 := nskCRC ( @m1_adwSrc0 , 128, -1 );
        if ( m1_dwTmp0 <> 1716787832 ) then begin
            m1_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }

        { ------- Transform function -------- }
        m1_dwTmp1 := m1_nNum + 3;
        {m1_dwTmp1 := m1_dwTmp1 mod 32;}
        m1_dwTmp1 := GetMod(m1_dwTmp1,32);
        m1_dwTmp1 := m1_adwSrc0[ m1_dwTmp1 ];
        {-- XOR operation --}
        m1_dwTmp1:=m1_dwTmp1 xor 189861426;
        {-- XOR operation --}
        m1_dwRes:=m1_dwRes xor m1_dwTmp1;
        m1_dwTmp3 := m1_dwRes + m1_dwRes;
        {-- XOR operation --}
        m1_dwRes:=m1_dwRes xor m1_dwTmp3;
        m1_dwTmp1 := 189861426 - m1_dwRes;
        m1_dwRes := m1_dwRes * m1_dwTmp1;
        m1_dwTmp3 := m1_nNum + 3;
        {m1_dwTmp3 := m1_dwTmp3 mod 32;}
        m1_dwTmp3 := GetMod(m1_dwTmp3,32);
        m1_dwTmp3 := m1_adwSrc0[ m1_dwTmp3 ];
        m1_dwTmp3 := m1_dwTmp3  * 189861426;
        m1_dwRes := m1_dwRes * m1_dwTmp3;
        m1_dwTmp3 := m1_nNum + 3;
        {m1_dwTmp3 := m1_dwTmp3 mod 32;}
        m1_dwTmp3 := GetMod(m1_dwTmp3,32);
        m1_dwTmp3 := m1_adwSrc0[ m1_dwTmp3 ];
        m1_dwTmp3 := m1_dwTmp3 + 189861426;
        m1_dwRes := m1_dwRes * m1_dwTmp3;
        {-- XOR operation --}
        m1_dwTmp2:=m1_PrivRD xor m1_dwRes;
        m1_dwRes := m1_dwRes + m1_dwTmp2;
        m1_dwTmp2 := m1_dwRes  * m1_PrivRD;
        m1_dwRes := m1_dwRes - m1_dwTmp2;
        { ---- Encoding m1_adwSrc0 }
        m1_nRet := nskEnCode ( 0, @m1_sTabPass , @m1_adwSrc0 , 128  );
        { ------------------------------------------- }

        m1_nRet := nskTransform ( m1_PrivRD, 0, 4, @m1_dwRes   );
        if ( m1_nRet <> 0 ) then begin
            m1_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { --------- End of Transform Function ------------ }
        { ---- Decoding m1_adwSrc1 }
        { -- Init password m1_sTabPass }
        m1_nRet  := nskCodeInit  ( m1_PrivRD, 0, 1, @m1_sTabPass   );
        if ( m1_nRet <> 0 ) then begin
            m1_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { -- Decode data }
        m1_nRet := nskDeCode ( 0, @m1_sTabPass , @m1_adwSrc1 , 128  );
        if ( m1_nRet <> 0 ) then begin
            m1_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { ------------------------------------------- }

        m1_dwTmp0 := nskCRC ( @m1_adwSrc1 , 128, -1 );
        if ( m1_dwTmp0 <> 1552770277 ) then begin
            m1_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }

        { ------- Transform function -------- }
        {-- XOR operation --}
        m1_dwTmp0:=128645967 xor m1_PrivRD;
        m1_dwRes := m1_dwRes + m1_dwTmp0;
        m1_dwTmp0 := m1_PrivRD + m1_dwRes;
        {-- XOR operation --}
        m1_dwRes:=m1_dwRes xor m1_dwTmp0;
        m1_dwTmp0 := m1_nNum + 3;
        {m1_dwTmp0 := m1_dwTmp0 mod 32;}
        m1_dwTmp0 := GetMod(m1_dwTmp0,32);
        m1_dwTmp0 := m1_adwSrc1[ m1_dwTmp0 ];
        m1_dwTmp0 := m1_dwTmp0  * m1_PrivRD;
        m1_dwRes := m1_dwRes * m1_dwTmp0;
        m1_dwTmp1 := m1_nNum + 3;
        {m1_dwTmp1 := m1_dwTmp1 mod 32;}
        m1_dwTmp1 := GetMod(m1_dwTmp1,32);
        m1_dwTmp1 := m1_adwSrc1[ m1_dwTmp1 ];
        m1_dwTmp1 := m1_dwTmp1  * m1_dwRes;
        m1_dwRes := m1_dwRes - m1_dwTmp1;
        m1_dwTmp2 := m1_nNum + 3;
        {m1_dwTmp2 := m1_dwTmp2 mod 32;}
        m1_dwTmp2 := GetMod(m1_dwTmp2,32);
        m1_dwTmp2 := m1_adwSrc1[ m1_dwTmp2 ];
        m1_dwTmp2 := m1_dwTmp2  * 128645967;
        m1_dwRes := m1_dwRes * m1_dwTmp2;
        m1_dwTmp3 := m1_dwRes  * m1_dwRes;
        {-- XOR operation --}
        m1_dwRes:=m1_dwRes xor m1_dwTmp3;
        m1_dwTmp1 := m1_dwRes - m1_PrivRD;
        m1_dwRes := m1_dwRes + m1_dwTmp1;
        m1_dwTmp3 := m1_nNum + 3;
        {m1_dwTmp3 := m1_dwTmp3 mod 32;}
        m1_dwTmp3 := GetMod(m1_dwTmp3,32);
        m1_dwTmp3 := m1_adwSrc1[ m1_dwTmp3 ];
        m1_dwTmp3 := m1_dwTmp3  * m1_PrivRD;
        m1_dwRes := m1_dwRes * m1_dwTmp3;
        m1_dwTmp3 := m1_PrivRD + m1_PrivRD;
        m1_dwRes := m1_dwRes + m1_dwTmp3;
        m1_dwTmp2 := 128645967 + m1_dwRes;
        m1_dwRes := m1_dwRes * m1_dwTmp2;
        m1_dwTmp1 := m1_nNum + 3;
        {m1_dwTmp1 := m1_dwTmp1 mod 32;}
        m1_dwTmp1 := GetMod(m1_dwTmp1,32);
        m1_dwTmp1 := m1_adwSrc1[ m1_dwTmp1 ];
        m1_dwTmp1 := m1_dwTmp1 + m1_PrivRD;
        {-- XOR operation --}
        m1_dwRes:=m1_dwRes xor m1_dwTmp1;
        {-- XOR operation --}
        m1_dwTmp1:=128645967 xor m1_PrivRD;
        {-- XOR operation --}
        m1_dwRes:=m1_dwRes xor m1_dwTmp1;
        { ---- Encoding m1_adwSrc1 }
        m1_nRet := nskEnCode ( 0, @m1_sTabPass , @m1_adwSrc1 , 128  );
        { ------------------------------------------- }

        m1_nRet := nskTransform ( m1_PrivRD, 0, 4, @m1_dwRes   );
        if ( m1_nRet <> 0 ) then begin
            m1_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        { --------- End of Transform Function ------------ }
        m1_dwTmp1 := m1_adwAddGS[ m1_nNum ];
        m1_dwRes := m1_dwRes + m1_dwTmp1;
        {  Creating Password for data decryption }
        for i := 0 to (8 - 1) do begin
            {-- ROL operation --}
            m1_dwTmp1:=(m1_dwRes shl i) or (m1_dwRes shr (32-i));
            m1_dwTmp2 := i + 2;
            {-- ROR operation --}
            m1_dwTmp2:=(m1_dwRes shr m1_dwTmp2) or (m1_dwRes shl (32-m1_dwTmp2));
            {-- XOR operation --}
            m1_dwTmp1:=m1_dwTmp2 xor m1_dwTmp1;
            m1_dwPassword[ i ] := m1_dwTmp1;
        end; { of FOR }
        { ---- Decode main buffer using password ---- }
        m1_nRet := nskDeCode ( 0, @m1_dwPassword , @m1_cbEncData , 68  );
        m1_dwRes := nskCRC ( @m1_cbEncData , 68, -1 );
        if ( m1_dwRes <> -1648520962 ) then begin
            m1_CheckSTEALTHKey := 255;
            Exit;
        end; { of IF }
        m1_nRet := nskEnCode ( 0, @m1_dwPassword , @m1_cbEncData , 68  );
        m1_CheckSTEALTHKey := 0;
        Exit;
    end;
