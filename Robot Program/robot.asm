; compiler          : jal 0.4.62
; date              : 17-Apr-2010 22:18:43
; main source       : robot
; command line      : -sC:\JalWin\lib -vz -ordcts -casz C:\DOCUME~1\002164\Desktop\ONURRO~1\robot.jal 
; target  chip      : 16f877
;         cpu       : pic 14
;         clock     : 4000000
; input   files     : 16
;         lines     : 3056
;         chars     : 79353
; compilation nodes : 20172
;             stack : 36Kb
;              heap : 4854Kb
;           seconds : 0.171 (17871 lines/second)
; output       code : 1185
;              page :    0 (0.0%)
;              bank :    0 (0.0%)
;         page+bank :    0 (0.0%)
;              file :   19
;              stack:    4 (4,0,0)

 errorlevel -306
 list p=PIC16f877

; note: the f877 config is still fixed!
 __CONFIG H'3F72' 
 ORG 0000
  goto    __main
 ORG 0004
 ORG 0004
__interrupt: ; 0004
__main: ; 0004
; var H'020:000'  transfer_bit
; var H'021:000'  transfer_byte

;; 037 : var volatile byte indf         at  0
; var H'000:000' indf

;; 040 : var volatile byte status       at  3
; var H'003:000' status

;; 041 : var volatile byte fsr          at  4
; var H'004:000' fsr

;; 074 : var volatile byte f877_rcsta   at 0x18
; var H'018:000' f877_rcsta

;; 085 :  var volatile byte rcsta   at 0x18
; var H'018:000' rcsta

;; 086 :  var volatile byte txsta   at 0x98
; var H'098:000' txsta

;; 087 :  var volatile byte spbrg   at 0x99
; var H'099:000' spbrg

;; 090 :  var volatile byte pir1    at 0x0C
; var H'00C:000' pir1

;; 094 :  var volatile bit  txsta_txen          at txsta : 5
; var H'098:005' txsta_txen

;; 096 :  var volatile bit  txsta_brgh          at txsta : 2
; var H'098:002' txsta_brgh

;; 099 :  var volatile bit  rcsta_spen          at RCSTA : 7
; var H'018:007' rcsta_spen

;; 101 :  var volatile bit  rcsta_cren          at rcsta : 4
; var H'018:004' rcsta_cren

;; 107 :  var volatile bit  PIR1_RCIF          at PIR1  : 5
; var H'00C:005' pir1_rcif

;; 329 : var byte trisa
; var H'022:000' trisa

;; 330 : var byte trisb
; var H'023:000' trisb

;; 331 : var byte trisc
; var H'024:000' trisc

;; 332 : var byte trisd
; var H'025:000' trisd

;; 333 : var byte trise
; var H'026:000' trise

;; 337 : trisa = all_input
  movlw   H'FF'
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'022'

;; 339 :    trisb = all_input
  movlw   H'FF'
  movwf   H'023'

;; 342 :    trisc = all_input
  movlw   H'FF'
  movwf   H'024'

;; 345 :    trisd = all_input
  movlw   H'FF'
  movwf   H'025'

;; 346 :    trise = 0x0F -- high nibble has other functions!
  movlw   H'0F'
  movwf   H'026'

;; 646 : var byte _port_b_buffer
; var H'027:000' _port_b_buffer

;; 648 : var byte _port_d_buffer
; var H'028:000' _port_d_buffer

;; 066 : _hd44780_4_init             -- IO pin initialisation
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13582__vector

;; 067 : delay_10mS( 10 )            -- gives the HD44780 time to wake up
  movlw   H'0A'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10590__vector

;; 068 : hd44780_4_DI = low          -- select instructions
  bcf     H'003',5
  bcf     H'003',6
  bcf     H'027',4
  bcf     H'00A',3
  bcf     H'00A',4
  call    _6780__vector

;; 069 : HD44780_IO( 0b_0011 )       -- sync one
  movlw   H'03'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13675__vector

;; 070 : delay_10uS( 50 )            -- extra delay 
  movlw   H'32'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _9794__vector

;; 071 : HD44780_IO( 0b_0011 )       -- and one more
  movlw   H'03'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13675__vector

;; 072 : delay_10uS( 50 )            -- extra delay
  movlw   H'32'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _9794__vector

;; 073 : HD44780_IO( 0b_0011 )       -- end yet another
  movlw   H'03'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13675__vector

;; 074 : delay_10uS( 50 )            -- extra delay
  movlw   H'32'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _9794__vector

;; 075 : HD44780_instruction( 0b_0011_0010 )  -- init
  movlw   H'32'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13721__vector

;; 076 : HD44780_instruction( 0b_0010_1000 )  -- two lines, 5x7 (high nibble)
  movlw   H'28'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13721__vector

;; 072 : HD44780_instruction( 0b_0000_1100 ) -- display on, cursor off, blink off
  movlw   H'0C'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13721__vector

;; 073 : delay_10uS( 200 )
  movlw   H'C8'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _9794__vector

;; 007 :  disable_a_d_functions
  bcf     H'00A',3
  bcf     H'00A',4
  call    _8330__vector

;; 008 :  port_d_direction = 0xF0  -- dportunun son dort pin'i cikis oldu.
  movlw   H'F0'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _3342__vector

;; 021 : var byte  veri,komut,yaz
; var H'029:000' veri
; var H'02A:000' komut
; var H'02B:000' yaz

;; 022 : serial_setup ( 192 )
  movlw   H'C0'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _14434__vector

;; 023 : hd44780_clear
  bcf     H'00A',3
  bcf     H'00A',4
  call    _14035__vector

;; 025 : forever loop
w_16537_ag: ; 0053

;; 026 : if h_asynch_poll ( veri ) then
  bcf     H'00A',3
  bcf     H'00A',4
  call    _15509__vector
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02C',w
  movwf   H'029'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'020',2
  goto    if_15659_by
if_15659_th: ; 005E

;; 027 : yaz = veri
  movf    H'029',w
  movwf   H'02B'
if_15659_by: ; 0060

;; 029 : komut = robot_dur
  clrf    H'02A'

;; 030 : if  yaz == "0" then komut = robot_dur
  movf    H'02B',w
  sublw   H'30'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_15682_el
