FasdUAS 1.101.10   ��   ��    k             l     ��  ��     !/usr/bin/osascript     � 	 	 & ! / u s r / b i n / o s a s c r i p t   
  
 l     ��������  ��  ��        l      ��  ��   {u
For details and documentation:
http://github.com/inkling/Subliminal

Copyright 2013 Inkling Systems, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
     �  � 
 F o r   d e t a i l s   a n d   d o c u m e n t a t i o n : 
 h t t p : / / g i t h u b . c o m / i n k l i n g / S u b l i m i n a l 
 
 C o p y r i g h t   2 0 1 3   I n k l i n g   S y s t e m s ,   I n c . 
 
 L i c e n s e d   u n d e r   t h e   A p a c h e   L i c e n s e ,   V e r s i o n   2 . 0   ( t h e   " L i c e n s e " ) ; 
 y o u   m a y   n o t   u s e   t h i s   f i l e   e x c e p t   i n   c o m p l i a n c e   w i t h   t h e   L i c e n s e . 
 Y o u   m a y   o b t a i n   a   c o p y   o f   t h e   L i c e n s e   a t 
 
 	 h t t p : / / w w w . a p a c h e . o r g / l i c e n s e s / L I C E N S E - 2 . 0 
 
 U n l e s s   r e q u i r e d   b y   a p p l i c a b l e   l a w   o r   a g r e e d   t o   i n   w r i t i n g ,   s o f t w a r e 
 d i s t r i b u t e d   u n d e r   t h e   L i c e n s e   i s   d i s t r i b u t e d   o n   a n   " A S   I S "   B A S I S , 
 W I T H O U T   W A R R A N T I E S   O R   C O N D I T I O N S   O F   A N Y   K I N D ,   e i t h e r   e x p r e s s   o r   i m p l i e d . 
 S e e   t h e   L i c e n s e   f o r   t h e   s p e c i f i c   l a n g u a g e   g o v e r n i n g   p e r m i s s i o n s   a n d 
 l i m i t a t i o n s   u n d e r   t h e   L i c e n s e . 
      l     ��������  ��  ��        l      ��  ��   ��
Waits for an authorization dialog to appear when instruments is launched, 
then dismisses it by entering the specified login password.

This is a workaround for http://openradar.appspot.com/radar?id=1544403.

This script is expected to be put into the background right before 
instruments is launched:

	osascript authorize_instruments "$LOGIN_PASSWORD" &
	# Kill the process when the parent script ends
	trap "kill $!" SIGINT SIGTERM EXIT

	xcrun instruments ...

     �  � 
 W a i t s   f o r   a n   a u t h o r i z a t i o n   d i a l o g   t o   a p p e a r   w h e n   i n s t r u m e n t s   i s   l a u n c h e d ,   
 t h e n   d i s m i s s e s   i t   b y   e n t e r i n g   t h e   s p e c i f i e d   l o g i n   p a s s w o r d . 
 
 T h i s   i s   a   w o r k a r o u n d   f o r   h t t p : / / o p e n r a d a r . a p p s p o t . c o m / r a d a r ? i d = 1 5 4 4 4 0 3 . 
 
 T h i s   s c r i p t   i s   e x p e c t e d   t o   b e   p u t   i n t o   t h e   b a c k g r o u n d   r i g h t   b e f o r e   
 i n s t r u m e n t s   i s   l a u n c h e d : 
 
 	 o s a s c r i p t   a u t h o r i z e _ i n s t r u m e n t s   " $ L O G I N _ P A S S W O R D "   & 
 	 #   K i l l   t h e   p r o c e s s   w h e n   t h e   p a r e n t   s c r i p t   e n d s 
 	 t r a p   " k i l l   $ ! "   S I G I N T   S I G T E R M   E X I T 
 
 	 x c r u n   i n s t r u m e n t s   . . . 
 
      l     ��������  ��  ��        i         I     �� ��
�� .aevtoappnull  �   � ****  o      ���� 0 argv  ��    k     W      !   r      " # " n      $ % $ 4    �� &
�� 
cobj & m    ����  % o     ���� 0 argv   # o      ���� 0 loginpassword loginPassword !  ' ( ' l   ��������  ��  ��   (  ) * ) l   �� + ,��   + J D begin with a short delay, to catch the prompt under the assumption     , � - - �   b e g i n   w i t h   a   s h o r t   d e l a y ,   t o   c a t c h   t h e   p r o m p t   u n d e r   t h e   a s s u m p t i o n   *  . / . l   �� 0 1��   0 F @ that instruments will be launched immediately after this is run    1 � 2 2 �   t h a t   i n s t r u m e n t s   w i l l   b e   l a u n c h e d   i m m e d i a t e l y   a f t e r   t h i s   i s   r u n /  3 4 3 I   �� 5��
�� .sysodelanull��� ��� nmbr 5 m     6 6 @      ��   4  7�� 7 O    W 8 9 8 k    V : :  ; < ; V    ( = > = k    # ? ?  @ A @ l   �� B C��   B H B long delay: it is likely that the prompt will not appear this run    C � D D �   l o n g   d e l a y :   i t   i s   l i k e l y   t h a t   t h e   p r o m p t   w i l l   n o t   a p p e a r   t h i s   r u n A  E F E l   �� G H��   G ; 5 and we don't want to impede instruments' performance    H � I I j   a n d   w e   d o n ' t   w a n t   t o   i m p e d e   i n s t r u m e n t s '   p e r f o r m a n c e F  J�� J I   #�� K��
�� .sysodelanull��� ��� nmbr K m     L L @$      ��  ��   > H     M M E    N O N n     P Q P 1    ��
�� 
pnam Q 2   ��
�� 
prcs O m     R R � S S  S e c u r i t y A g e n t <  T�� T O   ) V U V U k   0 U W W  X Y X r   0 A Z [ Z o   0 1���� 0 loginpassword loginPassword [ n       \ ] \ 1   > @��
�� 
valL ] n   1 > ^ _ ^ 4   ; >�� `
�� 
txtf ` m   < =����  _ n   1 ; a b a 4   8 ;�� c
�� 
scra c m   9 :����  b n   1 8 d e d 4   5 8�� f
�� 
sgrp f m   6 7����  e 4   1 5�� g
�� 
cwin g m   3 4����  Y  h i h I  B R�� j��
�� .prcsclicuiel    ��� uiel j n   B N k l k 4   I N�� m
�� 
butT m m   J M n n � o o  T a k e   C o n t r o l l n   B I p q p 4   F I�� r
�� 
sgrp r m   G H����  q 4   B F�� s
�� 
cwin s m   D E���� ��   i  t�� t l  S U u v w u L   S U����   v A ; just so the script doesn't print the last command executed    w � x x v   j u s t   s o   t h e   s c r i p t   d o e s n ' t   p r i n t   t h e   l a s t   c o m m a n d   e x e c u t e d��   V 4   ) -�� y
�� 
prcs y m   + , z z � { {  S e c u r i t y A g e n t��   9 m     | |�                                                                                  sevs  alis    �  Mercury SSD                ˇ��H+   ��System Events.app                                               N���        ����  	                CoreServices    ˈPI      � PB     �� �� �p  <Mercury SSD:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    M e r c u r y   S S D  -System/Library/CoreServices/System Events.app   / ��  ��     }�� } l     ��������  ��  ��  ��       �� ~ ��   ~ ��
�� .aevtoappnull  �   � ****  �� ���� � ���
�� .aevtoappnull  �   � ****�� 0 argv  ��   � ���� 0 argv   � ���� 6�� |���� R L z������������ n��
�� 
cobj�� 0 loginpassword loginPassword
�� .sysodelanull��� ��� nmbr
�� 
prcs
�� 
pnam
�� 
cwin
�� 
sgrp
�� 
scra
�� 
txtf
�� 
valL
�� 
butT
�� .prcsclicuiel    ��� uiel�� X��k/E�O�j O� G h*�-�,��j [OY��O*��/ '�*�k/�k/�k/�l/�,FO*�k/�l/�a /j OhUUascr  ��ޭ