FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        l      �� 	 
��   	VP
Veritrope.com
Send Safari URL to OmniFocus
Authored by Daniel Compton (http://danielcompton.net)
Version 1.0
September 16, 2011

Project Status, Latest Updates, and Comments Collected at:
http://veritrope.com/code/send-safari-url-to-omnifocus


======================================
// ADDITIONAL CREDITS 
======================================

BASED ON THIS SAFARI/EVERNOTE SCRIPT:
http://veritrope.com/code/safari-tab-list-to-omnifocus

AND THIS SAFARI/CHROME SCRIPT:
http://www.tuaw.com/2011/03/14/use-applescript-to-open-current-safari-url-in-google-chrome/

======================================
// CHANGELOG
======================================
1.00    INITIAL RELEASE

======================================
// RECOMMENDED INSTALLATION INSTRUCTIONS:
======================================


Just double-click on the script!

Launch the script with whatever script launcher you like best. I use quicksilver (qsapp.com)
but Launchbar (http://www.obdev.at/products/launchbar/index.html) and FastScripts 
(http://www.red-sweater.com/fastscripts/) are good too.

FastScripts Installation (Optional, but recommended):
--Download and Install FastScripts from http://www.red-sweater.com/fastscripts/index.html
--Copy script or an Alias to ~/Library/Scripts/Applications/NAME OF APP
--Set up your keyboard shortcut
    
 �  
�  
 V e r i t r o p e . c o m  
 S e n d   S a f a r i   U R L   t o   O m n i F o c u s  
 A u t h o r e d   b y   D a n i e l   C o m p t o n   ( h t t p : / / d a n i e l c o m p t o n . n e t )  
 V e r s i o n   1 . 0  
 S e p t e m b e r   1 6 ,   2 0 1 1  
  
 P r o j e c t   S t a t u s ,   L a t e s t   U p d a t e s ,   a n d   C o m m e n t s   C o l l e c t e d   a t :  
 h t t p : / / v e r i t r o p e . c o m / c o d e / s e n d - s a f a r i - u r l - t o - o m n i f o c u s  
  
  
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 / /   A D D I T I O N A L   C R E D I T S    
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
  
 B A S E D   O N   T H I S   S A F A R I / E V E R N O T E   S C R I P T :  
 h t t p : / / v e r i t r o p e . c o m / c o d e / s a f a r i - t a b - l i s t - t o - o m n i f o c u s  
  
 A N D   T H I S   S A F A R I / C H R O M E   S C R I P T :  
 h t t p : / / w w w . t u a w . c o m / 2 0 1 1 / 0 3 / 1 4 / u s e - a p p l e s c r i p t - t o - o p e n - c u r r e n t - s a f a r i - u r l - i n - g o o g l e - c h r o m e /  
  
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 / /   C H A N G E L O G  
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 1 . 0 0         I N I T I A L   R E L E A S E  
  
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 / /   R E C O M M E N D E D   I N S T A L L A T I O N   I N S T R U C T I O N S :  
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
  
  
 J u s t   d o u b l e - c l i c k   o n   t h e   s c r i p t !  
  
 L a u n c h   t h e   s c r i p t   w i t h   w h a t e v e r   s c r i p t   l a u n c h e r   y o u   l i k e   b e s t .   I   u s e   q u i c k s i l v e r   ( q s a p p . c o m )  
 b u t   L a u n c h b a r   ( h t t p : / / w w w . o b d e v . a t / p r o d u c t s / l a u n c h b a r / i n d e x . h t m l )   a n d   F a s t S c r i p t s    
 ( h t t p : / / w w w . r e d - s w e a t e r . c o m / f a s t s c r i p t s / )   a r e   g o o d   t o o .  
  
 F a s t S c r i p t s   I n s t a l l a t i o n   ( O p t i o n a l ,   b u t   r e c o m m e n d e d ) :  
 - - D o w n l o a d   a n d   I n s t a l l   F a s t S c r i p t s   f r o m   h t t p : / / w w w . r e d - s w e a t e r . c o m / f a s t s c r i p t s / i n d e x . h t m l  
 - - C o p y   s c r i p t   o r   a n   A l i a s   t o   ~ / L i b r a r y / S c r i p t s / A p p l i c a t i o n s / N A M E   O F   A P P  
 - - S e t   u p   y o u r   k e y b o a r d   s h o r t c u t  
      l     ��������  ��  ��        l     ��������  ��  ��        l      ��  ��    k e 
======================================
// MAIN PROGRAM 
======================================
     �   �    
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 / /   M A I N   P R O G R A M    
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
      l     ��������  ��  ��        l     ����  O         k           r         l    !���� ! n     " # " 1   
 ��
�� 
pURL # n    
 $ % $ 1    
��
�� 
cTab % 4    �� &
�� 
cwin & m    ���� ��  ��     o      ���� 0 theurl theURL   '�� ' r     ( ) ( l    *���� * n     + , + 1    ��
�� 
pnam , n     - . - 1    ��
�� 
cTab . 4    �� /
�� 
cwin / m    ���� ��  ��   ) o      ���� 0 thename theName��    m      0 0�                                                                                  sfri  alis    B  SERENiTY                   ����H+    i
Safari.app                                                      
Qe͜H�        ����  	                Applications    ��0$      ͜��      i  !SERENiTY:Applications: Safari.app    
 S a f a r i . a p p    S E R E N i T Y  Applications/Safari.app   / ��  ��  ��     1 2 1 l     ��������  ��  ��   2  3 4 3 l   1 5���� 5 O    1 6 7 6 I  " 0���� 8
�� .corecrel****      � null��   8 �� 9 :
�� 
kocl 9 m   $ %��
�� 
FCit : �� ;��
�� 
prdt ; K   & , < < �� = >
�� 
pnam = l  ' ( ?���� ? o   ' (���� 0 thename theName��  ��   > �� @��
�� 
FCno @ o   ) *���� 0 theurl theURL��  ��   7 n     A B A 4   �� C
�� 
docu C m    ����  B m     D D�                                                                                  OFOC  alis    L  SERENiTY                   ����H+    iOmniFocus.app                                                   ��Ν��        ����  	                Applications    ��0$      Ν�^      i  $SERENiTY:Applications: OmniFocus.app    O m n i F o c u s . a p p    S E R E N i T Y  Applications/OmniFocus.app  / ��  ��  ��   4  E F E l     ��������  ��  ��   F  G H G l     ��������  ��  ��   H  I�� I l     ��������  ��  ��  ��       �� J K��   J ��
�� .aevtoappnull  �   � **** K �� L���� M N��
�� .aevtoappnull  �   � **** L k     1 O O   P P  3����  ��  ��   M   N  0������������ D��������������
�� 
cwin
�� 
cTab
�� 
pURL�� 0 theurl theURL
�� 
pnam�� 0 thename theName
�� 
docu
�� 
kocl
�� 
FCit
�� 
prdt
�� 
FCno�� 
�� .corecrel****      � null�� 2� *�k/�,�,E�O*�k/�,�,E�UO��k/ *��������� Uascr  ��ޭ