if_15682_th: ; 0067
  clrf    H'02A'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    if_15682_by
if_15682_el: ; 006B

;; 031 : elsif  yaz == "1" then komut = robot_ileri
  movf    H'02B',w
  sublw   H'31'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_15694_el
if_15694_th: ; 0071
  movlw   H'05'
  movwf   H'02A'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    if_15694_by
if_15694_el: ; 0076

;; 032 : elsif  yaz == "2" then komut = robot_geri
  movf    H'02B',w
  sublw   H'32'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_15706_el
if_15706_th: ; 007C
  movlw   H'0A'
  movwf   H'02A'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    if_15706_by
if_15706_el: ; 0081

;; 033 : elsif  yaz == "3" then komut = sol_motor_ileri
  movf    H'02B',w
  sublw   H'33'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_15718_el
if_15718_th: ; 0087
  movlw   H'01'
  movwf   H'02A'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    if_15718_by
if_15718_el: ; 008C

;; 034 : elsif  yaz == "4" then komut = sag_motor_ileri
  movf    H'02B',w
  sublw   H'34'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_15730_el
if_15730_th: ; 0092
  movlw   H'04'
  movwf   H'02A'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    if_15730_by
if_15730_el: ; 0097

;; 035 : elsif  yaz == "5" then komut = sol_motor_geri
  movf    H'02B',w
  sublw   H'35'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_15742_el
if_15742_th: ; 009D
  movlw   H'02'
  movwf   H'02A'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    if_15742_by
if_15742_el: ; 00A2

;; 036 : elsif  yaz == "6" then komut = sag_motor_geri
  movf    H'02B',w
  sublw   H'36'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_15754_el
if_15754_th: ; 00A8
  movlw   H'08'
  movwf   H'02A'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    if_15754_by
if_15754_el: ; 00AD

;; 037 : elsif  yaz == "7" then komut = robot_don_sol
  movf    H'02B',w
  sublw   H'37'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_15766_el
if_15766_th: ; 00B3
  movlw   H'06'
  movwf   H'02A'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    if_15766_by
if_15766_el: ; 00B8

;; 038 : elsif  yaz == "8" then komut = robot_don_sag
  movf    H'02B',w
  sublw   H'38'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_15778_by
if_15778_th: ; 00BE
  movlw   H'09'
  movwf   H'02A'
if_15778_by: ; 00C0
if_15766_by: ; 00C0
if_15754_by: ; 00C0
if_15742_by: ; 00C0
if_15730_by: ; 00C0
if_15718_by: ; 00C0
if_15706_by: ; 00C0
if_15694_by: ; 00C0
if_15682_by: ; 00C0

;; 040 : port_d = komut
  movf    H'02A',w
  bcf     H'00A',3
  bcf     H'00A',4
  call    _5707__vector

;; 042 : if yaz == "1" then
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02B',w
  sublw   H'31'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_15795_by
if_15795_th: ; 00CC

;; 043 :  hd44780_clear
  bcf     H'00A',3
  bcf     H'00A',4
  call    _14035__vector

;; 044 :  hd44780 = "i"  hd44780 = "l"  hd44780 = "e"  hd44780 = "r"  hd44780 = "i"
  movlw   H'69'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'6C'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'65'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'72'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'69'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector

;; 471 : procedure delay_1s( byte in x = 1 ) is
  movlw   H'01'

;; 045 :  delay_1s
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10860__vector

;; 467 : procedure delay_500ms( byte in x = 1 ) is
  movlw   H'01'

;; 046 :  delay_500ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10815__vector

;; 463 : procedure delay_200ms( byte in x = 1 ) is
  movlw   H'01'

;; 047 :  delay_200ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10770__vector

;; 459 : procedure delay_100ms( byte in x = 1 ) is
  movlw   H'01'

;; 048 :  delay_100ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10725__vector
if_15795_by: ; 00F3

;; 050 : if yaz == "2" then
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02B',w
  sublw   H'32'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_15879_by
if_15879_th: ; 00FB

;; 051 :  hd44780_clear
  bcf     H'00A',3
  bcf     H'00A',4
  call    _14035__vector

;; 052 :  hd44780 = "g"  hd44780 = "e"  hd44780 = "r"  hd44780 = "i"   hd44780 = "0"
  movlw   H'67'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'65'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'72'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'69'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'30'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector

;; 471 : procedure delay_1s( byte in x = 1 ) is
  movlw   H'01'

;; 053 :  delay_1s
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10860__vector

;; 467 : procedure delay_500ms( byte in x = 1 ) is
  movlw   H'01'

;; 054 :  delay_500ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10815__vector

;; 463 : procedure delay_200ms( byte in x = 1 ) is
  movlw   H'01'

;; 055 :  delay_200ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10770__vector

;; 459 : procedure delay_100ms( byte in x = 1 ) is
  movlw   H'01'

;; 056 :  delay_100ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10725__vector
if_15879_by: ; 0122

;; 058 : if yaz == "3" then
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02B',w
  sublw   H'33'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_15963_by
if_15963_th: ; 012A

;; 059 :  hd44780_clear
  bcf     H'00A',3
  bcf     H'00A',4
  call    _14035__vector

;; 060 :  hd44780 = "s"  hd44780 = "o"  hd44780 = "l"
  movlw   H'73'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'6F'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'6C'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector

;; 061 :  hd44780 = "i"  hd44780 = "l"  hd44780 = "e"  hd44780 = "r"  hd44780 = "i"
  movlw   H'69'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'6C'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'65'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'72'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'69'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector

;; 471 : procedure delay_1s( byte in x = 1 ) is
  movlw   H'01'

;; 062 :  delay_1s
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10860__vector

;; 467 : procedure delay_500ms( byte in x = 1 ) is
  movlw   H'01'

;; 063 :  delay_500ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10815__vector

;; 463 : procedure delay_200ms( byte in x = 1 ) is
  movlw   H'01'

;; 064 :  delay_200ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10770__vector

;; 459 : procedure delay_100ms( byte in x = 1 ) is
  movlw   H'01'

;; 065 :  delay_100ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10725__vector
if_15963_by: ; 015D

;; 067 : if yaz == "4" then
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02B',w
  sublw   H'34'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_16065_by
if_16065_th: ; 0165

;; 068 :  hd44780_clear
  bcf     H'00A',3
  bcf     H'00A',4
  call    _14035__vector

;; 069 :  hd44780 = "s"  hd44780 = "a"  hd44780 = "g"
  movlw   H'73'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'61'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'67'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector

;; 070 :  hd44780 = "i"  hd44780 = "l"  hd44780 = "e"  hd44780 = "r"  hd44780 = "i"
  movlw   H'69'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'6C'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'65'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'72'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'69'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector

;; 471 : procedure delay_1s( byte in x = 1 ) is
  movlw   H'01'

;; 071 :  delay_1s
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10860__vector

;; 467 : procedure delay_500ms( byte in x = 1 ) is
  movlw   H'01'

;; 072 :  delay_500ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10815__vector

;; 463 : procedure delay_200ms( byte in x = 1 ) is
  movlw   H'01'

;; 073 :  delay_200ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10770__vector

;; 459 : procedure delay_100ms( byte in x = 1 ) is
  movlw   H'01'

;; 074 :  delay_100ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10725__vector
if_16065_by: ; 0198

;; 076 : if yaz == "5" then
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02B',w
  sublw   H'35'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_16167_by
if_16167_th: ; 01A0

;; 077 :  hd44780_clear
  bcf     H'00A',3
  bcf     H'00A',4
  call    _14035__vector

;; 078 :  hd44780 = "s"  hd44780 = "o"  hd44780 = "l"
  movlw   H'73'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'6F'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'6C'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector

;; 079 :  hd44780 = "g"  hd44780 = "e"  hd44780 = "r"  hd44780 = "i"
  movlw   H'67'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'65'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'72'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'69'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector

;; 471 : procedure delay_1s( byte in x = 1 ) is
  movlw   H'01'

;; 080 :  delay_1s
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10860__vector

;; 467 : procedure delay_500ms( byte in x = 1 ) is
  movlw   H'01'

;; 081 :  delay_500ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10815__vector

;; 463 : procedure delay_200ms( byte in x = 1 ) is
  movlw   H'01'

;; 082 :  delay_200ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10770__vector

;; 459 : procedure delay_100ms( byte in x = 1 ) is
  movlw   H'01'

;; 083 :  delay_100ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10725__vector
if_16167_by: ; 01CF

;; 085 : if yaz == "6" then
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02B',w
  sublw   H'36'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_16263_by
if_16263_th: ; 01D7

;; 086 :  hd44780_clear
  bcf     H'00A',3
  bcf     H'00A',4
  call    _14035__vector

;; 087 :  hd44780 = "s"  hd44780 = "a"  hd44780 = "g"
  movlw   H'73'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'61'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'67'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector

;; 088 :  hd44780 = "g"  hd44780 = "e"  hd44780 = "r"  hd44780 = "i"
  movlw   H'67'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'65'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'72'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'69'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector

;; 471 : procedure delay_1s( byte in x = 1 ) is
  movlw   H'01'

;; 089 :  delay_1s
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10860__vector

;; 467 : procedure delay_500ms( byte in x = 1 ) is
  movlw   H'01'

;; 090 :  delay_500ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10815__vector

;; 463 : procedure delay_200ms( byte in x = 1 ) is
  movlw   H'01'

;; 091 :  delay_200ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10770__vector

;; 459 : procedure delay_100ms( byte in x = 1 ) is
  movlw   H'01'

;; 092 :  delay_100ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10725__vector
if_16263_by: ; 0206

;; 094 : if yaz == "7" then
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02B',w
  sublw   H'37'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_16359_by
if_16359_th: ; 020E

;; 095 :  hd44780_clear
  bcf     H'00A',3
  bcf     H'00A',4
  call    _14035__vector

;; 096 :  hd44780 = "s"  hd44780 = "o"  hd44780 = "l" hd44780 = "a"
  movlw   H'73'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'6F'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'6C'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'61'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector

;; 097 :  hd44780 = "d"  hd44780 = "o"  hd44780 = "n"
  movlw   H'64'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'6F'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'6E'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector

;; 471 : procedure delay_1s( byte in x = 1 ) is
  movlw   H'01'

;; 098 :  delay_1s
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10860__vector

;; 467 : procedure delay_500ms( byte in x = 1 ) is
  movlw   H'01'

;; 099 :  delay_500ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10815__vector

;; 463 : procedure delay_200ms( byte in x = 1 ) is
  movlw   H'01'

;; 100 :  delay_200ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10770__vector
if_16359_by: ; 0239

;; 103 : if yaz == "8" then
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02B',w
  sublw   H'38'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_16445_by
if_16445_th: ; 0241

;; 104 :  hd44780_clear
  bcf     H'00A',3
  bcf     H'00A',4
  call    _14035__vector

;; 105 :  hd44780 = "s"  hd44780 = "a"  hd44780 = "g"  hd44780 = "a"
  movlw   H'73'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'61'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'67'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'61'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector

;; 106 :  hd44780 = "d"  hd44780 = "o"  hd44780 = "n"
  movlw   H'64'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'6F'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector
  movlw   H'6E'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13847__vector

;; 471 : procedure delay_1s( byte in x = 1 ) is
  movlw   H'01'

;; 107 :  delay_1s
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10860__vector

;; 467 : procedure delay_500ms( byte in x = 1 ) is
  movlw   H'01'

;; 108 :  delay_500ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10815__vector

;; 463 : procedure delay_200ms( byte in x = 1 ) is
  movlw   H'01'

;; 109 :  delay_200ms
  bcf     H'00A',3
  bcf     H'00A',4
  call    _10770__vector
if_16445_by: ; 026C

;; 111 : yaz = "0"
  movlw   H'30'
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02B'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    w_16537_ag

;; 003 :   idle_loop: page goto idle_loop
as_16540_idle_loop: ; 0273
  bcf     H'00A',3
  bcf     H'00A',4
  goto    as_16540_idle_loop
_15509__vector: ; 0276

;; 173 :  function H_asynch_poll( byte out x ) return bit is
; var H'02C:000' x
p_15509_h_asynch_poll: ; 0276
; var H'020:002'  return value
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02C'
  bcf     H'00A',3
  bcf     H'00A',4
  bcf     H'003',5
  bcf     H'003',6

;; 174 :    if PIR1_rcif then
  btfss   H'00C',5
  goto    if_15526_el
if_15526_th: ; 027F

;; 175 :      serial_recv ( x )
  bcf     H'00A',3
  bcf     H'00A',4
  call    _15285__vector
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02D',w
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02C'

;; 176 :     return true
  bcf     H'003',5
  bcf     H'003',6
  bsf     H'020',2
  bcf     H'00A',3
  bcf     H'00A',4
  goto    e_15509_h_asynch_poll
  bcf     H'00A',3
  bcf     H'00A',4
  goto    if_15526_by
if_15526_el: ; 0291

;; 178 :       return false
  bcf     H'003',5
  bcf     H'003',6
  bcf     H'020',2
  bcf     H'00A',3
  bcf     H'00A',4
  goto    e_15509_h_asynch_poll
if_15526_by: ; 0297
e_15509_h_asynch_poll: ; 0297
  return  
_15285__vector: ; 0298

;; 129 :  Procedure serial_recv ( byte out data ) is begin
; var H'02D:000' data
p_15285_serial_recv: ; 0298
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02D'

;; 131 :  		Bank_0
  bcf     H'00A',3
  bcf     H'00A',4
  call    _2630__vector

;; 132 :  	  while ! PIR1_RCIF loop end loop
w_15318_ag: ; 029E
  bcf     H'00A',3
  bcf     H'00A',4
  bcf     H'003',5
  bcf     H'003',6
  btfsc   H'00C',5
  goto    w_15318_be
w_15318_bo: ; 02A4
  bcf     H'00A',3
  bcf     H'00A',4
  goto    w_15318_ag
w_15318_be: ; 02A7

;; 133 :  	  file_get ( 0x1A , data )
  movlw   H'1A'
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02E'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _7447__vector
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02F',w
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02D'

;; 140 :   if ( F877_RCSTA & 0b_0000_0010 ) > 0 then
  bcf     H'003',5
  bcf     H'003',6
  movf    H'018',w
  andlw   H'02'
  sublw   H'00'
  bcf     H'00A',3
  bcf     H'00A',4
  btfsc   H'003',0
  goto    if_15357_by
if_15357_th: ; 02BD

;; 141 :        F877_RCSTA = F877_RCSTA & ( ! 0x10)
  movlw   H'FFFFFFEF'
  bcf     H'003',5
  bcf     H'003',6
  andwf   H'018',f

;; 142 :        F877_RCSTA = F877_RCSTA | (0x10)
  movlw   H'10'
  bcf     H'003',5
  bcf     H'003',6
  iorwf   H'018',f
if_15357_by: ; 02C5
e_15285_serial_recv: ; 02C5
  return  
_14434__vector: ; 02C6

;; 018 :  Procedure serial_setup ( byte in BAUD_CONSTANT ) is begin
; var H'02C:000' baud_constant
p_14434_serial_setup: ; 02C6
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02C'

;; 021 :  	  if BAUD_CONSTANT == 192 then
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02C',w
  sublw   H'C0'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_14462_el
if_14462_th: ; 02D1

;; 022 :  		      if target_cpu == pic_14 then Bank_1 end if
  bcf     H'00A',3
  bcf     H'00A',4
  call    _2679__vector

;; 023 :        		SPBRG = 12
  movlw   H'0C'
  bsf     H'003',5
  bcf     H'003',6
  movwf   H'099'

;; 024 :  		      TXSTA_BRGH = high
  bsf     H'003',5
  bcf     H'003',6
  bsf     H'098',2

;; 025 :  	        if target_cpu == pic_14 then Bank_0 end if
  bcf     H'00A',3
  bcf     H'00A',4
  call    _2630__vector
  bcf     H'00A',3
  bcf     H'00A',4
  goto    if_14462_by
if_14462_el: ; 02E1

;; 026 :  	  elsif BAUD_CONSTANT == 96 then
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02C',w
  sublw   H'60'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_14514_el
if_14514_th: ; 02E9

;; 027 :  		      if target_cpu == pic_14 then Bank_1 end if
  bcf     H'00A',3
  bcf     H'00A',4
  call    _2679__vector

;; 028 :        		SPBRG = 25
  movlw   H'19'
  bsf     H'003',5
  bcf     H'003',6
  movwf   H'099'

;; 029 :  		      TXSTA_BRGH = high
  bsf     H'003',5
  bcf     H'003',6
  bsf     H'098',2

;; 030 :  		      if target_cpu == pic_14 then Bank_0 end if
  bcf     H'00A',3
  bcf     H'00A',4
  call    _2630__vector
  bcf     H'00A',3
  bcf     H'00A',4
  goto    if_14514_by
if_14514_el: ; 02F9

;; 031 :  	  elsif BAUD_CONSTANT == 24 then
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02C',w
  sublw   H'18'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_14566_el
if_14566_th: ; 0301

;; 032 :  		      if target_cpu == pic_14 then Bank_1 end if
  bcf     H'00A',3
  bcf     H'00A',4
  call    _2679__vector

;; 033 :        		SPBRG = 103
  movlw   H'67'
  bsf     H'003',5
  bcf     H'003',6
  movwf   H'099'

;; 034 :  		      TXSTA_BRGH = high
  bsf     H'003',5
  bcf     H'003',6
  bsf     H'098',2

;; 035 :  		      if target_cpu == pic_14 then Bank_0 end if
  bcf     H'00A',3
  bcf     H'00A',4
  call    _2630__vector
  bcf     H'00A',3
  bcf     H'00A',4
  goto    if_14566_by
if_14566_el: ; 0311

;; 036 :  	  elsif BAUD_CONSTANT == 12 then
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02C',w
  sublw   H'0C'
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    if_14618_by
if_14618_th: ; 0319

;; 037 :  		      if target_cpu == pic_14 then Bank_1 end if
  bcf     H'00A',3
  bcf     H'00A',4
  call    _2679__vector

;; 038 :        		SPBRG = 207
  movlw   H'CF'
  bsf     H'003',5
  bcf     H'003',6
  movwf   H'099'

;; 039 :  		      TXSTA_BRGH = high
  bsf     H'003',5
  bcf     H'003',6
  bsf     H'098',2

;; 040 :  		      if target_cpu == pic_14 then Bank_0 end if
  bcf     H'00A',3
  bcf     H'00A',4
  call    _2630__vector
if_14618_by: ; 0326
if_14566_by: ; 0326
if_14514_by: ; 0326
if_14462_by: ; 0326

;; 105 :  		if target_cpu == pic_14 then Bank_1 end if
  bcf     H'00A',3
  bcf     H'00A',4
  call    _2679__vector

;; 106 :  	    TXSTA_TXEN = High
  bsf     H'003',5
  bcf     H'003',6
  bsf     H'098',5

;; 107 :  		if target_cpu == pic_14 then Bank_0 end if
  bcf     H'00A',3
  bcf     H'00A',4
  call    _2630__vector

;; 108 :  	  RCSTA_CREN = high
  bcf     H'003',5
  bcf     H'003',6
  bsf     H'018',4

;; 109 :  	  RCSTA_SPEN = high
  bcf     H'003',5
  bcf     H'003',6
  bsf     H'018',7
e_14434_serial_setup: ; 0335
  return  
_14035__vector: ; 0336
p_14035_hd44780_clear: ; 0336

;; 027 :    HD44780_instruction( 0b_0000_1000 ) -- display off
  movlw   H'08'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13721__vector

;; 028 :    HD44780_instruction( 0b_0000_0001 ) -- clear display
  movlw   H'01'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13721__vector

;; 029 :    delay_10uS( 200 )
  movlw   H'C8'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _9794__vector

;; 030 :    HD44780_instruction( 0b_0000_0010 ) -- cursor home
  movlw   H'02'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13721__vector

;; 031 :    delay_10uS( 200 )
  movlw   H'C8'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _9794__vector

;; 032 :    HD44780_instruction( 0b_0000_0110 ) -- entry, autoincrement, no shift
  movlw   H'06'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13721__vector

;; 033 :    HD44780_instruction( 0b_0000_1100 ) -- display on, cursor off, blink off
  movlw   H'0C'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13721__vector

;; 034 :    delay_10uS( 200 )
  movlw   H'C8'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _9794__vector
e_14035_hd44780_clear: ; 0356

;; 059 : procedure HD44780'put( byte in value ) is
p_13847__hd44780__put_t: ; 0356
_13847__vector: ; 0356
; var H'02C:000' value
p_13847_put: ; 0356
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02C'

;; 060 :    hd44780_4_DI = high      -- select data
  bcf     H'003',5
  bcf     H'003',6
  bsf     H'027',4
  bcf     H'00A',3
  bcf     H'00A',4
  call    _6780__vector

;; 061 :    HD44780_IO( value >> 4 ) -- output high nibble
  swapf   H'02C',w
  bcf     H'003',5
  bcf     H'003',6
  andlw   H'0F'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13675__vector

;; 062 :    HD44780_IO( value )      -- output low nibble
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02C',w
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _13675__vector
e_13847_put: ; 036C
_13721__vector: ; 036C

;; 043 : procedure HD44780_instruction( byte in value ) is
; var H'02C:000' value
p_13721_hd44780_instruction: ; 036C
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02C'

;; 044 :    hd44780_4_DI = low       -- select instruction
  bcf     H'003',5
  bcf     H'003',6
  bcf     H'027',4
  bcf     H'00A',3
  bcf     H'00A',4
  call    _6780__vector

;; 045 :    HD44780_IO( value >> 4 ) -- output high nibble
  swapf   H'02C',w
  bcf     H'003',5
  bcf     H'003',6
  andlw   H'0F'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13675__vector

;; 046 :    delay_10uS( 130 )        -- required delay
  movlw   H'82'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _9794__vector

;; 047 :    HD44780_IO( value )      -- output low nibble
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02C',w
  bcf     H'00A',3
  bcf     H'00A',4
  call    _13675__vector

;; 048 :    delay_10uS( 130 )        -- required delay
  movlw   H'82'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _9794__vector
e_13721_hd44780_instruction: ; 038A
_13675__vector: ; 038A

;; 035 : procedure HD44780_IO( byte in value ) is
; var H'02D:000' value
p_13675_hd44780_io: ; 038A
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02D'

;; 036 :    hd44780_4_E  = high      -- enable
  bcf     H'003',5
  bcf     H'003',6
  bsf     H'027',5
  bcf     H'00A',3
  bcf     H'00A',4
  call    _6809__vector

;; 037 :    hd44780_4_D  = value     -- put value on the data lines
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02D',w
  bcf     H'00A',3
  bcf     H'00A',4
  call    _5915__vector

;; 038 :    hd44780_4_E  = low       -- disable
  bcf     H'003',5
  bcf     H'003',6
  bcf     H'027',5
  bcf     H'00A',3
  bcf     H'00A',4
  call    _6809__vector

;; 039 :    delay_1uS( 250 )         -- enough for the simple operations
  movlw   H'FA'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _8638__vector
e_13675_hd44780_io: ; 03A3
_13582__vector: ; 03A3
p_13582__hd44780_4_init: ; 03A3

;; 068 :    port_b_low            = 0
  movlw   H'00'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _5915__vector

;; 069 :    pin_b4                = low
  bcf     H'003',5
  bcf     H'003',6
  bcf     H'027',4
  bcf     H'00A',3
  bcf     H'00A',4
  call    _6780__vector

;; 070 :    pin_b5                = low
  bcf     H'003',5
  bcf     H'003',6
  bcf     H'027',5
  bcf     H'00A',3
  bcf     H'00A',4
  call    _6809__vector

;; 071 :    port_b_low_direction  = all_output
  movlw   H'00'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _4827__vector

;; 072 :    pin_b4_direction      = output
  bcf     H'003',5
  bcf     H'003',6
  bcf     H'023',4
  bcf     H'00A',3
  bcf     H'00A',4
  call    _3902__vector

;; 073 :    pin_b5_direction      = output
  bcf     H'003',5
  bcf     H'003',6
  bcf     H'023',5
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _3931__vector
e_13582__hd44780_4_init: ; 03C3
_10860__vector: ; 03C3

;; 471 : procedure delay_1s( byte in x = 1 ) is
; var H'02C:000' x
p_10860_delay_1s: ; 03C3
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02C'

;; 472 :    _delay_100us( x, 100, 100 )
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02C',w
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02D'
  movlw   H'64'
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02E'
  movlw   H'64'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _9911__vector
e_10860_delay_1s: ; 03D4
_10815__vector: ; 03D4

;; 467 : procedure delay_500ms( byte in x = 1 ) is
; var H'02C:000' x
p_10815_delay_500ms: ; 03D4
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02C'

;; 468 :    _delay_100us( x, 100, 50 )
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02C',w
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02D'
  movlw   H'64'
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02E'
  movlw   H'32'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _9911__vector
e_10815_delay_500ms: ; 03E5
_10770__vector: ; 03E5

;; 463 : procedure delay_200ms( byte in x = 1 ) is
; var H'02C:000' x
p_10770_delay_200ms: ; 03E5
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02C'

;; 464 :    _delay_100us( x, 100, 20 )
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02C',w
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02D'
  movlw   H'64'
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02E'
  movlw   H'14'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _9911__vector
e_10770_delay_200ms: ; 03F6
_10725__vector: ; 03F6

;; 459 : procedure delay_100ms( byte in x = 1 ) is
; var H'02C:000' x
p_10725_delay_100ms: ; 03F6
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02C'

;; 460 :    _delay_100us( x, 100, 10 )
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02C',w
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02D'
  movlw   H'64'
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02E'
  movlw   H'0A'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _9911__vector
e_10725_delay_100ms: ; 0407
_10590__vector: ; 0407

;; 447 : procedure delay_10ms( byte in x = 1 ) is
; var H'029:000' x
p_10590_delay_10ms: ; 0407
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'029'

;; 448 :    _delay_100us( x, 100, 1 )
  bcf     H'003',5
  bcf     H'003',6
  movf    H'029',w
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02D'
  movlw   H'64'
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02E'
  movlw   H'01'
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _9911__vector
e_10590_delay_10ms: ; 0418
_9911__vector: ; 0418

;; 283 : procedure _delay_100us( byte in x, byte in y, byte in z ) is
; var H'02D:000' x
; var H'02E:000' y
; var H'02F:000' z
p_9911__delay_100us: ; 0418
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02F'

;; 337 :       var byte minus_one = -1
; var H'030:000' minus_one
  movlw   H'FFFFFFFF'
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'030'

;; 339 :       var byte xx, yy
; var H'031:000' xx
; var H'032:000' yy

;; 343 :          local loop_x, loop_y, loop_z, loop_w
; const H'426' loop_w

;; 346 :       loop_z:
as_10129_loop_z: ; 041F

;; 349 :          movfw y
  movf    H'02E',w

;; 350 :          movwf yy
  movwf   H'032'

;; 351 :       loop_y:
as_10126_loop_y: ; 0421

;; 354 :          movfw x
  movf    H'02D',w

;; 355 :          movwf xx
  movwf   H'031'

;; 356 :       loop_x:
as_10123_loop_x: ; 0423

;; 358 :          movlw inner_iterations
  movlw   H'17'

;; 359 :          page loop_w
  bcf     H'00A',3
  bcf     H'00A',4

;; 360 :       loop_w:
as_10132_loop_w: ; 0426

;; 361 :          addwf minus_one, w
  addwf   H'030',w

;; 362 :          skpnc
  skpnc   

;; 363 :             goto loop_w
  goto    as_10132_loop_w

;; 365 :          page loop_x
  bcf     H'00A',3
  bcf     H'00A',4

;; 366 :          decfsz xx, f
  decfsz  H'031',f

;; 367 :          goto loop_x
  goto    as_10123_loop_x

;; 369 :          page loop_y
  bcf     H'00A',3
  bcf     H'00A',4

;; 370 :          decfsz yy, f
  decfsz  H'032',f

;; 371 :          goto loop_y
  goto    as_10126_loop_y

;; 373 :          page loop_z
  bcf     H'00A',3
  bcf     H'00A',4

;; 374 :          decfsz z, f
  decfsz  H'02F',f

;; 375 :          goto loop_z
  goto    as_10129_loop_z
e_9911__delay_100us: ; 0435
  return  
_9794__vector: ; 0436

;; 264 : procedure delay_10uS( byte in x = 1 ) is
; var H'02D:000' x
p_9794_delay_10us: ; 0436
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02D'

;; 265 :    for x loop
; var H'02E:000' _loop_temp_9811
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02D',w
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02E'
w_16613_ag: ; 043F
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02E',f
  bcf     H'00A',3
  bcf     H'00A',4
  btfss   H'003',2
  goto    w_16613_bo
w_16613_jb: ; 0446
  bcf     H'00A',3
  bcf     H'00A',4
  goto    w_16613_be
w_16613_bo: ; 0449

;; 266 :       delay_1uS( 10 )
  movlw   H'0A'
  bcf     H'00A',3
  bcf     H'00A',4
  call    _8638__vector

  bcf     H'003',5
  bcf     H'003',6
  decf    H'02E',f
  bcf     H'00A',3
  bcf     H'00A',4
  goto    w_16613_ag
w_16613_be: ; 0453
e_9794_delay_10us: ; 0453
  return  
_8638__vector: ; 0454

;; 036 : procedure delay_1us( byte in x ) is
; var H'02F:000' x
p_8638_delay_1us: ; 0454
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02F'

;; 174 :          var byte v_overhead   = x_overhead
; var H'030:000' v_overhead
  movlw   H'FFFFFFF4'
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'030'

;; 175 :          var byte v_iteration  = x_iteration
; var H'031:000' v_iteration
  movlw   H'FFFFFFFC'
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'031'

;; 178 :          local loop
; const H'465' loop

;; 179 :             page loop
  bcf     H'00A',3
  bcf     H'00A',4

;; 180 :             movfw x
  movf    H'02F',w

;; 181 :             addwf v_overhead, w
  addwf   H'030',w

;; 182 :             skpc
  skpc    

;; 183 :                retlw 0
  retlw   H'00'

;; 184 :          loop:
as_9321_loop: ; 0465

;; 185 :             addwf v_iteration, w
  addwf   H'031',w

;; 186 :             skpnc
  skpnc   

;; 187 :                goto loop
  goto    as_9321_loop
e_8638_delay_1us: ; 0468
  return  
_8330__vector: ; 0469
p_8330_disable_a_d_functions: ; 0469

;; 1123 :    bank_1
  bcf     H'00A',3
  bcf     H'00A',4
  call    _2679__vector

;; 1124 :    asm movlw 7
  movlw   H'07'

;; 1125 :    asm movwf 0x1F
  movwf   H'01F'

;; 1126 :    bank_0
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _2630__vector
e_8330_disable_a_d_functions: ; 0471
_7447__vector: ; 0471

;; 870 : procedure file_get( byte in a, byte out d ) is begin
; var H'02E:000' a
; var H'02F:000' d
p_7447_file_get: ; 0471
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02F'

;; 874 :    fsr = a
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02E',w
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'004'

;; 875 :    d   = indf
  bcf     H'003',5
  bcf     H'003',6
  movf    H'000',w
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02F'
e_7447_file_get: ; 0480
  return  

;; 795 : procedure pin_b5'put( bit in x at _port_b_buffer : 5 ) is
p_6809__pin_b5__put_t: ; 0481
_6809__vector: ; 0481
; var H'027:005' x
p_6809_put: ; 0481

;; 796 :    _port_b_flush
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _5522__vector
e_6809_put: ; 0484

;; 792 : procedure pin_b4'put( bit in x at _port_b_buffer : 4 ) is
p_6780__pin_b4__put_t: ; 0484
_6780__vector: ; 0484
; var H'027:004' x
p_6780_put: ; 0484

;; 793 :    _port_b_flush
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _5522__vector
e_6780_put: ; 0487

;; 699 : procedure port_b_low'put( byte in x ) is
p_5915__port_b_low__put_t: ; 0487
_5915__vector: ; 0487
; var H'02E:000' x
p_5915_put: ; 0487
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02E'
; var H'02F:000' sqx_temp_5942

;; 700 :    _port_b_buffer = ( _port_b_buffer  & 0xF0 ) | ( x & 0x0F )
  bcf     H'003',5
  bcf     H'003',6
  movf    H'02E',w
  andlw   H'0F'
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02F'
  bcf     H'003',5
  bcf     H'003',6
  movf    H'027',w
  andlw   H'F0'
  bcf     H'003',5
  bcf     H'003',6
  iorwf   H'02F',w
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'027'

;; 701 :    _port_b_flush
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _5522__vector
e_5915_put: ; 049E

;; 676 : procedure port_d'put( byte in x at _port_d_buffer ) is
p_5707__port_d__put_t: ; 049E
_5707__vector: ; 049E
; var H'028:000' x
p_5707_put: ; 049E
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'028'

;; 677 :    _port_d_flush
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _5568__vector
e_5707_put: ; 04A4
_5568__vector: ; 04A4
p_5568__port_d_flush: ; 04A4

;; 661 :    var volatile byte port_d_ at 8 = _port_d_buffer
; var H'008:000' port_d_
  bcf     H'003',5
  bcf     H'003',6
  movf    H'028',w
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'008'
e_5568__port_d_flush: ; 04AA
  return  
_5522__vector: ; 04AB
p_5522__port_b_flush: ; 04AB

;; 655 :    var volatile byte port_b_ at 6 = _port_b_buffer
; var H'006:000' port_b_
  bcf     H'003',5
  bcf     H'003',6
  movf    H'027',w
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'006'
e_5522__port_b_flush: ; 04B1
  return  

;; 570 : procedure port_b_low_direction'put( byte in d ) is
p_4827__port_b_low_direction__put_t: ; 04B2
_4827__vector: ; 04B2
; var H'029:000' d
p_4827_put: ; 04B2
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'029'

;; 571 :    var volatile byte b at trisb = ( trisb & 0xF0 ) | ( d & 0x0F )
; var H'023:000' b
; var H'02A:000' sqx_temp_4858
  bcf     H'003',5
  bcf     H'003',6
  movf    H'029',w
  andlw   H'0F'
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'02A'
  bcf     H'003',5
  bcf     H'003',6
  movf    H'023',w
  andlw   H'F0'
  bcf     H'003',5
  bcf     H'003',6
  iorwf   H'02A',w
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'023'

;; 572 :    _trisb_flush
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _3121__vector
e_4827_put: ; 04C9

;; 469 : procedure pin_b5_direction'put( bit in d at trisb : 5 ) is
p_3931__pin_b5_direction__put_t: ; 04C9
_3931__vector: ; 04C9
; var H'023:005' d
p_3931_put: ; 04C9

;; 470 :    _trisb_flush
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _3121__vector
e_3931_put: ; 04CC

;; 466 : procedure pin_b4_direction'put( bit in d at trisb : 4 ) is
p_3902__pin_b4_direction__put_t: ; 04CC
_3902__vector: ; 04CC
; var H'023:004' d
p_3902_put: ; 04CC

;; 467 :    _trisb_flush
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _3121__vector
e_3902_put: ; 04CF

;; 400 : procedure port_d_direction'put( byte in x at trisd ) is
p_3342__port_d_direction__put_t: ; 04CF
_3342__vector: ; 04CF
; var H'025:000' x
p_3342_put: ; 04CF
  bcf     H'003',5
  bcf     H'003',6
  movwf   H'025'

;; 401 :    _trisd_flush
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _3167__vector
e_3342_put: ; 04D5
_3167__vector: ; 04D5
p_3167__trisd_flush: ; 04D5

;; 371 :    asm movfw trisd
  movf    H'025',w

;; 372 :    bank_1
  bcf     H'00A',3
  bcf     H'00A',4
  call    _2679__vector

;; 373 :    asm movwf 0x8
  movwf   H'008'

;; 374 :    bank_0
  bcf     H'00A',3
  bcf     H'00A',4
  goto    _2630__vector
e_3167__trisd_flush: ; 04DD
_3121__vector: ; 04DD
p_3121__trisb_flush: ; 04DD

;; 358 :       bank movfw trisb
  bcf     H'003',5
  bcf     H'003',6
  movf    H'023',w

;; 359 :            tris  6
  tris    H'006'
e_3121__trisb_flush: ; 04E1
  return  
_2679__vector: ; 04E2
p_2679_bank_1: ; 04E2

;; 261 :       asm bsf status, 5
  bsf     H'003',5

;; 262 :       asm bcf status, 6
  bcf     H'003',6
e_2679_bank_1: ; 04E4
  return  
_2630__vector: ; 04E5
p_2630_bank_0: ; 04E5

;; 253 :       asm bcf status, 5
  bcf     H'003',5

;; 254 :       asm bcf status, 6
  bcf     H'003',6
e_2630_bank_0: ; 04E7
  return  

 END

; ********** variable mapping
; 00:0 : ;
;   indf                           * 0037:19 C:\JalWin\lib\jpic.jal 
; 03:0 : ;
;   status                         * 0040:19 C:\JalWin\lib\jpic.jal 
; 04:0 : ;
;   fsr                            * 0041:19 C:\JalWin\lib\jpic.jal 
; 06:0 : ;
;   port_b_                        * 0655:22 C:\JalWin\lib\jpic.jal 
; 08:0 : ;
;   port_d_                        * 0661:22 C:\JalWin\lib\jpic.jal 
; 0C:0 : ;
;   pir1                           * 0090:20 C:\JalWin\lib\jpic.jal 
; 0C:5 : ;
;   pir1_rcif                      * 0107:20 C:\JalWin\lib\jpic.jal 
; 18:0 : ;
;   rcsta                          * 0085:20 C:\JalWin\lib\jpic.jal 
;   f877_rcsta                     * 0074:19 C:\JalWin\lib\jpic.jal 
; 18:4 : ;
;   rcsta_cren                     * 0101:20 C:\JalWin\lib\jpic.jal 
; 18:7 : ;
;   rcsta_spen                     * 0099:20 C:\JalWin\lib\jpic.jal 
; 20:0 : ;
;    transfer_bit                    
; 20:2 : ;
;    return value                    0173:11 C:\JalWin\lib\h_rs232.jal 
; 21:0 : ;
;    transfer_byte                   
; 22:0 : ;
;   trisa                            0329:10 C:\JalWin\lib\jpic.jal 
; 23:0 : ;
;   b                              * 0571:22 C:\JalWin\lib\jpic.jal 
;   trisb                            0330:10 C:\JalWin\lib\jpic.jal 
; 23:4 : ;
;   d                              * 0466:33 C:\JalWin\lib\jpic.jal 
; 23:5 : ;
;   d                              * 0469:33 C:\JalWin\lib\jpic.jal 
; 24:0 : ;
;   trisc                            0331:10 C:\JalWin\lib\jpic.jal 
; 25:0 : ;
;   x                              * 0400:33 C:\JalWin\lib\jpic.jal 
;   trisd                            0332:10 C:\JalWin\lib\jpic.jal 
; 26:0 : ;
;   trise                            0333:10 C:\JalWin\lib\jpic.jal 
; 27:0 : ;
;   _port_b_buffer                   0646:10 C:\JalWin\lib\jpic.jal 
; 27:4 : ;
;   x                              * 0792:23 C:\JalWin\lib\jpic.jal 
; 27:5 : ;
;   x                              * 0795:23 C:\JalWin\lib\jpic.jal 
; 28:0 : ;
;   x                              * 0676:23 C:\JalWin\lib\jpic.jal 
;   _port_d_buffer                   0648:10 C:\JalWin\lib\jpic.jal 
; 29:0 : ;
;   d                                0570:37 C:\JalWin\lib\jpic.jal 
;   x                                0447:23 C:\JalWin\lib\jdelay.jal 
;   veri                             0021:11 C:\DOCUME~1\002164\Desktop\ONURRO~1\robot.jal 
; 2A:0 : ;
;   sqx_temp_4858                    
;   komut                            0021:16 C:\DOCUME~1\002164\Desktop\ONURRO~1\robot.jal 
; 2B:0 : ;
;   yaz                              0021:22 C:\DOCUME~1\002164\Desktop\ONURRO~1\robot.jal 
; 2C:0 : ;
;   x                                0459:24 C:\JalWin\lib\jdelay.jal 
;   x                                0463:24 C:\JalWin\lib\jdelay.jal 
;   x                                0467:24 C:\JalWin\lib\jdelay.jal 
;   x                                0471:21 C:\JalWin\lib\jdelay.jal 
;   value                            0043:32 C:\JalWin\lib\hd447804.jal 
;   value                            0059:24 C:\JalWin\lib\hd447804.jal 
;   baud_constant                    0018:27 C:\JalWin\lib\h_rs232.jal 
;   x                                0173:26 C:\JalWin\lib\h_rs232.jal 
; 2D:0 : ;
;   x                                0264:23 C:\JalWin\lib\jdelay.jal 
;   x                                0283:25 C:\JalWin\lib\jdelay.jal 
;   value                            0035:23 C:\JalWin\lib\hd447804.jal 
;   data                             0129:26 C:\JalWin\lib\h_rs232.jal 
; 2E:0 : ;
;   x                                0699:27 C:\JalWin\lib\jpic.jal 
;   a                                0870:21 C:\JalWin\lib\jpic.jal 
;   _loop_temp_9811                  0265:04 C:\JalWin\lib\jdelay.jal 
;   y                                0283:36 C:\JalWin\lib\jdelay.jal 
; 2F:0 : ;
;   sqx_temp_5942                    
;   d                                0870:32 C:\JalWin\lib\jpic.jal 
;   x                                0036:22 C:\JalWin\lib\jdelay.jal 
;   z                                0283:47 C:\JalWin\lib\jdelay.jal 
; 30:0 : ;
;   v_overhead                       0174:19 C:\JalWin\lib\jdelay.jal 
;   minus_one                        0337:16 C:\JalWin\lib\jdelay.jal 
; 31:0 : ;
;   v_iteration                      0175:19 C:\JalWin\lib\jdelay.jal 
;   xx                               0339:16 C:\JalWin\lib\jdelay.jal 
; 32:0 : ;
;   yy                               0339:20 C:\JalWin\lib\jdelay.jal 
; 98:0 : ;
;   txsta                          * 0086:20 C:\JalWin\lib\jpic.jal 
; 98:2 : ;
;   txsta_brgh                     * 0096:20 C:\JalWin\lib\jpic.jal 
; 98:5 : ;
;   txsta_txen                     * 0094:20 C:\JalWin\lib\jpic.jal 
; 99:0 : ;
;   spbrg                          * 0087:20 C:\JalWin\lib\jpic.jal 

